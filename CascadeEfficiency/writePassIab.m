function writePassIab( ipass)

global data;

%��ǰһ��ma mb,reshape+��β+���û� ��Ϊ��һ������
codelength=length(data(ipass-1).ia);
[blocknum,blocklen]=size(data(ipass-1).ma);klen=codelength;
fIdx=data(ipass-1).shuff;
pai_idx=reshape(fIdx,[1,blocknum*blocklen]);
pai_idx(klen+1:blocknum*blocklen)=[];

alice=data(ipass-1).ma;
bob=data(ipass-1).mb;
alice_cor_reshape=reshape(alice,[1,blocknum*blocklen]);
bob_cor_reshape=reshape(bob,[1,blocknum*blocklen]);
%ɾ������ʱ����ı���
alice_cor_reshape(klen+1:blocknum*blocklen)=[];
bob_cor_reshape(klen+1:blocknum*blocklen)=[];
%���û�
alice_cor_reshape(pai_idx)=alice_cor_reshape;
bob_cor_reshape(pai_idx)=bob_cor_reshape;

data(ipass).ia=alice_cor_reshape;
data(ipass).ib=bob_cor_reshape;
% data(ipass).ober=BDR;
end

