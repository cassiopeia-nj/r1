function cascade3(ipass)
global inte;global lea;
global comp;global data;global oddIdx;
codelength=length(data(ipass-1).ia);
%����ǰһ��ma,mb д�뵱ǰipass��ia ib
writePassIab(ipass);
data(ipass).iber=data(ipass-1).ober;
alice=data(ipass).ia;
bob=data(ipass).ib;
Ber_ori=data(ipass).iber;
passLeak=0;
%pass1 �û�
klen=length(bob);
pai_idx=randperm(codelength);
%pai_idx=klen:(-1):1;
alice=alice(:,pai_idx);
bob=bob(:,pai_idx);
%pass1 ������鳤��
blocklen=floor(0.73/Ber_ori);
blocknum=floor(length(alice)/blocklen)+1;
comp=comp+2;%division
%������ڷ���
alice=[alice,zeros(1,blocknum*blocklen-klen)];%��0
bob=[bob,zeros(1,blocknum*blocklen-klen)];

%reshape���н��У���ÿ����żУ�飬���м����н�֯����
alice=reshape(alice,[blocknum,blocklen]);
bob=reshape(bob,[blocknum,blocklen]);

%����������ipass���и���У�������oddIdx����ʼ�����ֵ�oddIdx
[ne]=oriPassOddIdx1(alice,bob,ipass);
data(ipass).ma=alice;
data(ipass).mb=bob;
idx=[pai_idx,zeros(1,blocknum*blocklen-klen)];
idx=reshape(idx,[blocknum,blocklen]);
inte=inte+2;
lea=lea+blocknum;
comp=comp+blocknum*blocklen;

data(ipass).shuff=idx;%�û�����д��
%�Գ��������־���
for ine=1:blocknum
    flag1=0;
    %ine=3;
    %�Ե�ipass��ÿ��block����OdddIdx�ж�У��� �Ƿ���Ҫ���� block������ine
    if oddIdx(ipass,ine)
        %��ipass��ine����,����oddIdx����ipass�ֵĵ�eBIdx��У���Ϊ1������������ص�ԭʼλ��eIndex
        [eIndex] = getEIndex1(ipass,ine);
        %�����ҳ��Ĵ������eIndex(��ʼ���) �������ִ��н��и��£����ı���������������У���(����oddIdx)
        inte=inte+1;
        lea=lea+1;
        renew2(ipass,eIndex);
        while 1
            oddIdx1=oddIdx';
            parityIdx=find(oddIdx1);%��oddIdx����һ�У�parityIdxΪ���в�Ϊ��Ԫ��λ��
            comp=comp+1;
            
            if parityIdx % oddIdx���ڲ�Ϊ0Ԫ��;��oddIdxȫΪ�㣬������һ�� ipass++��
                if min(parityIdx)<=(codelength*(ipass-1)+ine)%�ڵ�ǰipass��ine��֮ǰ��У���Ϊ1�Ŀ� �������
                    comp=comp+(2+1+1);
                    %�ҳ���ǰipass��ine��֮ǰУ���Ϊ1�Ŀ���blocklen��С��ͬһ���п�����ǰ�Ŀ�fB���Ⱦ���
                    %�ҵ�ѡ��Ŀ�fB�����ִ�������
                    minBlockIdx=min(parityIdx);
                    comp=comp+2;
                    [fP,fB] =getPassBlock1(minBlockIdx);
                    %�Գ����fP��fB����� �õ�������س�ʼ���eIndex2
                    [eIndex2] = getEIndex1(fP,fB);
                    %���µ�ǰ������eIndex2�������parity
                    renew2(ipass,eIndex2);
                else break;
                end
            else flag1=1;break;
            end
        end
    end
   if flag1
       break;
   end
end

%���ݵ�ǰ��ma mbд�뵱ǰ��oa,ob
writePassOab(ipass);
data(ipass).ober=(data(ipass-1).ober)/2;
data(ipass).cber=sum(xor(data(ipass).oa,data(ipass).ob))/codelength;

end

