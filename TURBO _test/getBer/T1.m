%求EbN0dB和cber关系
clc;clear all
Ber=0.01:0.01:0.04; 
x1=3.5;
x2=7.5;
for i=1:length(Ber)
    ber=Ber(i);
    [eb,cber]=getEbN0db(ber,x1,x2);
    data.EbN0db(i,1)=eb;
    data.cber(i,1)=cber; 
end