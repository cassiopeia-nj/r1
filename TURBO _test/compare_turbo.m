clear;
%d1:logmap rate=1/3
%d2:logmap rate=1/2
%d3: sova  rate=1/2
%d4: sova  rate=1/3

load('d01.mat');
d1=data;clear data;
load('d02.mat');
d2=data;clear data;
load('d03.mat');
d3=data;clear data;
load('d04.mat');
d4=data;clear data;

ber=0.005:0.005:0.05;
delay1=cat(1,d1.delay);
delay2=cat(1,d2.delay);
delay3=cat(1,d3.delay);
delay4=cat(1,d4.delay);

plot(ber,delay1);
hold on;
plot(ber,delay2);
hold on;
plot(ber,delay3);
hold on;
plot(ber,delay4);

%%%%%%%%%%%%%%%
niter=8;puncture=0;m=4;
 comp=niter*((4*(2+puncture)+50)*2^m-19);
 comp=niter*((4*(2+puncture)+9)*2^m+(75*m^2+35*m+5));