function [ber2] =getIniBer2(en_output,r )
%en_outputΪʵ�ʷ�������(+1/-1)
%rΪ��������
r1=ones(1,length(en_output));
r_idx=find(r<0);
r1(r_idx)=-r1(r_idx);
%�շ����г�ʼ��һ����
%ber0=length(find(en_output~=r1))/length(en_output);

k1=en_output(1:length(en_output)/2);
k2=r1(1:length(en_output)/2);
ber2=length(find(k1~=k2))/(length(en_output)/2);
end


