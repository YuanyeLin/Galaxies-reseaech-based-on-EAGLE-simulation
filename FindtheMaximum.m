clear
clc
close all
A = xlsread('Main Sequence SnapNum=28.xlsx');
A(1,:)=[];
GalaxyID=A(:,1);
SFR=A(:,2);
StellarMass=A(:,3);
N=numel(StellarMass);
x=log10(StellarMass);y=log10(SFR);
q=24;k=0.837590231;b=-8.625410893;
k1=0.84689679;b1=-8.709285311;
[n C]=hist3([x(:) y(:)],[q q]);
s=1;
for i=1:24
    y0(i)=k*C{1}(i)+b
    y1(i)=k1*C{1}(i)+b1
end

for j=11:1:16
    nnn(s,:)=n(j,:)/sum(n(j,:));
    s=s+1;
end
nnn(7,:)=(n(17,:)+n(18,:))/(sum(n(17,:))+sum(n(18,:)));    %increase the bin width at high stellar mass
nnn(8,:)=(n(19,:)+n(20,:))/(sum(n(19,:))+sum(n(20,:)));
nnn(9,:)=(n(21,:)+n(22,:))/(sum(n(21,:))+sum(n(22,:)));
for i=1:6
    subplot(3,3,i)
    plot(C{2},nnn(i,:))
    hold on
    plot([y0(i+10) y0(i+10)],[0 0.3],'r--')
    plot([y1(i+10) y1(i+10)],[0 0.3],'b:')
    legend('Normalization','Fitting 7-11','According to Jorrty')
    hold off
    xlim([-3.2 1.6])
    xlabel('log(SFR)');
    ylabel('ratio')
    title(strcat('log(M_{star})=',num2str(C{1}(i+10))))
end
subplot(3,3,7)
plot(C{2},nnn(7,:))
hold on
plot([y0(17)/2+y0(18)/2 y0(17)/2+y0(18)/2],[0 0.3],'r--');
plot([y1(17)/2+y1(18)/2 y1(17)/2+y1(18)/2],[0 0.3],'b:');
legend('Normalization','Fitting 7-11','According to Jorrty')
hold off
xlim([-3.2 1.6])
xlabel('log(SFR)');
ylabel('ratio')
title(strcat('log(M_{star})=',num2str((C{1}(17)+C{1}(18))/2)))
subplot(3,3,8)
plot(C{2},nnn(8,:))
hold on
plot([y0(19)/2+y0(20)/2 y0(19)/2+y0(20)/2],[0 0.3],'r--');
plot([y1(19)/2+y1(20)/2 y1(19)/2+y1(20)/2],[0 0.3],'b:');
legend('Normalization','Fitting 7-11','According to Jorrty')
hold off
xlim([-3.2 1.6])
xlabel('log(SFR)');
ylabel('ratio')
title(strcat('log(M_{star})=',num2str((C{1}(19)+C{1}(20))/2)))
subplot(3,3,9)
plot(C{2},nnn(9,:))
hold on
plot([y0(21)/2+y0(22)/2 y0(21)/2+y0(22)/2],[0 0.3],'r--');
plot([y0(21)/2+y0(22)/2 y0(21)/2+y0(22)/2],[0 0.3],'b:');
legend('Normalization','Fitting 7-11','According to Jorrty')
hold off
xlim([-3.2 1.6])
xlabel('log(SFR)');
ylabel('ratio')
title(strcat('log(M_{star})=',num2str((C{1}(21)+C{1}(22))/2)))
suptitle('Normalization at fixed M_{star} at SnapNum=28')