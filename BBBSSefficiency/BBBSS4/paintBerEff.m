%bisect�ж������ص�efficiency�����ޡ�����ֵ
load('D:\MIKU\mat_reconciliation\reconcil_protocal\BBBSS\BBBSS4\DATA4.mat');
%�����ʼBER
BDR=cat(1,BBBSS4.ber);

%����Э������ eff max=1+p*lb(p)+(1-p)*lb(1-p);
%effThe=1+BDR.*log2(BDR)+(1-BDR).*log2(1-BDR);

%BBBSS eff�����������޺ͷ�����
EL=cat(1,BBBSS4.effLower);
%ES=cat(1,DATA.berSimu);
ES=cat(1,BBBSS4.effSimu);
%EU=cat(1,DATA.berUpper);
EU=cat(1,BBBSS4.effUpper);

%plot(BDR,effThe);hold on;
plot(BDR,EL);hold on;
plot(BDR,ES);hold on;
plot(BDR,EU);hold on;
% legend('reconciliation limitation','lower bound','simulation','upper bound');
legend('lower bound','simulation','upper bound');
xlabel('initialBDR');ylabel('protocol efficiency');title('BBBSS efficiency simulation with discarding in bisect');