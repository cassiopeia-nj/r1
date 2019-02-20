%每次分组nb(i)=2*nb(i-1);
%DATA中 effE0=1-泄露比特/生成码长 
% effDelay运行时间
%effComp计算复杂度
%effInte交互次数
clc;clear all;
codelength=800;%初始码长


% initialBer=1:8;
% initialBer=initialBer./100;

%%initialBer与Turbo误码对应
load('iniBerEBN0dbIndex.mat');
% initialBer0=cat(1,data.cber)'; clear data;
% initialBer=initialBer0(1:4);
initialBer=cat(1,data.cber)'; clear data;

for iBer=1:length(initialBer)
berIni=initialBer(iBer);
%每一个初始ber 做itimes次仿真
for itimes=1:1000
 %计算Tdelay
    tic;

clear global data;
clear global comp;
clear global inte;
clear global lea;
global data;
global comp;
global inte;
global lea;
comp=0;inte=0;lea=0;
[ alice0,bob0] = gen_key(codelength,berIni);
%pass1 初始化
ipass=1;
data(ipass).ia=alice0;
data(ipass).ib=bob0;
data(ipass).iber=berIni;
BBBSS1(ipass);
while 1
ipass=ipass+1;
data(ipass).ia=data(ipass-1).oa;
data(ipass).ib=data(ipass-1).ob;
data(ipass).iber=data(ipass-1).ober;
BBBSS1(ipass);
if data(ipass).NE==0
    break
end
end
delay=toc;
%S为一次仿真中效率E0；
[S,finalpass]=getEfficiency2();
genInte;
s(itimes)=S;
Delay1(itimes)=delay;
Comp(itimes)=comp;
Inte(itimes)=inte;
Finalpass(itimes)=finalpass;
end
%每一个初始ber对应efficiency
eS=mean(s);eD1=mean(Delay1);eC=mean(Comp);eI=mean(Inte);eP=mean(Finalpass);
%eU=mean(u);eL=mean(l);

DATA(iBer).ber=berIni;
%DATA(iBer).effLower=eL;
DATA(iBer).effE0=eS;
DATA(iBer).effDelay=eD1;
DATA(iBer).effComp=eC;
DATA(iBer).effInte=eI;
DATA(iBer).effFinPass=eP;
%DATA(iBer).effUpper=eU;
end
