clc
clear
close all
A = xlsread('Jackinife28.xlsx'); %读取Jackinife Resammple方法数据 Export by RatioofCentralGalaxy.m 
for i=1:28
    Mean(i)=mean(A(:,i));
    Std(i)=std(A(:,i))*sqrt(7);
end
xbins=linspace(6,11,26);
xbins=[xbins 11.5 12];   %导入the whole universe 数值
ratio=[0.823529411764706,0.753787878787879,0.776998597475456,0.751602564102564,0.744058500914077,0.751950947603122,0.763365876336588,0.753543307086614,0.757702548497528,0.754612546125461,0.741429613420861,0.758947368421053,0.769350447296772,0.776892430278884,0.770741286205204,0.770327349524815,0.759248385202584,0.773755656108597,0.784946236559140,0.755868544600939,0.762632197414806,0.759890859481583,0.759493670886076,0.782493368700265,0.746478873239437,0.751196172248804,0.698630136986301,0.846153846153846];
errorbar(xbins,Mean,Std,'-or','LineWidth',1)
hold on
plot(xbins,ratio,'-','LineWidth',1)
grid on
legend('Jackinife Resampple Method','Data of the whole universe')
xlabel('log(M_{Halo})/M⊙');
ylabel('Central Galaxies ratio');
title('Central Galaxies fraction within Active Galaxies') 