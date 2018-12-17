clc
clear
close all
A = xlsread('DistributionSnapNum=28.xlsx');  %读取distribution，Data export by HaloMass.m
abovemean=A(:,2)';              %平均值
belowmean=A(:,3)';
Ua=A(:,4)-A(:,2);               %分布宽度(左)
La=A(:,2)-A(:,5);               %分布宽度(右)
Ub=A(:,4)-A(:,3);               
Lb=A(:,3)-A(:,5);
stda=A(:,8);
stdb=A(:,9);
meanerrora=A(:,12);             %平均值的errorbar
meanerrorb=A(:,13);
x1=linspace(7.8,10.8,11);
x2=linspace(7.9,10.9,11);
% errorbar(x1,abovemean,La,Ua,'-ob','LineWidth',1)

% errorbar(x2,belowmean,Lb,Ub,'-or','LineWidth',1)
% errorbar(x1,abovemean,stda,'-ob','LineWidth',1)
% errorbar(x2,belowmean,stdb,'-or','LineWidth',1)
errorbar(x1,abovemean,meanerrora,'-ob','LineWidth',1)
grid on
hold on
errorbar(x2,belowmean,meanerrorb,'-or','LineWidth',1)
legend('HaloMass of Galaxies above the MS','HaloMass of Galaxies below the MS')
xlabel('log(M_{*})/M⊙');
ylabel('log(M_{halo})/M⊙');
title('Stellar Mass vs Halo Mass Function at z=0') 
hold off
