function [eIndex ] = getEIndex1(ipass,eBIdx )
global data;global lea; global comp;global inte;
%����oddIdx����ipass�ֵĵ�eBIdx��У���Ϊ1������������ص�ԭʼλ��eIndex
    ea=data(ipass).ma(eBIdx,:);
    eb=data(ipass).mb(eBIdx,:);
    [ca,cb,loc,leak] = biosect4(ea,eb);
    lea=lea+leak;
    l1=length(ca);
    inte=inte+ceil(log2(l1));
%   alice(eBIdx,:)=ca;
%   bob(eBIdx,:)=cb;
%�ҵ�ipass�ֵ�eBIdx��loc��������صĳ�ʼ��� ΪeIndex
    index1=data(ipass).shuff;
    eIndex=index1(eBIdx,loc);%����λ��ԭʼ���
end

