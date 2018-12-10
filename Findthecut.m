clear
clc
close all
A = xlsread('Main Sequence SnapNum=28.xlsx');    %读取数据
A(1,:)=[];
GalaxyID=A(:,1);
SFR=A(:,2);
StellarMass=A(:,3);
N=numel(StellarMass);
x=log10(StellarMass);y=log10(SFR);
pp=[1.075691923001551,-9.306867113761934];       %读取MS(对应SnapNum)
k=pp(1);b=pp(2);
above=0;below=0;
cut=10                                           %设置quench cut
for i=1:N
    if y(i)>k*x(i)+b
        above=above+1;
    elseif y(i)<k*x(i)+b && y(i)>k*x(i)+b-cut
        below=below+1;
    end
end
number=above-below