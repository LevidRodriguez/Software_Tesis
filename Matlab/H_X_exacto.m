clear all
close all
clc
%%
orden = 1;
file = fopen('H_X_exacto.txt','r');
H=textscan(file,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',0);
H=cell2mat(H);
fclose(file);
figure;
plot(H(:,4),H(:,2),'.');      %100cm
grid minor
hold on
P_100p = polyfit(H(95:end,4),H(95:end,2), orden);
P_v100p = polyval(P_100p,H(95:end,4));
% plot(H(95:end,4),P_v100p,'-.k','LineWidth',2,'markersize',10);
P_100n = polyfit(H(1:91,4),H(1:91,2), orden);
P_v100n = polyval(P_100n,H(1:91,4));
% plot(H(1:91,4),P_v100n,'-.k','LineWidth',2,'markersize',10);

plot(H(1:160,6),H(1:160,2),'.');      %90cm
P_90p = polyfit(H(75:160,6),H(75:160,2), orden);
P_v90p = polyval(P_90p,H(75:160,6));
% plot(H(75:160,6),P_v90p,'-.k','LineWidth',2,'markersize',10);
P_90n = polyfit(H(1:74,6),H(1:74,2), orden);
P_v90n = polyval(P_90n,H(1:74,6));
% plot(H(1:74,6),P_v90n,'-.k','LineWidth',2,'markersize',10);

plot(H(1:169,8),H(1:169,2),'.');      %80cm
P_80p = polyfit(H(90:169,8),H(90:169,2), orden);
P_v80p = polyval(P_80p,H(90:169,8));
% plot(H(90:169,8),P_v80p,'-.k','LineWidth',2,'markersize',10);
P_80n = polyfit(H(1:89,8),H(1:89,2), orden);
P_v80n = polyval(P_80n,H(1:89,8));
% plot(H(1:89,8),P_v80n,'-.k','LineWidth',2,'markersize',10);

plot(H(:,10),H(:,2),'.');      %70cm
P_70p = polyfit(H(92:end,10),H(92:end,2), orden);
P_v70p = polyval(P_70p,H(92:end,10));
% plot(H(92:end,10),P_v70p,'-.k','LineWidth',2,'markersize',10);
P_70n = polyfit(H(1:91,10),H(1:91,2), orden);
P_v70n = polyval(P_70n,H(1:91,10));
% plot(H(1:91,10),P_v70n,'-.k','LineWidth',2,'markersize',10);

plot(H(:,12),H(:,2),'.');      %60cm
P_60p = polyfit(H(72:end,12),H(72:end,2), orden);
P_v60p = polyval(P_60p,H(72:end,12));
% plot(H(72:end,12),P_v60p,'-.k','LineWidth',2,'markersize',10);
P_60n = polyfit(H(1:71,12),H(1:71,2), orden);
P_v60n = polyval(P_60n,H(1:71,12));
% plot(H(1:71,12),P_v60n,'-.k','LineWidth',2,'markersize',10);

plot(H(:,14),H(:,2),'.');      %50cm
P_50p = polyfit(H(82:end,14),H(82:end,2), orden);
P_v50p = polyval(P_50p,H(82:end,14));
% plot(H(82:end,14),P_v50p,'-.k','LineWidth',2,'markersize',10);
P_50n = polyfit(H(1:81,14),H(1:81,2), orden);
P_v50n = polyval(P_50n,H(1:81,14));
% plot(H(1:81,14),P_v50n,'-.k','LineWidth',2,'markersize',10);
%%
Pp=[];
Pp(1) = (P_100p(1)+P_90p(1)+P_80p(1)+P_70p(1)+P_60p(1)+P_50p(1))/6;
Pp(2) = (P_100p(2)+P_90p(2)+P_80p(2)+P_70p(2)+P_60p(2)+P_50p(2))/6;
Pn=[];
Pn(1) = (P_100n(1)+P_90n(1)+P_80n(1)+P_70n(1)+P_60n(1)+P_50n(1))/6;
Pn(2) = (P_100n(2)+P_90n(2)+P_80n(2)+P_70n(2)+P_60n(2)+P_50n(2))/6;

Theta = -90:1:-75;
Ap= Pp(1) * Theta + Pp(2);
plot(Theta,Ap,'-r','LineWidth',2,'markersize',10);
Theta = 80:1:93;
An= Pn(1) * Theta + Pn(2);
plot(Theta,An,'-r','LineWidth',2,'markersize',10);
hold off

title('Calibracion de Rotaciones', 'FontSize',30,'FontWeight','bold','Color','k')
xlabel('Angulo[Hough]', 'FontSize',20,'FontWeight','bold','Color','k')
ylabel('Angulo[Real]','FontSize',20,'FontWeight','bold','Color','k')
legend({'Hough','Hough Excato'},'FontSize',15,'FontWeight','bold')

%% 8.2493 * Theta + 718.0719 
%% 8.3896 * Theta - 768.5472



