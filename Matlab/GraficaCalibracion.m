%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Calibracion 
[D_Ideal, D_Real_Neg,D_Real_Pos] = textread('files/CalibracionPromedio2.txt','%d %d %d');
%% Ecuacion   
P_Real_Neg = polyfit(D_Ideal,D_Real_Neg, 2);
p_Ideal_Neg = polyval(P_Real_Neg, D_Ideal);
%% Graficas
% plot(D_Ideal,D_Real_Neg,'-*b','LineWidth',2,'markersize',10,'markerfacecolor','r');
hold on
grid minor
% plot(D_Ideal,p_Ideal_Neg,'-or','LineWidth',2,'markersize',10,'markerfacecolor','b');

P_Real_Pos = polyfit(D_Ideal,D_Real_Pos, 2);
p_Ideal_Pos = polyval(P_Real_Pos, D_Ideal);
plot(D_Ideal,D_Real_Pos,'or','LineWidth',2,'markersize',10,'markerfacecolor','r'); 
% plot(D_Ideal,p_Ideal_Pos,'-k','LineWidth',2,'markersize',10,'markerfacecolor','k');
t=-10:10:110;
y = 0.0462*t.^2 - 10.1690*t + 581.3214;
y2 = -5.0881*t + 465.8452;
plot(t,y2,'-k','LineWidth',2,'markersize',10,'markerfacecolor','k');
hold off
title('Calibracion de Distancia', 'FontSize',20,'FontWeight','bold','Color','k')
xlabel('Distancia[cm]', 'FontSize',15,'FontWeight','bold','Color','k')
ylabel('Pixeles','FontSize',15,'FontWeight','bold','Color','k')
%% Angulo Positivos y Desplazamientos
xlim([0 100])
ylim([0 500])

%% Positiva Cuadrada
% y = 0.0462x^2 - 10.1690X + 581.3214
%% Negativa Cuadrada
% y = -0.0462x^2 + 10.1690X - 581.3214
%% Positiva Lineal
% y = -5.0881X + 465.8452
%% Negativa Lineal
% y = 5.0881X - 465.8452