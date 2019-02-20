% function [ alice0,bob0,Ber_ori ] = gen_key(orilen,snr )\
% alice0=randi([0,1],1,orilen);
% modbit1 = pskmod(alice0,2); %相移键控调制
% modbit2= awgn(modbit1,snr,'measured');%bob端收到信号
% bob0=pskdemod(modbit2,2);
% ori_error=(alice0~=bob0);
% Ber_ori=sum(ori_error)/length(alice0);
function [ alice0,bob0] = gen_key(orilen, oriBer )
% orilen=10; oriBer=0.2;
% alice0=1:10;
alice0=randi([0,1],1,orilen);
bob0=alice0;
idx=randperm(orilen);
nErrBit=floor(oriBer*orilen);
idxErrBit=idx(1:nErrBit);
bob0(idxErrBit)=~bob0(idxErrBit);
end

