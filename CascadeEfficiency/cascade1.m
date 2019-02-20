%ÿ�η���nb(i)=2*nb(i-1);
function cascade1(ipass)
global data;
global lea;
global comp; 
global inte;
if ipass>1 
data(ipass).ia=data(ipass-1).oa;
data(ipass).ib=data(ipass-1).ob;
data(ipass).iber=data(ipass-1).ober;
end
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
comp=comp+2;%division
%������ڷ���
alice=[alice,zeros(1,blocknum*blocklen-klen)];%��1
bob=[bob,zeros(1,blocknum*blocklen-klen)];

%reshape���н��У���ÿ����żУ�飬���м����н�֯����
alice=reshape(alice,[blocknum,blocklen]);
bob=reshape(bob,[blocknum,blocklen]);

%alice bob�ֱ����ÿ����żУ��ֵ �ȽϺ��ҳ�����������
aliceP=alice';
bobP=bob';
PA=mod(sum(aliceP),2);
PB=mod(sum(bobP),2);
P=xor(PA,PB);
%�������+=ÿ�����У��Ͳ��Ƚ�
comp=comp+(blocknum-1)*blocknum+blocknum;
inte=inte+1;
%����������
errBlockIdx=find(P==1);
comp=comp+6;
inte=inte+1;
%��ǰ�ֳ��������
ne=length(errBlockIdx);
%��ǰ�ִξ���ǰBDR,�������ַ���
BDR=ne/klen;
%�Գ��������־���
for ine=1:ne
    eBIdx=errBlockIdx(ine);
    ea=alice(eBIdx,:);
    eb=bob(eBIdx,:);
    [ca,cb,leak] = biosect3(ea,eb);
    alice(eBIdx,:)=ca;
    bob(eBIdx,:)=cb;
    passLeak=passLeak+leak;
end
inte=inte+ceil(log2(blocklen));
lea=lea+passLeak;
% %ÿ�����鶪��1bit���ֲ���żУ���ӵ�й¶ ɾÿ�������һ����
% alice(:,1:1)=[];
% bob(:,1:1)=[];
% alice_cor_reshape=reshape(alice,[1,blocknum*(blocklen-1)]);
% bob_cor_reshape=reshape(bob,[1,blocknum*(blocklen-1)]);
%ɾȥй¶���غ󳤶�
%lenNew=length(alice_cor_reshape);
%ɾ������ʱ����ı���
%alice_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];
%bob_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];

%��ǰ�ַ�������AliceBob����
data(ipass).ma=alice;
data(ipass).mb=bob;

alice_cor_reshape=reshape(alice,[1,blocknum*blocklen]);
bob_cor_reshape=reshape(bob,[1,blocknum*blocklen]);
%ɾ������ʱ����ı���
alice_cor_reshape(klen+1:blocknum*blocklen)=[];
bob_cor_reshape(klen+1:blocknum*blocklen)=[];
%���û�
alice_cor_reshape(pai_idx)=alice_cor_reshape;
bob_cor_reshape(pai_idx)=bob_cor_reshape;

%�����������
Ber_cor=sum(alice_cor_reshape~=bob_cor_reshape)/klen;
leakSimu=passLeak;
% leakLower=floor(log2(blocklen))*ne;
% leakUpper=ceil(log2(blocklen))*ne;
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
%����&�û�����洢 
idx=[pai_idx,zeros(1,blocknum*blocklen-klen)];
idx=reshape(idx,[blocknum,blocklen]);
data(ipass).shuff=idx;
end

