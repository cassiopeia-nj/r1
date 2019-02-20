clc;clear all;
clear global lea; clear global comp; clear inte;
clear global data;clear global oddIdx;
maxPass=8;codelength=800;

%initialBer=0.1:0.1:0.8;
%initialBer=initialBer./100;

%∂‘”¶Turbo¬ÎŒÛ¬Î¬ 
load('iniBerEBN0dbIndex.mat');
initialBer=cat(1,data.cber)'; clear data;
initialBer=initialBer(1:7);

for iBer=1:length(initialBer)
berIni=initialBer(iBer);
for itimes=1:1000
[e0,comp,inte,delay,finalpass] = Cascade0(codelength,berIni,maxPass);
E0(itimes)=e0;
Comp(itimes)=comp;
Inte(itimes)=inte;
Delay(itimes)=delay;
FP(itimes)=finalpass;
end

DATA(iBer).ber=berIni;
DATA(iBer).effE0=mean(E0);
DATA(iBer).effDelay=mean(Delay);
DATA(iBer).effComp=mean(comp);
DATA(iBer).effInte=mean(inte);
DATA(iBer).effFinPass=mean(FP);
end

