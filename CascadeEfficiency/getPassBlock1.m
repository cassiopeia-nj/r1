function [row,col ] =getPassBlock1(minBlockIdx)
global lea; global comp;global inte;
%minBlockIdx�ǽ�oddIdx'��Ϊһ�к��һ����Ϊ��Ԫ�ص�λ��
%�ҵ�oddIdx�е�һ����Ϊ��Ԫ�ص�λ��[row,col]������row�ֵ�col����
global oddIdx;
 len=size(oddIdx,2);%oddIdx�������趨Ϊcodelength

r1=rem(minBlockIdx,len);
comp=comp+1;
if r1==0
   row= minBlockIdx/len;
   col=len;comp=comp+1;
else
   row=floor(minBlockIdx/len)+1;
   col=r1;comp=comp+2;
end


end

