%����Ч��efficiency=keylength/leakage;
function [eS,eU,eL]=getEfficiency1();
global data;
%����Ч��efficiency=keylength/leakage;
% ober=cat(1,data.ober);
% passOberIdx=find(ober==0);
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
finalpass=passOneIdx(1);
%�����Կ����
keylength=length(data(finalpass).ia);
%й©��
leakageSimu=sum(cat(1,data.leakSimu));
leakageLower=sum(cat(1,data.leakLower));
leakageUpper=sum(cat(1,data.leakUpper));
%����Ч�� <1 ������й¶�ı���Կ���࣬������ eԽ��Խ��
eS=keylength/leakageSimu;
eU=keylength/leakageLower;
eL=keylength/leakageUpper;
end

