%legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');
clc;clear;
%dec_alg :decoding algorithm(0:Log-MAP, 1:SOVA)  
% if dec_alg==0 
%     comp=niter*((4*(2+puncture)+50)*2^m-19);
% else
%     comp=niter*((4*(2+puncture)+9)*2^m+(75*m^2+35*m+5));
% end
clear;clc;niter=8;%m=4;%K=5;  % K=constraint length
K=3:8;
puncture=1;
comp1=niter.*((4*(2+puncture)+50).*2.^(K-1)-19);
puncture=0;
comp2=niter.*((4*(2+puncture)+50).*2.^(K-1)-19);
puncture=0;m=2:7;
comp3=niter.*((4*(2+puncture)+9)*(2.^(K-1))+(75.*((K-1).^2)+(35.*(K-1))+5));
puncture=1;
comp4=niter.*((4*(2+puncture)+9)*(2.^(K-1))+(75.*(K-1).^2+(35.*(K-1))+5));
plot(K,comp1,'*-',K,comp2,'o-',K,comp3,'v-',K,comp4,'.-');
legend('logMap,rate=1/3','logMap, rate=1/2','sova,rate=1/2','sova, rate=1/3');
%title('Computational complexity with constraint length');
xlabel('Constraint length');
ylabel('Computational complexity');
