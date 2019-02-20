
%纠错效率efficiency0=1-leakage/keylength

function [e0,finalpass]=getEfficiency2();
global data;global lea;

% ober=cat(1,data.ober);
% passOberIdx=find(ober==0);
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
finalpass=passOneIdx(1);
%获得密钥长度
keylength=length(data(finalpass).ia);
%泄漏率
leakageSimu=sum(cat(1,data.leakSimu));

%纠错效率 <1 ，纠错泄露的比密钥还多，无意义 e越大越好
%e0=1-leakageSimu/keylength;
e0=1-lea/keylength;
end

