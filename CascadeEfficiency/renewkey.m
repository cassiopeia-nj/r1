%根据当前分组码的组号ii和出错位置loc1 计算初始出错编号
function [mark0] =renewkey(loc1,blocknum1,ii,index1)
     mark=(loc1-1)*blocknum1+ii;
     [tf,mark0]=ismember(mark,index1);
end

