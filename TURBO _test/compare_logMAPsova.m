%logMAP sova¶Ô±È
x=0.5:0.5:5;
load('sova.mat');
load('log.mat');
semilogy(x,log,'*');
hold on;
semilogy(x,sova,'o');
hold on;

%legend('not coded','(15,5)BCH coded','(15,7)BCH coded'); %,'(15,11)BCH coded'
legend('logMAP','sova');
xlabel('EbN0/dB');
ylabel('BER');
title('Decoding performance comparison of logMAP and sova');