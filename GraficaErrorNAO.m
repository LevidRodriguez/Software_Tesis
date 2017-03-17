%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Cargar Datos
[ID, Ideal,Real,Error, Desp] = textread('ErrorPromedio.txt','%d %d %d %d %d');
plot(ID,Ideal, 'ro','markersize',4,'markerfacecolor','r');
P_Ideal = polyfit(ID,Ideal, 1);
p_Ideal = polyval(P_Ideal, ID);
% plot(ID,p_Ideal);

hold on
grid minor
% plot(ID,Real,'*','markersize',4,'markerfacecolor','b'); 
% P_Real = polyfit(ID,Real, 1);
% p_Real = polyval(P_Real, ID);
% plot(ID,p_Real);
% %plot(ID,Error); 
% %plot(ID, Desp); 
hold off

% y =ax+b
% y_ideal = 10X
% y_real = 11.5X + 0.2000