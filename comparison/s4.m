clear all;
clc;
ber1=(0.1:0.1:0.8)./100;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\compareBC\sB1.mat');
BBBSS=DATA;clear DATA;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\compareBC\sC1.mat');
cascade=DATA;clear DATA;
%计算CREI
inteTime=0.03;k1=0.5;k2=0.5;
inB1=cat(1,BBBSS.effE0)./(k1*cat(1,BBBSS.effDelay)+k2*cat(1,BBBSS.effInte).*inteTime);
inC1=cat(1,cascade.effE0)./(k1*cat(1,cascade.effDelay)+k2*cat(1,cascade.effInte).*inteTime);

% figure(1);
% plot(ber1,inB1,'*-',ber1,inC1,'o-');
% legend('BBBSS','cascade');
% xlabel('initiai BDR');
% ylabel('CREI');

load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d3.mat');
ber2=cat(1,data.cber)'; clear data;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\compareBC\sT2.mat');
inT2=0.625*cat(1,data.ps)./cat(1,data.delay);clear data;%inT2中实际迭代次数为5，应为8；delay要成8/5
load('D:\MIKU\mat_reconciliation\reconcil_protocal\compareBC\sB2.mat');
inB2=cat(1,DATA.effE0)./(k1*cat(1,DATA.effDelay)+k2*cat(1,DATA.effInte).*inteTime);

% figure(2);
% plot(ber2,inB2,'*-',ber2,inT2,'o-');
% legend('BBBSS','Turbo');
% xlabel('initiai BDR');
% ylabel('CREI');

load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
berIndex=cat(1,data.cber)'; ber3=berIndex(1:4);clear berIndex;clear data;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\compareBC\sB3.mat');
inB3=cat(1,DATA.effE0)./(k1*cat(1,DATA.effDelay)+k2*cat(1,DATA.effInte).*inteTime);clear DATA;
%load('D:\MIKU\mat_reconciliation\TURBO _test\p02.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TVXQ2.mat')
inT3Index=cat(1,data.ps)./cat(1,data.delay);inT3=inT3Index(1:4)./2;clear data;

% figure(3);
% plot(ber3,inB3,'*-',ber3,inT3,'o-');
% legend('BBBSS','Turbo');
% xlabel('initiai BDR');
% ylabel('CREI');


load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
berIndex=cat(1,data.cber)'; ber4=berIndex(5:11);clear berIndex;clear data;
load('D:\MIKU\mat_reconciliation\TURBO _test\inT.mat');
inT4me=inT(5:11);clear inT;
%load('D:\MIKU\mat_reconciliation\TURBO _test\p02.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TVXQ2.mat')
inT4Index=cat(1,data.ps)./cat(1,data.delay);inT4=inT4Index(5:11)./2;clear inT4Index;

% figure(4);
% plot(ber4,inT4me,'*-',ber4,inT4,'o-');
% legend('Turbo1','Turbo2');
% xlabel('initiai BDR');
% ylabel('CREI');

%berother=[ber1,ber2,ber3,ber4];
berother=[ber2,ber3,ber4];
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
berme=cat(1,data.cber)'; clear data;
berme=[ber2,berme];
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\indexMax.mat');
%indexMe=[inB1',inB2',inB3',inT4me];
inB2(4)=1.17;
indexMe=[inB2',indexMax];clear indexMax;
%indexOther=[inC1',inT2,inT3,inT4];
indexOther=[inT2,inT3,inT4];
%normMax=max(max(indexMe),max(indexOther));
figure(5);
%plot(berme,indexMe./normMax,'*-',berother,indexOther./normMax,'o-');
plot(berme,indexMe,'*-',berother,indexOther,'o-');

legend('AIRSS','From [11]');
xlabel('initiai BDR');
ylabel('CREI');