%不同码率不同解码算法的时延 比较作图

%iBer=cat(1,data.iBer)';
load('D:\MIKU\mat_reconciliation\TURBO _test\getBer\d1.mat');
ber=cat(1,d1.cber)'; clear d1;
niter=8;m=4;
%d01:lonmap 1/3
load('d01.mat');
% EbN0dB=cat(1,data.EbN0dB)';
% ps=cat(1,data.ps)';
d1=cat(1,data.delay)';
%dec_alg :d ecoding algorithm(0:Log-MAP, 1:SOVA)  
% if dec_alg==0 
%     comp=niter*((4*(2+puncture)+50)*2^m-19);
% else
%     comp=niter*((4*(2+puncture)+9)*2^m+(75*m^2+35*m+5));
% end

%d02 logmap 1/2
load('d021.mat');
d2=cat(1,data.delay)';

%d03 sova 1/2
load('d032.mat');
d3=cat(1,data.delay)';

%d03 sova 1/3
load('d045.mat');
d4=cat(1,data.delay)';

plot(ber,d1,'*-',ber,d2,'o-',ber,d3,'v-',ber,d4,'.-');
legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');
%title('Decoding time delay in Turbo codes');
xlabel('initiai BDR');
ylabel('decoding time/s');
