clear
clc
close all
A = xlsread('28.csv');  %读取Galaxy数据

GalaxyID=A(:,1);
SFR=A(:,2);
StellarMass=A(:,3);
sub=A(:,4);
met=A(:,8);
N1=numel(StellarMass);

k=[0.837590231 0.861641922 0.893124949 0.896923699 0.957228369 1.075691923];
b=[-8.625410893  -8.743123103 -8.752557819 -8.499791355 -8.704632751 -9.306867114];
c=[0.918 0.85 1.064 0.724 1.0205 2];            % MS and Quench Cut 

s=1;
for i=1:N1                              %去除死亡星系
  if SFR(i)~=0 && sub(i)==0
     x1(s)=log10(StellarMass(i));
     y1(s)=log10(SFR(i));
     met1(s)=log10(met(i));
     s=s+1;
  end
end

for i=1:s-1                             %2:above 1:below 0:quench
    if y1(i)>k(1)*x1(i)+b(1)
        z(i)=2;
    elseif y1(i)<k(1)*x1(i)+b(1) & y1(i)>k(1)*x1(i)+b(1)-c(1)
        z(i)=1;
    elseif y1(i)<k(1)*x1(i)+b(1)-c(1)
        z(i)=0;
    end
end

bmin=7.7;
bmax=8.0;                        %设置bin      %

sd=1;
for i=1:s-1                             %在固定质量将MS上下的星系分开
    if  bmin<x1(i) & x1(i)<bmax          
        xd(sd)=x1(i);
        yd(sd)=y1(i);
        metd(sd)=met1(i);
        zd(sd)=z(i);
        sd=sd+1;
    end
end
sa=1;sb=1;
for i=1:sd-1                             %在固定质量将MS上下的星系分开
    if  zd(i)==2      
        xa(sa)=xd(i);
        ya(sa)=yd(i);
        meta(sa)=metd(i);
        sa=sa+1;
    elseif  z(i)==1
        xb(sb)=xd(i);
        yb(sb)=yd(i);
        metb(sb)=metd(i);
        sb=sb+1;
    end
end


xmin=-3;                      %该文件数据源来自于HaloMass.m
xmax=-0.5;                      %设置数据拟合范围       

width=0.1;                     %设置bin width
n=(xmax-xmin)*(1/width)+1;            
xbins=linspace(xmin,xmax,n);
[n1,C1]=hist(meta,xbins);
[n2,C2]=hist(metb,xbins);
meana=mean(meta);               %计算Above MS平均值
meanb=mean(metb);               %计算Below MS平均值
metan=length(meta);
metbn=length(metb);
erra=std(meta)/sqrt(metan);
errb=std(metb)/sqrt(metbn);
table=[meana erra meanb errb]
n11=n1'./sum(n1);
n22=n2'./sum(n2);
n=n11;
n(:,2)=n22;
b=bar(n);                     %以柱状图绘图
grid on
set(gca,'XTickLabel',{'-3.0','-2.5','-2.0','-1.5','-1.0','-0.5','0'})
legend('Above MS','Below MS');
xlabel('Metallicity');
ylabel('Ratio');
text(0.8,0.28,{['Number_{Above}=' num2str(metan) '' ]},'FontSize',10,'FontWeight','bold');
text(0.8,0.26,{['Number_{Below}=' num2str(metbn) '' ]},'FontSize',10,'FontWeight','bold');
title('M_{star} =[7.7,8.0] at z=0 ')
saveas(gcf, '277', 'png')