%每次分组nb(i)=2*nb(i-1);
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
%pass1 置换
klen=length(bob);
pai_idx=randperm(klen);
alice=alice(:,pai_idx);
bob=bob(:,pai_idx);
%pass1 计算分组长度
blocklen=floor(0.73/Ber_ori);
blocknum=floor(length(alice)/blocklen)+1;
comp=comp+2;%division
%补零便于分组
alice=[alice,zeros(1,blocknum*blocklen-klen)];%补1
bob=[bob,zeros(1,blocknum*blocklen-klen)];

%reshape按列进行，对每行奇偶校验，按行检验有交织作用
alice=reshape(alice,[blocknum,blocklen]);
bob=reshape(bob,[blocknum,blocklen]);

%alice bob分别计算每行奇偶校验值 比较后找出出错分组序号
aliceP=alice';
bobP=bob';
PA=mod(sum(aliceP),2);
PB=mod(sum(bobP),2);
P=xor(PA,PB);
%计算次数+=每组计算校验和并比较
comp=comp+(blocknum-1)*blocknum+blocknum;
inte=inte+1;
%出错分组序号
errBlockIdx=find(P==1);
comp=comp+6;
inte=inte+1;
%当前轮出错分组数
ne=length(errBlockIdx);
%当前轮次纠错前BDR,用于下轮分组
BDR=ne/klen;
%对出错分组二分纠错
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
% %每个分组丢弃1bit来弥补奇偶校验子的泄露 删每个分组第一比特
% alice(:,1:1)=[];
% bob(:,1:1)=[];
% alice_cor_reshape=reshape(alice,[1,blocknum*(blocklen-1)]);
% bob_cor_reshape=reshape(bob,[1,blocknum*(blocklen-1)]);
%删去泄露比特后长度
%lenNew=length(alice_cor_reshape);
%删除分组时补零的比特
%alice_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];
%bob_cor_reshape(lenNew-(blocknum*blocklen-klen)+1:lenNew)=[];

%当前轮分组纠错后AliceBob矩阵
data(ipass).ma=alice;
data(ipass).mb=bob;

alice_cor_reshape=reshape(alice,[1,blocknum*blocklen]);
bob_cor_reshape=reshape(bob,[1,blocknum*blocklen]);
%删除分组时补零的比特
alice_cor_reshape(klen+1:blocknum*blocklen)=[];
bob_cor_reshape(klen+1:blocknum*blocklen)=[];
%逆置换
alice_cor_reshape(pai_idx)=alice_cor_reshape;
bob_cor_reshape(pai_idx)=bob_cor_reshape;

%纠错后误码率
Ber_cor=sum(alice_cor_reshape~=bob_cor_reshape)/klen;
leakSimu=passLeak;
% leakLower=floor(log2(blocklen))*ne;
% leakUpper=ceil(log2(blocklen))*ne;
data(ipass).oa=alice_cor_reshape;
data(ipass).ob=bob_cor_reshape;
% data(ipass).ober=BDR;
% 每轮分组长度变为上一轮两倍
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
%分组&置换矩阵存储 
idx=[pai_idx,zeros(1,blocknum*blocklen-klen)];
idx=reshape(idx,[blocknum,blocklen]);
data(ipass).shuff=idx;
end

