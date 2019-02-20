clear all;clc;
%d1 中ber0.005-0.05
% load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d1.mat');
% ber1=cat(1,d1.cber)'; clear d1;
% % load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
% % ber2=cat(1,data.cber)'; clear data;
% 
% load('d01.mat');
% d1=cat(1,data.delay)';
% load('d021.mat');
% d2=cat(1,data.delay)';
% load('d032.mat');
% d3=cat(1,data.delay)';
% load('d045.mat');
% d4=cat(1,data.delay)';
% 
% delay(1,:)=d1';
% delay(2,:)=d2';
% delay(3,:)=d3';
% delay(4,:)=d4';
% maxDelay=max(max(delay));
% d1=d1./maxDelay;in1=1./d1;
% d2=d2./maxDelay;in2=1./d2;
% d3=d3./maxDelay;in3=1./d3;
% d4=d4./maxDelay;in4=1./d4;
% 
% plot(ber1,in1,'*-',ber1,in2,'o-',ber1,in3,'v-',ber1,in4,'.-');
% legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');

%%%0.1~0.15的ps,和delay

%不同码率不同解码算法的时延 比较作图
clear;
%iBer=cat(1,data.iBer)';
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;
niter=8;m=4;
%d01:lonmap 1/3
load('D:\MIKU\mat_reconciliation\TURBO _test\p01.mat');
% EbN0dB=cat(1,data.EbN0dB)';
% ps=cat(1,data.ps)';
in1=cat(1,data.ps)./cat(1,data.delay);
%d02 logmap 1/2
load('D:\MIKU\mat_reconciliation\TURBO _test\p02.mat');
in2=cat(1,data.ps)./cat(1,data.delay);
%d03 sova 1/2
load('D:\MIKU\mat_reconciliation\TURBO _test\p03.mat');
in3=cat(1,data.ps)./cat(1,data.delay);

%d03 sova 1/3
load('D:\MIKU\mat_reconciliation\TURBO _test\p04.mat');
in4=cat(1,data.ps)./cat(1,data.delay);
% 
% load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\cascade.mat')
% load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataB.mat')
% ber2=cat(1,BBBSS.effE0);
% inteTime=0.005;
% inB=cat(1,BBBSS.effE0)./(cat(1,BBBSS.effDelay)+cat(1,BBBSS.effInte).*inteTime);
% inC=cat(1,cascade01.effE0)./(cat(1,cascade01.effDelay)+cat(1,cascade01.effInte).*inteTime);

inT=[in4(1:8),in1(9:11)];
plot(ber,in1,'*-',ber,in2,'o-',ber,in3,'v-',ber,in4,'.-');
legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');
%title('Decoding time delay in Turbo codes');
xlabel('initiai BDR');
ylabel('Turbo reconciliation efficiency rate');

