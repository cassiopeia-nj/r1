clc;
clear all
dec_alg = 0;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
L_total = 800;
g = [ 1 1 1;1 0 1 ];%code generator
%g = [1 1 0 1; 1 1 1 1];
%g = [1 1 1 1 1; 1 0 0 0 1];
puncture = 0;% punctured / unpunctured (0/1): default 0 ');
niter = 5;%number of iterations for each frame
ferrlim = 8;% Number of frame errors to count as a stop criterior
EbN0db = [0.1];
%%%%%%%%%%%%%%%%%%%%%%
[n,K] = size(g); %n=2,K=3;
m = K - 1;%m=2;
nstates = 2^m;% nstates =4;
% Code rate
rate = 1/(2+puncture);

% Fading amplitude; a=1 in AWGN channel
a = 1;


for nEN = 1:length(EbN0db)
    en = 10^(EbN0db(nEN)/10);      % convert Eb/N0 from unit db to normal numbers(EbN0)
    L_c = 4*a*en*rate; 	% reliability value of the channel a=1，信道衰落
    sigma = 1/sqrt(2*rate*en); 	% standard deviation of AWGN noise
    for times=1:5
    x = round(rand(1, L_total-m));    % info. bits 非二进制
    [temp, alpha] = sort(rand(1,L_total));        % random interleaver mapping随机交织映射
    en_output = encoderm( x, g, alpha, puncture ) ; % encoder output (+1/-1) 长度为frame_size*2
    r = en_output+sigma*randn(1,L_total*(2+puncture)); % received bits
    iniBer(times)=getIniBer2(en_output,r );
    end
    data.EbN0db(nEN)=EbN0db(nEN);
    data.EbN0(nEN)=en;
    data.iBer(nEN)=mean(iniBer);
end
