function [ber1] =getIniBer1(en_output,r )
%en_outputΪʵ�ʷ�������(+1/-1)
%rΪ��������
r1=ones(1,length(en_output));
r_idx=find(r<0);
r1(r_idx)=-r1(r_idx);
%�շ����г�ʼ��һ����
ber1=length(find(en_output~=r1))/length(en_output);
end

