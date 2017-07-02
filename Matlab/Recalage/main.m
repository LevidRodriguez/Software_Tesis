close all
clear all
clc
%% Images Directory
address = '../../ImagenesTest/Recalage/';
name_directory = dir(strcat(address,'*.png'));
for i = 1: length(name_directory)
    file_nameR = name_directory(i).name;
    file_name2T = name_directory(i+1).name;
    %% get Image
    imgR = imread(strcat(address,file_nameR));
    img2T = imread(strcat(address,file_name2T));
    %% Matriz de Proyectiva
    % Escala - Iguales cuando se maneja rotaciones sin manejar perspectiva de lo contrario son independientes  
    Ax = 1; Ay = 1; Th = 0.9; Dx = 0; Dy = 0; a31 = 0.00005; a32 = -0.0008;
    H = [Ax*cosd(Th) -2*Ay*sind(Th) Dx; Ay*sind(Th) 1.4*Ax*cosd(Th)  Dy; a31 a32 1];
    %% Corregir Perpectiva
    imgR = CorrecionXDefConProyectiva(imgR, H);
    Ax = 1; Ay = 1; Th = 0.9; Dx = 0; Dy = 0; a31 = 0.000025; a32 = -0.00182;
    H = [Ax*cosd(Th) -2*Ay*sind(Th) Dx; Ay*sind(Th) 1.4*Ax*cosd(Th)  Dy; a31 a32 1];
    img2T = CorrecionXDefConProyectiva(img2T, H);
    %% Recalage entre img_Referencia e img_Actual
    [A1_, Dcx_, Dcy_, Y, X] = RecalageT(imgR, img2T);
    
end