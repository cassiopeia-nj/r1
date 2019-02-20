function [ne]=oriPassOddIdx1(alice,bob,ipass)
global oddIdx;
%alice bob分别计算每行奇偶校验值 比较后找出出错分组序号
aliceP=alice';
bobP=bob';
PA=mod(sum(aliceP),2);
PB=mod(sum(bobP),2);
P=xor(PA,PB);
%ipass轮纠错前校验和出错分组序号
errBlockIdx=find(P==1);
ne=length(errBlockIdx);
%ipass轮纠错前校验和为1的组进行记录
oddIdx(ipass,errBlockIdx)=1;
end

