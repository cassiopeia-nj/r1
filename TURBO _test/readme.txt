iniBer 
收发序列为不一致率为给定iniBer的+1/-1序列  接收序列为发送序列+sigma*（高斯01分布)
初始序列不一致率=接受序列按单门限0.5量化后，收发序列的不一致率
根据输入的EbN0计算不一致率存入数据，
.E0=1-leak/codelength
.comp
.inte=1
.delay 
.p(sus)=error frame/transmit frame

4种decoding:
1:logMap 1/3
2:logMap 1/2
3:sova 1/2
4:sova 1/3

T5 4种decoding—ps[mat文件p01--p04]
T6 4种decoding—delay[mat文件d01--d04]

TVXQ1，2： frame=400， framelim=10000;(logmap1/3,1/2)
TVXQ3,4为：frame=800， framelim=10000;(sova1/3,1/2)

TV11,TV21：frame=800， framelim=200;(logmap1/3,1/2)
TV31,TV41：frame=400,    framelim=200;(sova1/2,1/3) 
TV31,TV41：frame=400,    framelim=5000;(sova1/2,1/3) 