function genInte
global inte; global data;
%计算BBBSS中交互次数
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
%纠到没错共需要finalpass轮
finalpass=passOneIdx(1);
for iipass=1:finalpass
    inte=inte+ceil(log2(data(iipass).blocklen))+1;
end


end

