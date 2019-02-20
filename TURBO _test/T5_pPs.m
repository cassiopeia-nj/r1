  %不同码率不同解码算法的时延 比较作图
clear;
%iBer=cat(1,data.iBer)';
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d2.mat');
ber=cat(1,data.cber)'; clear data;
niter=8;m=4;
%d01:lonmap 1/3
load('p01.mat');
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
load('p02.mat');
p2=cat(1,data.ps)';

%d03 sova 1/2
load('p03.mat');
p3=cat(1,data.ps)';

%d03 sova 1/3
load('p04.mat');
p4=cat(1,data.ps)';

plot(ber,p1,'*-',ber,p2,'o-',ber,p3,'v-',ber,p4,'.-');
legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');
%title('Decoding time delay in Turbo codes');
xlabel('initiai BDR');
ylabel('reconciliation success rate');
