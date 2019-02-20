clc;clear

m=3:8;niter=8;
puncture=0;
% dec_alg==0 logmap
    c1=niter*((4*(2+puncture)+50)*2.^m-19);
% dec_alg==1 sova
    c2=niter*((4*(2+puncture)+9)*(2.^m)+(75.*(m.^2)+35.*m+5));

    puncture=1;
% dec_alg==0 logmap
    c3=niter*((4*(2+puncture)+50)*2.^m-19);
% dec_alg==1 sova
    c4=niter*((4*(2+puncture)+9)*2.^m+(75*m.^2+35.*m+5));

    plot(m,c1,'*-',m,c2,'o-',m,c3,'v-',m,c4,'.-');
    legend('logMap,rate=1/2','sova,rate=1/2','logMap, rate=1/3','sova, rate=1/3');
    xlabel('Memory order (Constraint length -1)');
    ylabel('compputation complexity');