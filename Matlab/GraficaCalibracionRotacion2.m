% close all
clear all
clc
%% 
orden = 2;
figure();
hold on
grid minor
Xplus=[];Yplus=[];
Xneg=[];Yneg=[];
[X1, Y1] = textread('files/CalibracionPromedio4_20.txt','%d %d');
Xplus = [Xplus;X1(1:round(length(X1)/2))];
Yplus = [Yplus;Y1(1:round(length(X1)/2))];
Xneg = [Xneg;X1(round(length(X1)/2):end)];
Yneg = [Yneg;X1(round(length(X1)/2):end)];

[X2, Y2] = textread('files/CalibracionPromedio5_30.txt','%d %d');
Xplus = [Xplus;X2(1:round(length(X1)/2))];
Yplus = [Yplus;Y2(1:round(length(X1)/2))];
Xneg = [Xneg;X2(round(length(X2)/2):end)];
Yneg = [Yneg;X2(round(length(X2)/2):end)];

[X3, Y3] = textread('files/CalibracionPromedio6_40.txt','%d %d');
Xplus = [Xplus;X3(1:round(length(X3)/2))];
Yplus = [Yplus;Y3(1:round(length(X3)/2))];
Xneg = [Xneg;X3(round(length(X3)/2):end)];
Yneg = [Yneg;Y3(round(length(X3)/2):end)];

[X4, Y4] = textread('files/CalibracionPromedio7_50.txt','%d %d');
Xplus = [Xplus;X4(1:round(length(X4)/2))];
Yplus = [Yplus;Y4(1:round(length(X4)/2))];
Xneg = [Xneg;X4(round(length(X4)/2):end)];
Yneg = [Yneg;Y4(round(length(X4)/2):end)];

[X5, Y5] = textread('files/CalibracionPromedio8_60.txt','%d %d');
Xplus = [Xplus;X5(1:round(length(X5)/2))];
Yplus = [Yplus;Y5(1:round(length(X5)/2))];
Xneg = [Xneg;X5(round(length(X5)/2):end)];
Yneg = [Yneg;Y5(round(length(X5)/2):end)];

[X6, Y6] = textread('files/CalibracionPromedio9_70.txt','%d %d');
Xplus = [Xplus;X6(1:round(length(X6)/2))];
Yplus = [Yplus;Y6(1:round(length(X6)/2))];
Xneg = [Xneg;X6(round(length(X6)/2):end)];
Yneg = [Yneg;Y6(round(length(X6)/2):end)];

[X7, Y7] = textread('files/CalibracionPromedio10_80.txt','%d %d');
Xplus = [Xplus;X7(1:round(length(X7)/2))];
Yplus = [Yplus;Y7(1:round(length(X7)/2))];
Xneg = [Xneg;X7(round(length(X7)/2):end)];
Yneg = [Yneg;Y7(round(length(X7)/2):end)];

plot(Yplus,Xplus,'*r');
plot(Yneg,Xneg,'*b');

hold off