function [Woods] = fun_woods(im1,im2)
% Calcula el criterio de woods entre dos matrices de tama?o M*N en donde
% los datos son de tipo double

% clear all;
% close all;
% clc;

% im1=imread('E:\RML\Investigaci?n_mx\a0.bmp');
% im2=imread('E:\RML\Investigaci?n_mx\a27.bmp');
% % im1=rgb2gray(im1);
% % im2=rgb2gray(im2);
% im1=double(im1);
% im2=double(im2);
% % im1=[0 2 0 2 3; 1 2 1 0 3; 1 2 0 1 3; 2 1 3 0 3];
% % im2=[0 2 3 2 0; 1 2 1 0 3; 3 3 0 3 1; 0 1 2 0 2];

[sy,sx]=size(im1);

% Construccion del histograma de conjunto
H=zeros(256,256);
for y=1:sy
    for x=1:sx
        j=im1(y,x);
        i=im2(y,x);
        H(j+1,i+1)=H(j+1,i+1)+1;
    end
end

pij=H/(sx*sy);
% figure; imshow(pij,[]);
pj=sum(pij,2);

% para evitar los NaN
for j=1:256;
    if pj(j)==0
        pj(j)=1;
    end
end

mI_J=zeros(256,1);
i=0:255;
it=i';
SUMipij=pij*it;
mI_J=SUMipij./pj;
mI_J=mI_J';
i_mI_J=zeros(256,256);
for j=1:256
    i_mI_J(j,:)=i-mI_J(j);
end
i_mI_J2=i_mI_J.*i_mI_J;%   Hasta aqui voy bien
i_mI_J2pij=i_mI_J2.*pij;
SUMi_mI_J2pij=sum(i_mI_J2pij,2);
Varianza=SUMi_mI_J2pij./pj;

Woods=Varianza./mI_J';
% para evitar los NaN
for j=1:256;
    if mI_J(j)==0
        Woods(j)=0;
    end
end
Woods=Woods.*pj;
Woods=sum(Woods);

