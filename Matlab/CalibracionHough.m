%% Programa de procesamiento de Imagenes
clear all;  %   limpia variabels
close all;  %   cierra todas las ventanas abiertas 
clc;        %   Limpia la consola
%%  Abrir Directorio de las Imagenes
address = '../ImagenesTest/';
name_directory = dir(strcat(address,'*.png'));
%% Archivo para guardar datos
file  = fopen('bloque_testXXXX.txt','w');
%% Procesamiento de todas las imagenes en el directorio 
for i = 1: length(name_directory)
    file_name = name_directory(i).name;
    %% Abrir cada una de las imagenes
    img = imread(strcat(address,file_name));
    %% Convertir en escala de grises
    [cy, cx, cz] = size(img);
    %% Convertir Imagen Diezmada en Niveles de Gris
    if cz > 1 
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end
    %% Determinacion de contornos
    BW = edge(img_gray, 'canny');
    % Gradiente = ContoursDetection(img_binary, 5);
    %% Determinar la Transformada de Hough y Deteccion de Lineas
    [H, T, R] = hough(BW);
    figure; imshow(H,[],'XData', T,'YData',R,'InitialMagnification','fit');
    xlabel('\theta'); ylabel('\rho');
    axis on, axis normal, hold on;
    
    P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%     P = SelectCorrectLine(P);
%     r= find(P(:,1)>1000 & P(:,2)>100);
%     P(r,:)=[]
    x = T(P(:,2)); y = R(P(:,1));
    Pxy=[y',x'];
    plot(x,y,'s','color', 'red');
    GraficaLineasHoug(P(:,:),img, BW,T,R);
    % Calcular su angulo(de Hough) de la linea que nos interesa
    fprintf(file,'%s\n',file_name);
    fprintf('Imagen: %s \n',file_name);
    file_write(file, Pxy);
    hold off
end
fclose(file);

