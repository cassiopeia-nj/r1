function [bob] = genBer(alice,ber)
%发送序列 +1/-1,将接受序列变成与其不一致率为ber的序列；
%ber=1/100;
% alice=en_output;
bob=alice;
orilen=length(alice);
idx=randperm(orilen);
nErrBit=floor(ber*orilen);%不一致比特数
idxErrBit=idx(1:nErrBit);
bob(idxErrBit)=-(bob(idxErrBit));
end



