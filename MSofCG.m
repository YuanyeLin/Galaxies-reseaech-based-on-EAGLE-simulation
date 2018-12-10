clc
clear
close all
x=linspace(7.5,11.5);
k=[0.838764971 0.893124949 0.896960508 0.957228369 1.081737185];   %导入Central Galxies对应的MS数据
b=[-8.632817329 -8.752557819 -8.500228934 -8.704632751 -9.343977372];
k1=[0.837590231 0.893124949 0.896923699 0.957228369 1.075691923];  %导入All Galaxies 对应的MS数据
b1=[-8.625410893 -8.752557819 -8.499791355 -8.704632751 -9.306867114];
y1=k(1)*x+b(1);
y2=k(2)*x+b(2);
y3=k(3)*x+b(3);
y4=k(4)*x+b(4);
y5=k(5)*x+b(5);
y11=k1(1)*x+b1(1);
y22=k1(2)*x+b1(2);
y33=k1(3)*x+b1(3);
y44=k1(4)*x+b1(4);
y55=k1(5)*x+b1(5);
plot(x,y5,'b:','LineWidth',2);
hold on
plot(x,y4,'m:', 'LineWidth',2);
plot(x,y3,'c:','LineWidth',2);
plot(x,y2,'y:','LineWidth',2);
plot(x,y1,'r:','LineWidth',2);
plot(x,y55,'b--','LineWidth',2);
plot(x,y44,'m--','LineWidth',2);
plot(x,y33,'c--','LineWidth',2);
plot(x,y22,'y--','LineWidth',2);
plot(x,y11,'r--','LineWidth',2);
hold off
legend('z = 3.98 Central galaxies','z = 2.01 Central galaxies','z = 1.00 Central galaxies','z = 0.50 Central galaxies','z = 0 Central galaxies','z = 3.98 All galaxies','z = 2.01 All galaxies','z = 1.00 All galaxies','z = 0.50 All galaxies','z = 0 All galaxies')
xlabel('log(M_{*})/M⊙');
ylabel('log(SFR)/M⊙yr^{-1}')
axis([9.7 11.1 -0.5 3])

title('Central Galaxies Main Sequence ')