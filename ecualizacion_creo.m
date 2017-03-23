im_color  = imread('1.png','png');
img_gray = rgb2gray(im_color);
im = (((img_gray - 200)*255)/ 255);
im = 1- im;
% figure;
% imshow(im,[]);
im = im_gray.*im;
figure;
imshow(im);