%纠错效率efficiency=keylength/leakage;
function [eS,eU,eL]=getEfficiency1();
global data;
%纠错效率efficiency=keylength/leakage;
% ober=cat(1,data.ober);
% passOberIdx=find(ober==0);
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
finalpass=passOneIdx(1);
%获得密钥长度
keylength=length(data(finalpass).ia);
%泄漏率
leakageSimu=sum(cat(1,data.leakSimu));
leakageLower=sum(cat(1,data.leakLower));
leakageUpper=sum(cat(1,data.leakUpper));
%纠错效率 <1 ，纠错泄露的比密钥还多，无意义 e越大越好
eS=keylength/leakageSimu;
eU=keylength/leakageLower;
eL=keylength/leakageUpper;
end

