clc;clear all;
load('D:\MIKU\mat_reconciliation\TURBO _test\inT.mat');
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\dataCin.mat');
cascade=DATA;clear DATA;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataBin.mat');
BBBSS=DATA;clear DATA;
%ber=cat(1,BBBSS.ber);
inteTime=0.03;k1=0.5;k2=0.5;
inB=cat(1,BBBSS.effE0)./(k1*cat(1,BBBSS.effDelay)+k2*cat(1,BBBSS.effInte).*inteTime);
inC=cat(1,cascade.effE0)./(k1*cat(1,cascade.effDelay)+k2*cat(1,cascade.effInte).*inteTime);

plot(ber,inB,'*-',ber,inC,'o-',ber,inT,'v-');
legend('BBBSS','cascade','Turbo');
%title('Decoding time delay in Turbo codes');
xlabel('initiai BDR');
ylabel('reconciliation efficiency rate');