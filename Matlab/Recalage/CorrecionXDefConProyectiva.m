function [im2] = CorrecionXDefConProyectiva(im, a)
    % Funcion Para Deformar Con Proyectiva
    % im = imagen de entrada, la cual sera deformada
    % a = matriz de poyectiva la cual sera aplicada a im
    ia=inv(a);
    [sy sx sz]=size(im);
    if sz>1
        im=rgb2gray(im);
    end
    im=double(im);
    [sy,sx]=size(im);
    im2=zeros(sy,sx);
    xc=(sx/2)+0.5;
    yc=(sy/2)+0.5;
    tic
    for j=1:sy
        for i=1:sx
         x=i-xc;
         y=yc-j; 
         xyz=[x; y; 1];
         % uvw=ia\xyz;
         uvw=ia*xyz; 
         u=uvw(1);
         v=uvw(2);
         w=uvw(3);
         xi=u/w;
         yi=v/w;
         xo=xi+xc;
         yo=yc-yi; 
         xa=floor(xo);
         xb=ceil(xo);
         ya=floor(yo);
         yb=ceil(yo);
         Dxa=xo-xa;
         Dxb=xb-xo;
         Dya=yo-ya;
         Dyb=yb-yo;
         % Areas para el interpolado
         A11=Dxa*Dya;       % A11   A12
         A12=Dxb*Dya;       %
         A21=Dxa*Dyb;       % A21   A22
         A22=Dxb*Dyb;
         if xo>=1 & xo<=sx & yo>=1 & yo<=sy
             if Dxa ==0 & Dya==0
                 im2(j,i)=im(yo, xo);
             elseif Dxa==0 & Dya ~=0
                 im2(j,i)=(im(ya, xo)*Dyb) + (im(yb, xo)*Dya);
             elseif Dxa ~=0 & Dya ==0
                 im2(j,i)=(im(yo, xa)*Dxb) + (im(yo, xb)*Dxa);
             else 
                 im2(j,i)=(im(ya, xa)*A22) + (im(ya, xb)*A21) + (im(yb, xa)*A12) + (im(yb, xb)*A11);
             end
         end
        end
    end
    im2=uint8(im2);
end