function writePassIab( ipass)

global data;

%将前一轮ma mb,reshape+截尾+逆置换 作为下一轮输入
codelength=length(data(ipass-1).ia);
[blocknum,blocklen]=size(data(ipass-1).ma);klen=codelength;
fIdx=data(ipass-1).shuff;
pai_idx=reshape(fIdx,[1,blocknum*blocklen]);
pai_idx(klen+1:blocknum*blocklen)=[];

alice=data(ipass-1).ma;
bob=data(ipass-1).mb;
alice_cor_reshape=reshape(alice,[1,blocknum*blocklen]);
bob_cor_reshape=reshape(bob,[1,blocknum*blocklen]);
%删除分组时补零的比特
alice_cor_reshape(klen+1:blocknum*blocklen)=[];
bob_cor_reshape(klen+1:blocknum*blocklen)=[];
%逆置换
alice_cor_reshape(pai_idx)=alice_cor_reshape;
bob_cor_reshape(pai_idx)=bob_cor_reshape;

data(ipass).ia=alice_cor_reshape;
data(ipass).ib=bob_cor_reshape;
% data(ipass).ober=BDR;
end

