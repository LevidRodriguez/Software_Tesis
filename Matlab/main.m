%% Programa de procesamiento de Imagenes
clear all;  %   limpia variabels
close all;  %   cierra todas las ventanas abiertas 
clc;        %   Limpia la consola
tic;
%%  Abrir Directorio de las Imagenes
% address = '../Software_Tesis_Python/ImgsNAO1G/';
address = '../ImagenesTest/';
name_directory = dir(strcat(address,'*.png'));
%% Archivo para guardar datos
file  = fopen('bloque_test.txt','w');
%% Procesamiento de todas las imagenes en el directorio 
for i = 1: length(name_directory)
    file_name = name_directory(i).name;
    %% Abrir cada una de las imagenes
    img = imread(strcat(address,file_name));
    %% Convertir en escala de grises
    [cy, cx, cz] = size(img);
    %% Diezmar
    img = img(1:1:cy, 1:1:cx,:);
    [cy, cx, cz] = size(img);
    diagonal = sqrt(cy*cy+cx*cx);
    %% Convertir Imagen Diezmada en Niveles de Gris
    if cz > 1 
        img_gray = rgb2gray(img);
    else
        img_gray = img;
    end
    %% Calculo del Histograma
    img_histogram = imhist(img_gray);
    % plot(img_histogram);
    % title('\fontsize{25}Histograma');
    % grid on
    % grid minor
    %% Elimina paredes o Eliminacion de Ruido  
    img_binary = 1-(((img_gray-200)*255)/255);
    %                           ^ Ubralizacion a partir de la forma del
    %                           Histograma
    %figure; imshow(img_binary,[]);
    %% Guarda la Imagen sin paredes
    % new_file_name = strsplit(file_name,'.');
    % imwrite(double(img_binary),strcat(new_file_name {1},'_binarizada.png'));
    %% Determinacion de contornos en la Imagen mediante el Gradiente (1)
    % Gradiente = ContoursDetection(img_binary, 1);
    Gradiente = ContoursDetection(img_binary, 5);
    % figure; imshow(Gradiente,[]);
    %% Determinar la Transformada de Hough
    [H, T, R] = hough(Gradiente);
    
    H_Original = H;
    H = floor(log10(H+1));
    H = floor(exp(H));
    
    figure; imshow(H,[],'XData', T,'YData',R,'InitialMagnification','fit');
    xlabel('\theta'); ylabel('\rho');
    axis on, axis normal, hold on;
     %% Deteccion de Lineas
    Px  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
    x = T(Px(:,2)); y = R(Px(:,1));
    Pxy=[y',x'];
    plot(x,y,'s','color', 'red');
    %% Localizacion de la linea de mayor longitud 
    P = FindLineMaxLength(H)
    P2 = P;
    %% Elegir las lineas cercanas de 83  a 90 y de -83 a -90
    P = SelectCorrectLine(P)
    %% Maximo Local
    P = FindMaximoLocal(H_Original, P)
    % GraficaLineasHoug(P,img, img_binary,T,R);
    % Calcular su angulo(de Hough) de la linea que nos interesa
    angulo = P(:,2)-91;
    % Tabular angulo vs angulo del robot vs Nombre de la imagen
    numImg = strsplit(file_name,'_');
    fprintf(file,'%s\t%s\t%d\n',numImg{1},file_name,angulo);
    
    x = T(P(:,2)); y = R(P(:,1));
    Pxy=[y',x']
    plot(x,y,'s','color', 'g'); 
    
    GraficaLineasHoug(P,img_gray, img_binary,T,R);
    fprintf('Imagen: %s Angulo: %d Grados...Procesada\n',file_name,angulo);
    %% Realizar el Seguimiento de un grupo de pixeles 
    
end
fclose(file);
hold off
toc;