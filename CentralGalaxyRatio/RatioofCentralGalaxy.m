clear
clc
close all
A = xlsread('CGratio28.csv');  %读取Central Galaxies数据
GalaxyID=A(:,1);
SFR=A(:,2);
StellarMass=A(:,3);
SubGroupNumber=A(:,4);
Rand=A(:,5);
N=numel(StellarMass);
s=1;
k=[0.837590231 0.861641922 0.893124949 0.896923699 0.957228369 1.075691923];
b=[-8.625410893  -8.743123103 -8.752557819 -8.499791355 -8.704632751 -9.306867114];
c=[0.918 0.85 1.064 0.724 1.0205 2];            % MS and Quench Cut

n10=[85,792,713,1248,1641,1794,2151,2540,2629,2710,2742,2850,2571,2259,2037,1894,1703,1547,1302,1065,851,733,553,377,213,209,73,13];  %宇宙中所有Active Galaxies数量
n20=[70,597,554,938,1221,1349,1642,1914,1992,2045,2033,2163,1978,1755,1570,1459,1293,1197,1022,805,649,557,420,295,159,157,51,11];    %Central Galaxies within Active Galaxies的数量
for i=floor(N/8)*7+1:1:N                        %去除死亡星系
  if SFR(Rand(i))~=0;                           %N为Jackifine的Resample样本数量
     x1(s)=log10(StellarMass(Rand(i)));
     y1(s)=log10(SFR(Rand(i)));
     sub1(s)=SubGroupNumber(Rand(i));
     s=s+1;
  end
end

ss=1;                  
for i=1:s-1                                  %Quchen Cut
    if k(1)*x1(i)+b(1)-c(1)<y1(i)
        x2(ss)=x1(i);
        y2(ss)=y1(i);
        sub2(ss)=SubGroupNumber(i);
        ss=ss+1;
    end
end

sss=1;  
for i=1:ss-1                                %Select the Central Galaxies
   if sub2(i)==0
       x3(sss)=x2(i);
       y3(sss)=y2(i);
       sss=sss+1;
   end 
end


xbins=linspace(6,11,26);
xbins=[xbins 11.5 12];
[n1,C1]=hist(x2,xbins);
[n2,C2]=hist(x3,xbins);

n11=n10-n1;                   %Jackinife方法切除某一样本后Active Galaxies总数
n22=n20-n2;                   %Jackinife方法切除某一样本后Active Central Galaxies总数
ratio=n22./n11;               %输出ratio
plot(xbins,ratio)

