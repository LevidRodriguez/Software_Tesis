%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Cargar Datos
[ID, Ideal,Real,Error, Desp] = textread('ErrorPromedio.txt','%d %d %d %d %d');
plot(ID,Ideal);
hold on
grid minor
plot(ID,Real); 
%plot(ID,Error); 
%plot(ID, Desp); 
hold off