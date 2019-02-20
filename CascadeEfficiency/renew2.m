function  renew2(ipass,eIndex)
global lea; global inte;
global data;global comp; global oddIdx;
for i=1:ipass
    %更新eIndex位置出错比特 eIndex在第i轮中处于第row组第col个比特
    fIdx=data(i).shuff;
    [row,col]=find(fIdx==eIndex);
    comp=comp+6;
    %更新第i轮的eIndex[row,col]
    data(i).mb(row,col)=~data(i).mb(row,col);
    comp=comp+1;
    %第i轮第row个block由于更新1比特，需改变奇偶校验和
    oddIdx(i,row)=~oddIdx(i,row); 
    comp=comp+1;
end

