%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% Cargar Datos
%% Desplazamiento Media: 46.333333,Moda: 0,Mediana: 46,Varianza: 997.75, 
% Covarianza: 997.75, Desviacion Estandar: 31.587181
% [ID, Ideal,Real,Error, Desp] = textread('files/ErrorPromedio.txt','%d %d %d %d %d');
%% Angulo Positivos Media: 47.285714, Moda: 0,Mediana: 46 ,Varianza: 1153.904762
% Covarianza: 1153.904762, Desviacion Estandar: 33.969174
% [ID, Ideal,Real,Error] = textread('files/ErrorPromedioGradosPos.txt','%d %d %d %d');
%% Angulo Negativos Media: -52.857143, Moda: -100, Mediana: -50
% Varianza: 1306.809524, Covarianza: 1306.809524, Desviacion Estandar: 36.149821
[ID, Ideal,Real,Error] = textread('files/ErrorPromedioGradosNeg.txt','%d %d %d %d');
%% Angulo All 
% [ID, Ideal,Real,Error] = textread('files/ErrorPromedioGrados.txt','%d %d %d %d');
%% Ecuacion  
P_Ideal = polyfit(ID,Ideal, 1);
p_Ideal = polyval(P_Ideal, ID);
%% Graficas
plot(ID,p_Ideal,'*b','LineWidth',2,'markersize',10,'markerfacecolor','b');
hold on
grid minor
plot(ID,Real,'or','LineWidth',2,'markersize',10,'markerfacecolor','r'); 
t=-10:1:20;
% y_real = 11.5*t + 0.2000;
% y_real = 15.72*t + 0.143;
y_real = 16.68*t - 102.89;
P_Real = polyfit(ID,Real, 1);
p_Real = polyval(P_Real, ID);

% plot(ID,p_Real,'-k','LineWidth',2,'markersize',10,'markerfacecolor','k');
plot(t,y_real,'-k','LineWidth',2,'markersize',10,'markerfacecolor','k');

hold off
% title('Error en Distancias', 'FontSize',20,'FontWeight','bold','Color','k')
% xlabel('Prueba #', 'FontSize',15,'FontWeight','bold','Color','k')
% ylabel('Distancia[cm]','FontSize',15,'FontWeight','bold','Color','k')
title('Error de Rotaciones', 'FontSize',20,'FontWeight','bold','Color','k')
xlabel('Prueba #', 'FontSize',15,'FontWeight','bold','Color','k')
ylabel('Angulo[grados]','FontSize',15,'FontWeight','bold','Color','k')
%% Angulo Positivos y Desplazamientos
% xlim([-1 10])
% ylim([-5 100])
% %% Angulo Negativos
xlim([-1 7])
ylim([-130 10])
%% Angulo All
% xlim([-1 13])
% ylim([-131 106])
%% Desplazamientos
% figure;
% plot(Ideal, Desp,'or','LineWidth',2,'markersize',10,'markerfacecolor','r'); 
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
% y_real = 16.68X - 102.89
% Positivo
% y_ideal = 15X
% y_real = 15.72X + 0.143
% All
% y_ideal = 15X - 90
% y_real = 16.54X - 102.23
fprintf('Desviacion Maxima: %f\n',max(Error))
fprintf('Desviacion Minima: %f\n',min(Error)) 
fprintf('Media: %f\n',mean(Error))
fprintf('Moda: %f\n',mode(Real))
fprintf('Mediana: %f\n',median(Real))
fprintf('Varianza: %f\n',var(Real))
fprintf('Covarianza: %f\n',cov(Real))
fprintf('Desviacion Estandar: %f\n',std(Error))

