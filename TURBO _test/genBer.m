function [bob] = genBer(alice,ber)
%�������� +1/-1,���������б�����䲻һ����Ϊber�����У�
%ber=1/100;
% alice=en_output;
bob=alice;
orilen=length(alice);
idx=randperm(orilen);
nErrBit=floor(ber*orilen);%��һ�±�����
idxErrBit=idx(1:nErrBit);
bob(idxErrBit)=-(bob(idxErrBit));
end



