function [eIndex ] = getEIndex1(ipass,eBIdx )
global data;global lea; global comp;global inte;
%根据oddIdx发现ipass轮的第eBIdx块校验和为1，纠处错误比特的原始位置eIndex
    ea=data(ipass).ma(eBIdx,:);
    eb=data(ipass).mb(eBIdx,:);
    [ca,cb,loc,leak] = biosect4(ea,eb);
    lea=lea+leak;
    l1=length(ca);
    inte=inte+ceil(log2(l1));
%   alice(eBIdx,:)=ca;
%   bob(eBIdx,:)=cb;
%找到ipass轮第eBIdx组loc个出错比特的初始序号 为eIndex
    index1=data(ipass).shuff;
    eIndex=index1(eBIdx,loc);%出错位置原始标号
end

