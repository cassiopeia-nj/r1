function [bob,Ber_ori] = genkey( alice,snr )
len=length(alice);
alice0=0.5.*alice+0.5*ones(1,len);
modbit1 = pskmod(alice0,2); %���Ƽ��ص���
 modbit2= awgn(modbit1,snr,'measured');%bob���յ��ź�
 bob0=pskdemod(modbit2,2);
 bob=2.*(bob0-0.5*ones(1,len));
 ori_error=(alice0~=bob0);
 Ber_ori=sum(ori_error)/length(alice0);
end

