%ÿ�η���nb(i)=2*nb(i-1);
function BBBSS1(ipass)
global data;
global comp;
global lea;
alice=data(ipass).ia;
bob=data(ipass).ib;
Ber_ori=data(ipass).iber;
passLeak=0;
%pass1 �û�
klen=length(bob);
pai_idx=randperm(klen);
alice=alice(:,pai_idx);
bob=bob(:,pai_idx);
%pass1 ������鳤��
blocklen=floor(0.73/Ber_ori);
blocknum=floor(length(alice)/blocklen)+1;
data(ipass).blocklen=blocklen;
comp=comp+2;%division
%������ڷ���
alice=[alice,ones(1,blocknum*blocklen-klen)];%��1
bob=[bob,ones(1,blocknum*blocklen-klen)];
%reshape���н��У���ÿ����żУ�飬���м����н�֯����
alice=reshape(alice,[blocknum,blocklen]);
bob=reshape(bob,[blocknum,blocklen]);
%alice bob�ֱ����ÿ����żУ��ֵ �ȽϺ��ҳ�����������
aliceP=alice';
bobP=bob';
PA=mod(sum(aliceP),2);
PB=mod(sum(bobP),2);
P=xor(PA,PB);
lea=lea+blocknum;
%�������+=ÿ�����У��Ͳ��Ƚ�
comp=comp+(blocknum-1)*blocknum+blocknum;
%����������
errBlockIdx=find(P==1);
%��ǰ�ֳ��������
ne=length(errBlockIdx);
%��ǰ�ִξ���ǰBDR,�������ַ���
BDR=ne/klen;
lea=lea+ne;
%�Գ��������־���
for ine=1:ne
    eBIdx=errBlockIdx(ine);
    ea=alice(eBIdx,:);
    eb=bob(eBIdx,:);
    [ca,cb,leak] = biosect3(ea,eb);
    alice(eBIdx,:)=ca;
    bob(eBIdx,:)=ca;
    passLeak=passLeak+leak;
end
lea=lea+passLeak;
%ÿ�����鶪��1bit���ֲ���żУ���ӵ�й¶ ɾÿ�������һ����
alice(:,1:1)=[];
bob(:,1:1)=[];
alice_cor_reshape=reshape(alice,[1,blocknum*(blocklen-1)]);
bob_cor_reshape=reshape(bob,[1,blocknum*(blocklen-1)]);
%ɾȥй¶���غ󳤶�
lenNew=length(alice_cor_reshape);
%ɾ������ʱ����ı���
alice_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];
bob_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];
%ɾ�������ֲ�й¶
lea=lea-blocknum;
%�����������
Ber_cor=sum(alice_cor_reshape~=bob_cor_reshape)/length(alice_cor_reshape);
 leakSimu=passLeak;
%leakSimu=ne*ceil(log2(blocklen));
data(ipass).oa=alice_cor_reshape;
data(ipass).ob=bob_cor_reshape;
% data(ipass).ober=BDR;
% ÿ�ַ��鳤�ȱ�Ϊ��һ������
if ipass==1
    data(ipass).ober=data(ipass).iber/2;
else
    data(ipass).ober=(data(ipass-1).ober)/2;
end
data(ipass).NE=ne;
data(ipass).cber=Ber_cor;
%data(ipass).leakLower=leakLower;
data(ipass).leakSimu=leakSimu;
%data(ipass).leakUpper=leakUpper;
end

