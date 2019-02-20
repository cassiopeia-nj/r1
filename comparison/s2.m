clear all;
load('D:\MIKU\mat_reconciliation\TURBO _test\inT.mat');
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\dataCin.mat');
cascade=DATA;clear DATA;
load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataBin.mat');
BBBSS=DATA;clear DATA;

e0b=cat(1,BBBSS.effE0)';
e0c=cat(1,cascade.effE0)';
%%%%%%%%%%%%%%%%%%
  %不同码率不同解码算法的时延 比较作图
%iBer=cat(1,data.iBer)';
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;

%d01:lonmap 1/3
load('D:\MIKU\mat_reconciliation\TURBO _test\p01.mat');
% EbN0dB=cat(1,data.EbN0dB)';
% ps=cat(1,data.ps)';
p1=cat(1,data.ps)';
%dec_alg :d ecoding algorithm(0:Log-MAP, 1:SOVA)  
% if dec_alg==0 
%     comp=niter*((4*(2+puncture)+50)*2^m-19);
% else
%     comp=niter*((4*(2+puncture)+9)*2^m+(75*m^2+35*m+5));
% end

%d02 logmap 1/2
load('D:\MIKU\mat_reconciliation\TURBO _test\p02.mat');
p2=cat(1,data.ps)';

%d03 sova 1/2
load('D:\MIKU\mat_reconciliation\TURBO _test\p03.mat');
p3=cat(1,data.ps)';

%d03 sova 1/3
load('D:\MIKU\mat_reconciliation\TURBO _test\p04.mat');
p4=cat(1,data.ps)';


plot(ber,p1,'*-',ber,p2,'o-',ber,p3,'v-',ber,p4,'+-',ber,e0b,'s-',ber,e0c,'d-');
legend('Turbo(logMap,rate=1/3)','Turbo(logMap, rate=1/2)','Turbo(sova,rate=1/2)','Turbo(sova, rate=1/3)','BBBSS','Cascade');
%title('Efficiency0 comparison of reconciliation schemes');
xlabel('initiai BDR');
ylabel('Average efficiency0');