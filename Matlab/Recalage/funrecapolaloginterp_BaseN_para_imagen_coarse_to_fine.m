function [IMP,Base] = fun_Rec_a_Pol_a_Log_BaseN_para_imagen_coarse_to_fine(im, DAng, altura, Dcxi, Dcxs, Dcyi, Dcys, DeltaCent)
% clear all; close all; clc;
% im=imread('C:\RML\para trabajar\Investigacion_mx_2010\New\pedacitito_cc01.bmp');



% im=imread('E:\RML\Investigación_mx\reales2\pedazos\cc01.bmp');
% factor_reduccion=1/32;
% imp=funreduce(im, factor_reduccion);
% figure; imshow(imp);
% 
% Dcxi=-2;
% Dcxs= 2;
% Dcyi=-0;
% Dcys= 0;
% DeltaCent=1;
% DAng=2;
% im=imp;


DAng=floor(DAng);
[Ny,Nx]=size(im);
Mx=360;
My=ceil((sqrt((Nx*Nx)+(Ny*Ny))/2)+1);
cx=floor(Nx/2)+0.5;
cy=floor(Ny/2)+0.5;
Base=My.^(1/altura);   % Con esta base cualquier imagen (de cualquier tamano)
                  % sera mapeada en una imagen con altura siempre de 200.

t=1:altura-1; %My-1
h=Base.^t;
t2=0:DAng:Mx-1;
cosdit=cosd(t2);
sindit=sind(t2);

NCentX=uint8(((Dcxs-Dcxi)/DeltaCent)+1);
NCentY=uint8(((Dcys-Dcyi)/DeltaCent)+1);
IMP=zeros(altura, uint8(Mx/DAng), NCentX);% , NCentY);

k2=0;
for a23=Dcyi:DeltaCent:Dcys
    k2=k2+1;
    k1=0;
    for a13=Dcxi:DeltaCent:Dcxs
        k1=k1+1;
        k0=0;
        for i=0:DAng:Mx-1
            k0=k0+1;
%             cosdi=cosd(i);
%             sindi=sind(i);
            for j=1:altura-1 %My-1
%                 h=Base.^j;
                x=h(j)*cosdit(k0);
                y=h(j)*sindit(k0);
                yy=cy - y + a23; % + 1.0;
                xx=x + cx - a13; % + 0.5;
                if xx>=1 & xx<=Nx & yy>1 & yy<=Ny
                    xi=floor(xx);
                    xs=ceil(xx);
                    yi=floor(yy);
                    ys=ceil(yy);
                    dxi=xx-xi;
                    dxs=xs-xx;
                    dyi=yy-yi;
                    dys=ys-yy;
                    if xi==xs & yi==ys
                        IMP(altura-j+1,k0,k1,k2)=im(yy,xx);
                    elseif xi==xs & yi~=ys
                        IMP(altura-j+1,k0,k1,k2)=(im(yi,xx)*dys) + (im(ys,xx)*dyi);
                    elseif xi~=xs & yi==ys
                        IMP(altura-j+1,k0,k1,k2)=(im(yy,xi)*dxs) + (im(yy,xs)*dxi);
                    else
                        IMP(altura-j+1,k0,k1,k2)=(im(yi,xi)*dys*dxs) + (im(yi,xs)*dys*dxi) + (im(ys,xi)*dyi*dxs) + (im(ys,xs)*dyi*dxi);
                    end        
                end
            end
        end
    end
end

% figure; imshow(IMP(:,:,1,1),[]);
% figure; imshow(IMP(:,:,2,1),[]);
% figure; imshow(IMP(:,:,3,1),[]);
% figure; imshow(IMP(:,:,4,1),[]);
% figure; imshow(IMP(:,:,5,1),[]);
