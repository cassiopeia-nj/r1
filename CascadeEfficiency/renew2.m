function  renew2(ipass,eIndex)
global lea; global inte;
global data;global comp; global oddIdx;
for i=1:ipass
    %����eIndexλ�ó������ eIndex�ڵ�i���д��ڵ�row���col������
    fIdx=data(i).shuff;
    [row,col]=find(fIdx==eIndex);
    comp=comp+6;
    %���µ�i�ֵ�eIndex[row,col]
    data(i).mb(row,col)=~data(i).mb(row,col);
    comp=comp+1;
    %��i�ֵ�row��block���ڸ���1���أ���ı���żУ���
    oddIdx(i,row)=~oddIdx(i,row); 
    comp=comp+1;
end

