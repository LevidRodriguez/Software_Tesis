function [imf] = filtroPasaBajas(im,r)

% Esta función filtra (en el dominio de la frecuencia) una imagen de tamaño
% MxN en donde M y N pueden o no ser numeros pares. La mascara H(jw) la
% centra con respecto a la componente de CD del espectro de la imagen
%      N
%   % % % %
% M % % % %
%   % % % %
% im=imagen de entrada que sera filtrada de tipo double
% r=frecuencoa de corte (normalizada de 0 a 1)

[sy,sx]=size(im);
csx=sx/2;
csy=sy/2;

W=zeros(sy,sx);

if csx-floor(csx)==0    % quiere decir que N es numero par
    cx=csx+1;
else
    cx=csx+0.5;
end

if csy-floor(csy)==0    % quiere decir que M es numero par
    cy=csy+1;
else
    cy=csy+0.5;
end

for i=1:sx
    for j=1:sy
        x=i-cx;
        y=j-cy;
        a=(sx*r)/2;
        b=(sy*r)/2;
        if ((x/a).^2)+((y/b).^2)<=1
            W(j,i)=1;
        end
    end
end
% figure; imshow(W,[]);
F=fftshift(fft2(im));
Ff=F.*W;
imf=ifft2(ifftshift(Ff));
