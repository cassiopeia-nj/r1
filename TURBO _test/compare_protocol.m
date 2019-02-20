clc;clear;
%不同误码率下，两种协议efficiency0比较 即泄漏率
load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSSefficiency\BBBSS4\dataB.mat');
load('D:\MIKU\mat_reconciliation\reconcil_protocal\Cascade\CascadeEfficiency\cascade.mat');
cascade=cascade01;clear cascade01;

ber=cat(1,BBBSS.ber)';
bE0=cat(1,BBBSS.effE0)';
bD=cat(1,BBBSS.effDelay)';
bC=cat(1,BBBSS.effComp)';
bI=cat(1,BBBSS.effInte)';

cE0=cat(1,cascade.effE0)';
cD=cat(1,cascade.effDelay)';
cC=cat(1,cascade.effComp)';
cI=cat(1,cascade.effInte)';

ber0=ber;
subplot(221)
plot(ber,bE0,'*',ber,cE0,'o');
hold on
p1=spline(ber,bE0,ber0);
q1=spline(ber,cE0,ber0);
plot(ber,p1,'r',ber,q1,'b');
legend('BBBSS','Cascade');
title('efficiency0');

subplot(222)
plot(ber,bD,'*',ber,cD,'o');
hold on
p2=spline(ber,bD,ber0);
q2=spline(ber,cD,ber0);
plot(ber,p2,'r',ber,q2,'b');
legend('BBBSS','Cascade');
title('Delay');

subplot(223)
plot(ber,bC,'*',ber,cC,'o');
hold on
p3=spline(ber,bC,ber0);
q3=spline(ber,cC,ber0);
plot(ber,p3,'r',ber,q3,'b');
legend('BBBSS','Cascade');
title('complexity');

subplot(224)
plot(ber,bI,'*',ber,cI,'o');
hold on
p4=spline(ber,bI,ber0);
q4=spline(ber,cI,ber0);
plot(ber,p4,'r',ber,q4,'b');
legend('BBBSS','Cascade');
title('Interaction');

figure(2)
% plot(ber,bD)
plot(ber,bD,'*',ber,cD,'o');
% hold on
% p2=spline(ber,bD,ber0);
% q2=spline(ber,cD,ber0);
% plot(ber,p2,'r',ber,q1,'b');
legend('BBBSS','Cascade');
title('Delay');

figure(2)
plot(ber,bE0,'r*-',ber,cE0,'bo-');
legend('BBBSS','Cascade');
xlabel('initial BDR');
ylabel('efficiency0 ');
% title('efficiency0 of reconciliation protocols');

figure(3)
plot(ber,bD,'r*-',ber,cD,'bo-');
legend('BBBSS','Cascade');
title('Delay');

figure(4)
plot(ber,bC,'r*-',ber,cC,'bo-');
legend('BBBSS','Cascade');
xlabel('initial BDR');
ylabel('computational complexity ');
% title('computational complexity of reconciliation protocols');

figure(5)
plot(ber,bI,'r*-',ber,cI,'bo-');
legend('BBBSS','Cascade');
xlabel('initial BDR');
ylabel('interaction times ');
%title('Interaction times of of reconciliation protocols');

