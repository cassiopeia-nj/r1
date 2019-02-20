clc;clear;
%可调参数
d=3.6*10.^7;
%d=50;
%interaction delay
kd=0.5;
%computation time
kc=0.5;
%地球同步卫星三万六千公里
c=3*10.^8;N=8000;%码长
R=40000;%Zigbee数据传输速率 250kbit/s、20kbit/s和40kbit/s的传输速率，它的传输距离在10-75m的范围内,
%mainFreq=2.7*10^9;tc=1/mainFreq*100;

load('D:\MIKU\VTC2019\VTC2019mat\TURBO _test\iniBerEBN0dbIndex.mat');
iniBer=cat(1,data .cber);iniBer=iniBer(1:7);clear data;
%BBBSS
load('BS.mat');
TcB=cat(1,DATA.effDelay);IB=cat(1,DATA.effInte);EB=cat(1,DATA.effE0);
TdB=IB*d/c+(1-EB)*N/R;creiB=EB./(kc*TcB+kd*TdB);
clear DATA;

%cascade
load('CA.mat');
TcC=cat(1,DATA.effDelay);IC=cat(1,DATA.effInte);EC=cat(1,DATA.effE0);
TdC=IC*d/c+(1-EC)*N/R;creiC=EC./(kc*TcC+kd*TdC);
clear DATA;

%turbo
load('TURBO00.mat');
Tc0=cat(1,DATA.delay)';P0=cat(1,DATA.ps)';
Td0=d/c+N/R;crei0=P0./(kc*Tc0+kd*Td0);
clear DATA;

load('TURBO01.mat');
Tc1=cat(1,DATA.delay)';P1=cat(1,DATA.ps)';
Td1=d/c+2*N/R;crei1=P1./(kc*Tc1+kd*Td1);
clear DATA;

load('TURBO10.mat');
Tc2=cat(1,DATA.delay)';P2=cat(1,DATA.ps)';
Td2=d/c+N/R;crei2=P2./(kc*Tc2+kd*Td2);
clear DATA;

load('TURBO11.mat');
Tc3=cat(1,DATA.delay)';P3=cat(1,DATA.ps)';
Td3=d/c+2*N/R;crei3=P3./(kc*Tc3+kd*Td3);
clear DATA;

%Tc
figure(1)
plot(iniBer,TcB(1:7),'p-',iniBer,TcC(1:7),'h-',iniBer,Tc0,'x-',iniBer,Tc1,'s-',iniBer,Tc2,'d-',iniBer,Tc3,'*-');
title('Tc');
legend('BBBSS','CASCADE','TURBO00','TURBO01','TURBO10','TURBO11');

%Td
figure(2)
plot(iniBer,TdB(1:7),'p-',iniBer,TdC(1:7),'h-',iniBer,Td0,'x-',iniBer,Td1,'s-',iniBer,Td2,'d-',iniBer,Td3,'*-');
title('Td');
legend('BBBSS','CASCADE','TURBO00','TURBO01','TURBO10','TURBO11');

%success rate
figure(3)
plot(iniBer,P0,'x-',iniBer,P1,'s-',iniBer,P2,'d-',iniBer,P3,'*-');
title('Success rate');
legend('TURBO00','TURBO01','TURBO10','TURBO11');

%crei
figure(4)
plot(iniBer,creiB(1:7),'p-',iniBer,creiC(1:7),'h-',iniBer,crei0,'x-',iniBer,crei1,'s-',iniBer,crei2,'d-',iniBer,crei3,'*-');
creiName=strcat('\alpha=',num2str(kd),',\beta=',num2str(kc),',d=',num2str(d),'m');
title({'CREI ';creiName},'FontSize',15);
legend('BBBSS','CASCADE','TURBO00','TURBO01','TURBO10','TURBO11');
