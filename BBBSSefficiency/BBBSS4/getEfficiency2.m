
%����Ч��efficiency0=1-leakage/keylength

function [e0,finalpass]=getEfficiency2();
global data;global lea;

% ober=cat(1,data.ober);
% passOberIdx=find(ober==0);
ne=cat(1,data.NE);
passOneIdx=find(ne==0);
finalpass=passOneIdx(1);
%�����Կ����
keylength=length(data(finalpass).ia);
%й©��
leakageSimu=sum(cat(1,data.leakSimu));

%����Ч�� <1 ������й¶�ı���Կ���࣬������ eԽ��Խ��
%e0=1-leakageSimu/keylength;
e0=1-lea/keylength;
end

