clc;clear;
% snr=0.5;
% alice=[1,-1,1,-1];
% len=length(alice);
% alice0=0.5.*alice+0.5*ones(1,len);
% modbit1 = pskmod(alice0,2); %相移键控调制
%  modbit2= awgn(modbit1,snr,'measured');%bob端收到信号
%  bob0=pskdemod(modbit2,2);
%  bob=2.*(bob0-0.5*ones(1,len));
%  ori_error=(alice0~=bob0);
%  Ber_ori=sum(ori_error)/length(alice0);
% 
% trellis=poly2trellis([5,4],[23,35,0;0,05,13])
%poly2trellis(4,[13 15 17],13)
clc;clear;
% 
% orilen=10;
% alice0=randi([0,1],1,orilen);
% index=randperm(orilen);
dec_alg = 0;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
L_total = 800;	 % infomation bits plus tail bits(Frame size)
g = [ 1 1 1;1 0 1 ];%code generator
%g = [1 1 0 1; 1 1 1 1];
%g = [1 1 1 1 1; 1 0 0 0 1];
puncture = 0;% punctured / unpunctured (0/1): default 0 ');
niter =8; %number of iterations for each frame
ferrlim = 1;% Number of frame errors to count as a stop criterior
EB0=0.01:0.01:0.1;
EB1=0.2:0.2:2;
EB2=3:1:16;
EbN0db =[EB0,EB1,EB2];

%%%%%%%%%%%%%%%%%%%%%%
[n,K] = size(g); %n=2,K=3;
m = K - 1;%m=2;
nstates = 2^m;% nstates =4;
% Code rate
rate = 1/(2+puncture);   
% Fading amplitude; a=1 in AWGN channel
a = 1;
%%%%%%%%%%%%%%
for nEN = 1:length(EbN0db)
en = EbN0db(nEN);%EbN0单位是W
for itimes=1:50
L_c = 4*a*en*rate; 	% reliability value of the channel a=1，信道衰落
sigma = 1/sqrt(2*rate*en); 	% standard deviation of AWGN noise
x = round(rand(1, L_total-m));    % info. bits 非二进制(0/1)
[temp, alpha] = sort(rand(1,L_total));        % random interleaver mapping随机交织映射
en_output = encoderm( x, g, alpha, puncture ) ; % encoder output (+1/-1) 长度为frame_size*2 发送比特
r = en_output+sigma*randn(1,L_total*(2+puncture)); % received bits
[ber0] =getIniBer(en_output,r );
Ber0(itimes)=ber0;
end
data(nEN).EBN0=en;
data(nEN).ber=mean(Ber0);
end

