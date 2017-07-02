function [ A, Dcx, Dcy,Y,X] = RecalageT(imgReferencia, img2Transform)
    close all;
    clc;
    tic
    im1= imgReferencia;
    im2= img2Transform;
    % Normaliza imagenes
    im1d=double(im1);
    im2d=double(im2);
    im1d=filtPasBa(im1d,0.5);
    im2d=filtPasBa(im2d,0.5);
    
    m=min(min(double(im1d)));
    M=max(max(double(im1d)));
    im1d=(im1d-m)*(255/(M-m));
    m=min(min(double(im2d)));
    M=max(max(double(im2d)));
    im2d=(im2d-m)*(255/(M-m));
    im1=uint8(im1d);
    im2=uint8(im2d);
    
    D_A=32; % D_A = Delta_Angulo = 32, 16, 8, 4, 2, 1 (grados)
    h=12;   % h = altura = 12, 24, 48, 96, 192 (pixeles)
    DeltaCent=1;
    DYi_=-4;
    DYs_= 4;
    DeltaDY=1;  % Siempre debe ser entero
    DXi_=-5;
    DXs_= 6;
    DeltaDX=1;  % Siempre debe ser entero

    conta=1;
    fin1=0;
    fin2=0;

    NumeroIteracion=0;
    while fin1~=1 | fin2~=1
        NumeroIteracion=NumeroIteracion+1;
        if NumeroIteracion==1
            % Calculo del factor de reducci?n para la primera iteraci?n
            [zy,zx]=size(im1);
            m=min(zy,zx); m=min(m); 
            m2=m;
            i=0;
            while m2>14
                m2=m2/2;
                i=i+1;
            end
            factor_reduccion=0.5.^(i-1); % antes : factor_reduccion=1/16;
        elseif factor_reduccion<1
            factor_reduccion=factor_reduccion*2;
            multiplicaDcx=1;
            if factor_reduccion==1
                fin1=1;
            end
        end
        % ....................................................................1
        im1p=funreduce(im1, factor_reduccion);
        im2p=funreduce(im2, factor_reduccion);

        zim1p=size(im1p);
        m3=min(zim1p);
        radiomin=floor(m3/2);
        % ....................................................................2
        if NumeroIteracion==1
            % Calculo de Dcxi, Dcxs, Dcyi, Dcys para la primera iteraci?n
            [zy2,zx2]=size(im1p);
            Dcxi=-ceil(zx2/3); % antes: Dcxi=-3;   Aqui hay que modif para que permita mas desplazamientos
            Dcxs=-Dcxi;         % antes: Dcxs= 3;
            Dcyi=-ceil(zy2/3); % antes: Dcyi=-3;   Aqui hay que modif para que permita mas desplazamientos
            Dcys=-Dcyi;         % antes: Dcys= 3;
        elseif multiplicaDcx==1;
            % Calculo de Dcxi, Dcxs, Dcyi, Dcys para la enesima iteraci?n
            Dcxi=(2*Dcx)-1;
            Dcxs=(2*Dcx)+1;
            Dcyi=(2*Dcy)-1;
            Dcys=(2*Dcy)+1;    
        end
            multiplicaDcx=0;

        if NumeroIteracion==1
            DAng=D_A;   %360/11.25; % Esta division debe dar un numero entero preferentemente
            DXi=DXi_;   % Desplazamiento para determinar el angulo de rotaci?n (DXs-DXi < NVA)
            DXs=DXs_;   % en pixels ( un pixel corresponde una rotaci?n de NVA? )
        elseif DAng>1
            DAng=DAng/2;
            DXi=(2*DX)-1;
            DXs=(2*DX)+1;
            if DAng<=1
                fin2=1;
            end
        else
            DXi=DX-1;
            DXs=DX+1;
        end    
        NVA=floor(360/DAng); % Numero de Vectores Angulares. ***No CAMBIAR esta linea***
        if NumeroIteracion==1
            altura=h;
            DYi=DYi_;   % Desplazamiento para determinar la escala
            DYs=DYs_;
        elseif altura<192
            altura=altura*2;
            DYi=(2*DY)-3;
            DYs=(2*DY)+3;
        else
            DYi=DY-3;
            DYs=DY+3;
        end
        % ....................................................................2
        if NumeroIteracion<5
            cantidad=floor((altura/2.5)*(NVA/2.5));
        else
            cantidad=floor((altura/2.5)*(NVA/ (2.5*conta) ));
            conta=conta+0.5;
        end
        
        [IM1, Base]=funrecapolaloginterp_BaseN_para_imagen_coarse_to_fine(im1p, DAng, altura, 0, 0, 0, 0, 1);
        [IM2, Base]=funrecapolaloginterp_BaseN_para_imagen_coarse_to_fine(im2p, DAng, altura, Dcxi, Dcxs, Dcyi, Dcys, DeltaCent);
        
        IM2b=fun_circshiftea(IM2, DYi, DYs, DeltaDY, DXi, DXs, DeltaDX);
        
        SD=fun_SD_(IM1, IM2b);
        W = woods(IM1, IM2b);
       
        % [c Ic]=min(SD);
        [c Ic]=min(W);
        [d,Id]=min(c);
        [e,Ie]=min(d);
        [f,If]=min(e);

        w=If;               % w esta relacionada con DX
        v=Ie(1,1,1,w);      % v esta relacionada con DY
        z=Id(1,1,v,w);      % z esta relacionada con Dcy
        x=Ic(1,z,v,w);      % x esta relacionada con Dcx
        % y=Ib(1,x,z,v,w);
        HubicacionMinimo=[x,z,v,w];

        Dcx=   Dcxi+((x-1)*DeltaCent);
        Dcy=   Dcyi+((z-1)*DeltaCent);
        DY =   DYi +((v-1)*DeltaDY);
        DX =   DXi +((w-1)*DeltaDX);
        [Dcx, Dcy, Base.^(-DY), -DX]; % [Desplazamiento en x, Desplazamiento en y, Escala Rotaci?n]

    end

    ['Desplazamiento en x   Desplazamiento en y     Escala      Angulo de rotaci?n']
    [Dcx, Dcy, Base.^(-DY), -DX]
    A1=Base.^(-DY);
    toc
end