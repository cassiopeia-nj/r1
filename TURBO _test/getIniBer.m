function [ber0] =getIniBer(en_output,r )
%en_output为实际发送序列(+1/-1)
%r为接收序列
r1=ones(1,length(en_output));
r_idx=find(r<0);
r1(r_idx)=-r1(r_idx);
%收发序列初始不一致率
ber0=length(find(en_output~=r1))/length(en_output);
end

