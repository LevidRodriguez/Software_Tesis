%% Grafica Errores de Desplazamiento de NAO
close all
clear all
clc
%% 
XY_pos=[];
XY_neg=[];
orden = 1;
hold on
grid minor
% [X, Y] = textread('files/CalibracionPromedio3.txt','%d %d');
% plot(X,Y,'og');
% halfX=floor(length(X)/2);
% P = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
% P_val = polyval(P,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.b');
% 
% halfX=ceil(length(X)/2);
% P = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
% P_val = polyval(P,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.b');
%% 20cm
[Y, X] = textread('files/CalibracionPromedio4_20.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2);
% P_20 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_20,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2);
% P_20 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_20,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

%% 30cm
[Y, X] = textread('files/CalibracionPromedio5_30.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2);
% P_30 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_30,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2);
% P_30 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_30,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);


%% 40cm
[Y, X] = textread('files/CalibracionPromedio6_40.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2);
% P_40 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_40,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2)-1;
% P_40 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_40,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

%% 50cm
[Y, X] = textread('files/CalibracionPromedio7_50.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2);
% P_50 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_50,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2)-1;
% P_50 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_50,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

% 
%% 60cm
[Y, X] = textread('files/CalibracionPromedio8_60.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2);
% P_60 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_60,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2);
% P_60 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_60,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

%% 70cm
[Y, X] = textread('files/CalibracionPromedio9_70.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10);

halfX=ceil(length(X)/2)+1;
% P_70 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_70,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2);
% P_70 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_70,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

%% 80cm
[Y, X] = textread('files/CalibracionPromedio10_80.txt','%d %d');
plot(X,Y,'.','LineWidth',2,'markersize',10)

halfX=ceil(length(X)/2)+1;
% P_80 = polyfit(X(halfX:length(X),:),Y(halfX:length(X),:), orden)
XY_pos=[XY_pos;X(halfX:length(X),:),Y(halfX:length(X))];
% P_val = polyval(P_80,X(halfX:length(X),:));
% plot(X(halfX:length(X),:),P_val,'-.','LineWidth',2,'markersize',10);
% 
halfX=floor(length(X)/2);
% P_80 = polyfit(X(1:halfX,:),Y(1:halfX,:), orden)
XY_neg=[XY_neg;X(1:halfX,:),Y(1:halfX,:)];
% P_val = polyval(P_80,X(1:halfX,:));
% plot(X(1:halfX,:),P_val,'-.','LineWidth',2,'markersize',10);

%% Angulo real positivo y angulo Hough negativo 
% plot(XY_pos(:,1),XY_pos(:,2),'xr')
P_gral_pos = polyfit(XY_pos(:,1),XY_pos(:,2), orden)
P_val_pos = polyval(P_gral_pos,XY_pos(:,1));
% plot(XY_pos(:,1),P_val_pos,'-m','LineWidth',3,'markersize',10);
% plot(XY_neg(:,1),XY_neg(:,2),'xb')

%% Angulo real negativo y angulo Hough positivo 
P_gral_neg = polyfit(XY_neg(:,1),XY_neg(:,2), orden)
P_val_neg = polyval(P_gral_neg,XY_neg(:,1));
% plot(XY_neg(:,1),P_val_neg,'-m','LineWidth',3,'markersize',10);
% plot(XY_neg(:,1),XY_neg(:,2),'xb')

A1 = -95:1:0;
P131 = 0.005*A1.^3 + 0.305*A1.^2 + 6.315*A1 + 115.45;
P132 = -0.0000*A1.^3 - 0.0129*A1.^2 - 0.5036*A1 + 49.8447;
P121 = -0.005*A1.^2 + 0.1515*A1 + 85.15;
P122 = -0.0104*A1.^2 - 0.3346*A1 + 53.6451;
P111 = 1.4*A1 + 125; % Promedio de coeficientes de Polinomios
P112 = 1.1474*A1 + 104.6712; % Polinomio de nube de puntos

A2 = 0:1:95;
P231 = 0.0001*A2.^3 - 0.0054*A2.^2 + 0.805*A2 - 89.64;
P232 = -0.0001*A2.^3 + 0.0353*A2.^2 - 2.0903*A2 - 18.8134;
P221 = 0.007*A2.^2 + 0.6*A2 - 88.98;
P222 = 0.0099*A2.^2 - 0.2782*A2 - 61.4467;
P211 = 1.8*A2 - 160; % Promedio de coeficientes de Polinomios
P212 = 1.1765*A2 - 113.8521; % Polinomio de nube de puntos

plot(A1,P111,'-k','LineWidth',2,'markersize',10);
% plot(A1,P112,'-r','LineWidth',2,'markersize',10);
% plot(A1,P121,'-r','LineWidth',2,'markersize',10);
% plot(A1,P122,'-r','LineWidth',2,'markersize',10);
% plot(A1,P131,'-b','LineWidth',2,'markersize',10);
% plot(A1,P132,'-b','LineWidth',2,'markersize',10);

plot(A2,P211,'-k','LineWidth',2,'markersize',10);
% plot(A2,P212,'-r','LineWidth',2,'markersize',10);
% plot(A2,P221,'-r','LineWidth',2,'markersize',10);
% plot(A2,P222,'-r','LineWidth',2,'markersize',10);
% plot(A2,P231,'-b','LineWidth',2,'markersize',10);
% plot(A2,P232,'-b','LineWidth',2,'markersize',10);

hold off
title('Calibracion de Rotaciones', 'FontSize',20,'FontWeight','bold','Color','k')
xlabel('Angulo[Hough]', 'FontSize',15,'FontWeight','bold','Color','k')
ylabel('Angulo[Real]','FontSize',15,'FontWeight','bold','Color','k')

%% Polinomios de Grado 1
% P_20 = 1.0579*A + 94.5434
% P_30 = 1.2150*A + 108.4583
% P_40 = 1.2880*A + 115.6092
% P_50 = 1.4056*A + 126.4475
% P_60 = 1.6229*A + 145.3033
% P_70 = 1.8786*A + 167.0520
% P_80 = 1.6667*A + 150.0000
% 
% P1 = 1.447814286*A + 129.6305286
%
% P_20 = 1.2280*A - 113.2817
% P_30 = 1.4052*A - 128.3229
% P_40 = 1.3410*A - 127.7011
% P_50 = 1.9730*A - 174.6691
% P_60 = 1.6634*A - 155.0681
% P_70 = 2.9762*A - 269.4048
% P_80 = 2.0588*A - 189.4118
%
% P2 = 1.806514286*A - 165.4085
% 
%% Polinomios de Grado 2
% P_20 = -0.0012*A?2 + 0.7261*A + 91.0000
% P_30 = -0.0138*A?2 - 0.1357*A + 79.7381
% P_40 = -0.0105*A?2 + 0.0857*A + 85.9048
% P_50 = -0.0005*A?2 + 0.4690*A + 87.9286
% P_60 = -0.0700*A?2 - 2.6500*A + 58.2500
% P_70 = 0.0171*A?2  + 0.8857*A + 93.8000
% P_80 = 0.0400*A?2  + 1.6800*A + 99.4000
% 
% P1 = -0.005*A?2 + 0.1515*A + 85.15
%
% P_20 = -0.0005*A?2 + 0.9647*A - 89.4818
% P_30 = 0.0011*A?2  + 0.7709*A - 88.9110
% P_40 = 0.0029*A?2  + 0.6353*A - 88.6107
% P_50 = 0.0045*A?2  + 0.5048*A - 88.4909
% P_60 = 0.0036*A?2  + 0.5221*A - 89.1786
% P_70 = 0.0114*A?2  + 0.2914*A - 88.2286
% P_80 = -0.0000*A?2 + 0.6000*A - 90.0000
%
% P2 = 0.007*A?2 + 0.6*A - 88.98
% 
%% Polinomios de Grado 3
% P_20 = 0.0010*A?3 + 0.0725*A?2 + 2.2795*A + 99.1111
% P_30 = 0.0000*A?3 - 0.0138*A?2 - 0.1357*A + 79.7381
% P_40 = -0.0009*A?3 - 0.0905*A?2 - 2.1587*A + 66.5714
% P_50 = 0.0009*A?3 + 0.0662*A?2 + 1.9802*A + 97.9286
% P_60 = 0.0200*A?3 + 1.2800*A?2 + 26.7000*A + 263.0000
% P_70 = 0.0033*A?3 + 0.2171*A?2 + 4.6024*A + 114.8000
% P_80 = 0.0107*A?3 + 0.6000*A?2 + 10.9333*A + 147.0000
% 
% P1 = 0.005*A?3 + 0.305*A?2 + 6.315*A + 115.45
%
% P_-20 = 0.0001*A?3 - 0.0064*A?2 + 1.0668*A - 89.7608
% P_-30 = 0.0000*A?3 - 0.0003*A?2 + 0.7952*A - 88.9742
% P_-40 = 0.0002*A?3 - 0.0073*A?2 + 0.8060*A - 89.0059
% P_-50 = 0.0002*A?3 - 0.0097*A?2 + 0.7481*A - 89.1517
% P_-60 = -0.0002*A?3 + 0.0119*A?2 + 0.4460*A - 89.0952
% P_-70 = -0.0013*A?3 + 0.0514*A?2 + 0.0048*A - 88.0286
% P_-80 = 0.0000*A?3 - 0.0000*A?2 + 0.6000*A - 90.0000
%
% P2 = 0.0001*A?3 - 0.0054*A?2 + 0.805*A - 89.64
% 