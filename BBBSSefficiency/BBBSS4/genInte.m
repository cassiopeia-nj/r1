function genInte
global inte; global data;
%����BBBSS�н�������
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
%����û����Ҫfinalpass��
finalpass=passOneIdx(1);
for iipass=1:finalpass
    inte=inte+ceil(log2(data(iipass).blocklen))+1;
end


end

