%���ݵ�ǰ����������ii�ͳ���λ��loc1 �����ʼ������
function [mark0] =renewkey(loc1,blocknum1,ii,index1)
     mark=(loc1-1)*blocknum1+ii;
     [tf,mark0]=ismember(mark,index1);
end

