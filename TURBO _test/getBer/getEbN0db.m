
function [ennodb,ber]=getEbN0db(BER,x1,x2)
%已知iniBer 和一定区间 求iniBer对应的EbN0
while 1
    step=abs(x1-x2)/5;
    EbN0db=x1:step:x2;
    for ii=1:length(EbN0db)
        ebn0db=EbN0db(ii);
        [ib] = getBer(ebn0db);

        if sign(ib-BER)<0
            %         x1=EbN0db(ii-1);
            %         x2=EbN0db(ii);
            x1=ebn0db-step;
            x2=ebn0db;
            break;
            break;
        end
    end
    if abs(x1-x2)<0.001
        break;
    end
end
ennodb=(x1+x2)/2;
[ber] = getBer(ennodb);
end
 
 
 