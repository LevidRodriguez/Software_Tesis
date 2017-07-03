function [im2] = fun_reduce(im, factor_reduccion)
% Unicamente las hace mas peque?as


% clear all;
% close all;
% clc;
% 
% factor_reduccion=0.01;
% 
% im=imread('E:\RML\Investigaci?n_mx\reales2\cc16.bmp');


im=double(im);
[TamInY,TamInX]=size(im);

TamFinX=floor(TamInX*factor_reduccion);
TamFinY=floor(TamInY*factor_reduccion);

quita_en_x=floor((TamInX-TamFinX)/2);
quita_en_y=floor((TamInY-TamFinY)/2);

IM=fftshift(fft2(im));
% figure; imshow(log(abs(IM)),[]);
IM2=IM(quita_en_y+1:TamInY-quita_en_y, quita_en_x+1:TamInX-quita_en_x);
% figure; imshow(log(abs(IM2)),[]);
im2=ifft2(ifftshift(IM2));
im2=(real(im2));
m=min(im2);m=min(m);
M=max(im2);M=max(M);
im2=(im2-m)*(255/(M-m));
im2=uint8(im2);
% figure; imshow(im2);

