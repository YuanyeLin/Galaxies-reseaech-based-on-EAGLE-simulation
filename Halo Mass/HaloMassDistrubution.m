
xmin=10;                      %���ļ�����Դ������HaloMass.m
xmax=15;                      %����������Ϸ�Χ       

width=0.2                     %����bin width
n=(xmax-xmin)*(1/width)+1;            
xbins=linspace(xmin,xmax,n);
[n1,C1]=hist(Ma,xbins);
[n2,C2]=hist(Mb,xbins);
meana=mean(Ma);               %����Above MSƽ��ֵ
meanb=mean(Mb);               %����Below MSƽ��ֵ
Man=length(Ma);
Mbn=length(Mb);
Mad=sort(Ma,'descend');
maxa=Mad(floor(Man*0.15));    %�����ֲ��Ŀ��
mina=Mad(floor(Man*0.85));
Mbd=sort(Mb,'descend');
maxb=Mbd(floor(Mbn*0.15));
minb=Mbd(floor(Mbn*0.85));
table=[meana meanb maxa mina maxb minb std(Mad) std(Mbd)]   %����ֲ���������ֵ

n11=n1'./sum(n1);
n22=n2'./sum(n2);
n=n11;
n(:,2)=n22;
b=bar(n);                     %����״ͼ��ͼ
grid on
set(gca,'XTickLabel',{'10','10,8','11.6','12.4','13.2','14.0','14.8'})
legend('Above MS','Below MS');
xlabel('log(M_{Halo})/M��');
ylabel('ratio');
text(18.5,0.16,{['Number_{Above}=' num2str(Man) '' ]},'FontSize',10,'FontWeight','bold');
text(18.5,0.14,{['Number_{Below}=' num2str(Mbn) '' ]},'FontSize',10,'FontWeight','bold');
title('M_{star} =[10.1,10.4] at z=0 ')
