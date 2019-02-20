function [row,col ] =getPassBlock1(minBlockIdx)
global lea; global comp;global inte;
%minBlockIdx是将oddIdx'视为一列后第一个不为零元素的位置
%找到oddIdx中第一个不为零元素的位置[row,col]，即第row轮第col个块
global oddIdx;
 len=size(oddIdx,2);%oddIdx列数，设定为codelength

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

