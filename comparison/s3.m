clear all;
%load('D:\MIKU\mat_reconciliation\TURBO _test\inT.mat');
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;
%load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\dataCin.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\\DATA\C0.mat');
cascade=DATA;clear DATA;
%load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataBin.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\B0.mat');
BBBSS=DATA;clear DATA;
%ber=cat(1,BBBSS.ber);
inteTime=0.03;k1=0.5;k2=0.5;
inB=cat(1,BBBSS.effE0)./(k1*cat(1,BBBSS.effDelay)+k2*cat(1,BBBSS.effInte).*inteTime);
inC=cat(1,cascade.effE0)./(k1*cat(1,cascade.effDelay)+k2*cat(1,cascade.effInte).*inteTime);
%%%%%%%%%%%%%%%%%turbo
%iBer=cat(1,data.iBer)';


%d01:lonmap 1/3
%load('D:\MIKU\mat_reconciliation\TURBO _test\p01.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TVXQ1.mat');
% EbN0dB=cat(1,data.EbN0dB)';
% ps=cat(1,data.ps)';
in1=cat(1,data.ps)./cat(1,data.delay);
%d02 logmap 1/2 
%load('D:\MIKU\mat_reconciliation\TURBO _test\p02.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TVXQ2.mat');
in2=cat(1,data.ps)./cat(1,data.delay);
%d03 sova 1/2
%load('D:\MIKU\mat_reconciliation\TURBO _test\p03.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TV31.mat');
in3=cat(1,data.ps)./cat(1,data.delay);

%d03 sova 1/3
%load('D:\MIKU\mat_reconciliation\TURBO _test\p04.mat');
load('D:\MIKU\mat_reconciliation\VTC2019mat\comparison\DATA\TV41.mat');
in4=cat(1,data.ps)./cat(1,data.delay);
% 
% load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\cascade.mat')
% load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataB.mat')
% ber2=cat(1,BBBSS.effE0);
% inteTime=0.005;
% inB=cat(1,BBBSS.effE0)./(cat(1,BBBSS.effDelay)+cat(1,BBBSS.effInte).*inteTime);
% inC=cat(1,cascade01.effE0)./(cat(1,cascade01.effDelay)+cat(1,cascade01.effInte).*inteTime);

plot(ber,inB,'s-',ber,inC,'d-',ber,in1./2,'*-',ber,in2./2,'o-',ber,in3./2,'v-',ber,in4./2,'+-');
legend('BBBSS','Cascade','Turbo(logMap,rate=1/3)','Turbo(logMap, rate=1/2)','Turbo(sova,rate=1/2)','Turbo(sova, rate=1/3)');
%title('CREI of different reconciliation schemes');
xlabel('initiai BDR');
ylabel('CREI');

indexAll=[inB';inC';in1;in2;in3./2;in4./2];
indexMax=max(indexAll);
