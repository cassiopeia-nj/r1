function [E0,comp,inte,delay,ipass] = Cascade0(codelength,berIni,maxPass)
tic;
%comp：计算复杂度 inte：AliceBob间交互次数
clear global lea; clear global comp; clear inte;
clear global data;clear global oddIdx;
global lea; global comp;global inte;global data;global oddIdx;
lea=0;comp=0;inte=0;
%codelength=10000;%初始码长
%maxPass=5;
oddIdx=zeros(maxPass,codelength);
%berIni=0.5/100;
[ alice0,bob0] = gen_key(codelength,berIni);
%pass1 初始化
ipass=1;
data(ipass).ia=alice0;
data(ipass).ib=bob0;
data(ipass).iber=berIni;
cascade1(ipass);

while 1
 ipass=ipass+1;
 cascade3(ipass);
 if ~data(ipass).cber|ipass>maxPass
     break;
 end
end

E0=1-lea/codelength;
delay=toc;
end

