function  writePassOab(ipass)
global data;
%��ǰ��Ϊ���һ��ʱ ���������
[blocknum,blocklen]=size(data(ipass).ma);
klen=length(data(ipass-1).ia);
alice=data(ipass).ma;
bob=data(ipass).mb;

fIdx=data(ipass).shuff;
pai_idx=reshape(fIdx,[1,blocknum*blocklen]);
pai_idx(klen+1:blocknum*blocklen)=[];

alice_cor_reshape=reshape(alice,[1,blocknum*blocklen]);
bob_cor_reshape=reshape(bob,[1,blocknum*blocklen]);
%ɾ������ʱ����ı���
alice_cor_reshape(klen+1:blocknum*blocklen)=[];
bob_cor_reshape(klen+1:blocknum*blocklen)=[];
%���û�
alice_cor_reshape(pai_idx)=alice_cor_reshape;
bob_cor_reshape(pai_idx)=bob_cor_reshape;
data(ipass).oa=alice_cor_reshape;
data(ipass).ob=bob_cor_reshape;

end

