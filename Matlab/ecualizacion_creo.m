close all
clear all
clc

im_color  = imread('14.png','png');
img_gray = rgb2gray(im_color);
% figure;
% imshow(img_gray);
im = (((img_gray - 200)*255)/ 255);
im = 1- im;
% figure;
% imshow(im,[]);
im = img_gray.*im;
figure;
imshow(im);
figure;
imshow(histeq(img_gray));