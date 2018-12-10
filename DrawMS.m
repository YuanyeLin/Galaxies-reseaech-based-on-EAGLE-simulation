clc
clear
x=linspace(7.5,11.5);
k=[0.84689679 0.925447566 0.95926695 0.978819986 0.996605062];      %导入MS(StellarMass range7-11)
b=[-8.709285311 -9.023403877 -9.058521386 -8.8802525 -8.695257889];
k1=[0.837590231 0.893124949 0.896923699 0.957228369 1.075691923];   %导入MS(StellarMass range available)
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
legend('z = 3.98 log(M_{star})=(7,11)','z = 2.01 log(M_{star})=(7,11)','z = 1.00 log(M_{star})=(7,11)','z = 0.50 log(M_{star})=(7,11)','z = 0      log(M_{star})=(7,11)','z = 3.98 log(M_{star})=(7.2,8.8)','z = 2.01 log(M_{star})=(7.8,9.6)','z = 1.00 log(M_{star})=(8.3-10.3)','z = 0.50 log(M_{star})=(8.7-10.7)','z = 0      log(M_{star})=(9.0,11.1)')
xlabel('log(M_{*})/M⊙');
ylabel('log(SFR)/M⊙yr^{-1}')
axis([9.7 11.1 -0.5 3])

title('Main Sequence At z from 0~4')