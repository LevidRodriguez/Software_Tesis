%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Cargar Datos
%% Desplazamiento 
% [ID, Ideal,Real,Error, Desp] = textread('ErrorPromedio.txt','%d %d %d %d %d');
% %% Angulo Positivos
% [ID, Ideal,Real,Error] = textread('ErrorPromedioGradosPos.txt','%d %d %d %d');
%% Angulo Negativos
% [ID, Ideal,Real,Error] = textread('ErrorPromedioGradosNeg.txt','%d %d %d %d');
%% Angulo All
[ID, Ideal,Real,Error] = textread('ErrorPromedioGrados.txt','%d %d %d %d');

%% Ecuacion  
P_Ideal = polyfit(ID,Ideal, 1);
p_Ideal = polyval(P_Ideal, ID);
%% Graficas
plot(ID,p_Ideal,'-*b','LineWidth',2,'markersize',10,'markerfacecolor','r');
hold on
grid minor
plot(ID,Real,'--+r','LineWidth',2,'markersize',10,'markerfacecolor','b'); 

P_Real = polyfit(ID,Real, 1);
p_Real = polyval(P_Real, ID);

plot(ID,p_Real,'-ok','LineWidth',2,'markersize',10,'markerfacecolor','k');

hold off
% title('Error en Distancias', 'FontSize',20,'FontWeight','bold','Color','k')
% xlabel('Prueba #', 'FontSize',15,'FontWeight','bold','Color','k')
% ylabel('Distancia[cm]','FontSize',15,'FontWeight','bold','Color','k')
title('Error de Rotaciones', 'FontSize',20,'FontWeight','bold','Color','k')
xlabel('Prueba #', 'FontSize',15,'FontWeight','bold','Color','k')
ylabel('Angulo[grados]','FontSize',15,'FontWeight','bold','Color','k')
%% Angulo Positivos y Desplazamientos
% xlim([-1 7])
% ylim([-5 100])
% %% Angulo Negativos
% xlim([-1 7])
% ylim([-100 10])
%% Angulo All
xlim([-1 13])
ylim([-101 101])
%% Desplazamientos
% figure;
% plot(Ideal, Desp,'--ob','LineWidth',2,'markersize',10,'markerfacecolor','b'); 
% grid minor
% title('Error en Desplazamiento', 'FontSize',20,'FontWeight','bold','Color','k')
% xlabel('Distancia[cm]','FontSize',15,'FontWeight','bold','Color','k')
% ylabel('Desplazamiento[cm]','FontSize',15,'FontWeight','bold','Color','k')
% xlim([-5 100])
% ylim([-1 10])

% y =ax+b
%% Desplazamientos
% y_ideal = 10X
% y_real = 11.5X + 0.2000
%% Rotaciones
% Negativo
% y_ideal = 15X - 90
% y_real = 13.93X - 82.64
% Positivo
% y_ideal = 15X
% y_real = 15.72X + 0.143
% All
% y_ideal = 15X - 90
% y_real = 14.73X - 84.92


