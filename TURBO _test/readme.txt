iniBer 
�շ�����Ϊ��һ����Ϊ����iniBer��+1/-1����  ��������Ϊ��������+sigma*����˹01�ֲ�)
��ʼ���в�һ����=�������а�������0.5�������շ����еĲ�һ����
���������EbN0���㲻һ���ʴ������ݣ�
.E0=1-leak/codelength
.comp
.inte=1
.delay 
.p(sus)=error frame/transmit frame

4��decoding:
1:logMap 1/3
2:logMap 1/2
3:sova 1/2
4:sova 1/3

T5 4��decoding��ps[mat�ļ�p01--p04]
T6 4��decoding��delay[mat�ļ�d01--d04]

TVXQ1��2�� frame=400�� framelim=10000;(logmap1/3,1/2)
TVXQ3,4Ϊ��frame=800�� framelim=10000;(sova1/3,1/2)

TV11,TV21��frame=800�� framelim=200;(logmap1/3,1/2)
TV31,TV41��frame=400,    framelim=200;(sova1/2,1/3) 
TV31,TV41��frame=400,    framelim=5000;(sova1/2,1/3) 