%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Cargar Datos
[ID, Ideal,Real,Error, Desp] = textread('ErrorPromedio.txt','%d %d %d %d %d');

P_Ideal = polyfit(ID,Ideal, 1);
p_Ideal = polyval(P_Ideal, ID);

plot(ID,p_Ideal,'-*b','LineWidth',2,'markersize',10,'markerfacecolor','r');
hold on
grid minor
plot(ID,Real,'--+r','LineWidth',2,'markersize',10,'markerfacecolor','b'); 
P_Real = polyfit(ID,Real, 1);
p_Real = polyval(P_Real, ID);
%plot(ID,p_Real);
%plot(ID,Error); 
hold off
title('Error en Distancias')
xlabel('Prueba')
ylabel('Distancia')
xlim([-1 10])
ylim([-5 100])


figure;
plot(Ideal, Desp); 
grid minor
title('Error en Desplazamiento')
xlabel('Prueba')
ylabel('Distancia')
xlim([-1 10])
ylim([-5 100])

% y =ax+b
% y_ideal = 10X
% y_real = 11.5X + 0.2000