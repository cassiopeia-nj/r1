function [ne]=oriPassOddIdx1(alice,bob,ipass)
global oddIdx;
%alice bob�ֱ����ÿ����żУ��ֵ �ȽϺ��ҳ�����������
aliceP=alice';
bobP=bob';
PA=mod(sum(aliceP),2);
PB=mod(sum(bobP),2);
P=xor(PA,PB);
%ipass�־���ǰУ��ͳ���������
errBlockIdx=find(P==1);
ne=length(errBlockIdx);
%ipass�־���ǰУ���Ϊ1������м�¼
oddIdx(ipass,errBlockIdx)=1;
end

