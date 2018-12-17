clear
clc
close all
A = xlsread('CentralGalaxy28.csv');  %读取Galaxy数据
B = xlsread('Halo28.csv');           %读取Halo数据
GalaxyID=A(:,1);
SFR=A(:,2);
StellarMass=A(:,3);
GID=A(:,6);
N1=numel(StellarMass);


ID=B(:,1);
Mh=B(:,2);
N2=numel(ID);


k=[0.837590231 0.861641922 0.893124949 0.896923699 0.957228369 1.075691923];
b=[-8.625410893  -8.743123103 -8.752557819 -8.499791355 -8.704632751 -9.306867114];
c=[0.918 0.85 1.064 0.724 1.0205 2];            % MS and Quench Cut 

s=1;
for i=1:N1                              %去除死亡星系
  if SFR(i)~=0;
     x1(s)=log10(StellarMass(i));
     y1(s)=log10(SFR(i));
     GID1(s)=GID(i);
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
bmax=8;                        %设置bin      %

sd=1;
for i=1:s-1                             %在固定质量将MS上下的星系分开
    if  bmin<x1(i) & x1(i)<bmax          
        xd(sd)=x1(i);
        yd(sd)=y1(i);
        GIDd(sd)=GID1(i);
        zd(sd)=z(i);
        sd=sd+1;
    end
end
sa=1;sb=1;
for i=1:sd-1                             %在固定质量将MS上下的星系分开
    if  zd(i)==2      
        xa(sa)=xd(i);
        ya(sa)=yd(i);
        GIDa(sa)=GIDd(i);
        sa=sa+1;
    elseif  z(i)==1
        xb(sb)=xd(i);
        yb(sb)=yd(i);
        GIDb(sb)=GIDd(i);
        sb=sb+1;
    end
end

for i=1:sa-1                         %Above the MS Halomass
    [m,n]=find(ID==GIDa(i));
    Ma(i)=log10(Mh(m));  
end

for i=1:sb-1                         %Below the MS Halomass
    [m,n]=find(ID==GIDb(i));
    Mb(i)=log10(Mh(m));  
end

plot(Ma,ya,'r.')  
hold on
plot(Mb,yb,'b.')
hold off
legend('Galaxies above MS','Galaxies below MS')
xlabel('log(M_{Halo})/M⊙');
ylabel('log(SFR)/M⊙yr^{-1}');
title('Central Galaxy:HaloMass vs SFR at z=0') 
text(9.6,1,{['N_{Above}=' num2str(sa-1) '' ]},'FontSize',10,'FontWeight','bold');
text(9.6,0.7,{['N_{Below}=' num2str(sb-1) '' ]},'FontSize',10,'FontWeight','bold');



