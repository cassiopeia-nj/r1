clc;
clear all

% Write display messages to a text file
diary turbo_logmap.txt
dec_alg = 0;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
L_total = 800;	 % infomation bits plus tail bits(Frame size)
g = [ 1 1 1;1 0 1 ];%code generator
%g = [1 1 0 1; 1 1 1 1];
%g = [1 1 1 1 1; 1 0 0 0 1];
puncture = 0;% punctured / unpunctured (0/1): default 0 ');
niter = 5;%number of iterations for each frame
ferrlim = 1;% Number of frame errors to count as a stop criterior
EbN0db = [0.5];
%%%%%%%%%%%%%%%%%%%%%%
[n,K] = size(g); %n=2,K=3;
m = K - 1;%m=2;
nstates = 2^m;% nstates =4;
% Code rate
rate = 1/(2+puncture);   

% Fading amplitude; a=1 in AWGN channel
a = 1;

for nEN = 1:length(EbN0db)
%    en = 10^(EbN0db(nEN)/10);      % convert Eb/N0 from unit db to normal numbers db��w
    en = EbN0db(nEN);%EbN0��λ��W
    L_c = 4*a*en*rate; 	% reliability value of the channel a=1���ŵ�˥��
   sigma = 1/sqrt(2*rate*en); 	% standard deviation of AWGN noise

% Clear bit error counter and frame error counter
   errs(nEN,1:niter) = zeros(1,niter);
   nferr(nEN,1:niter) = zeros(1,niter);

   nframe = 0;    % clear counter of transmitted frames
   while nferr(nEN, niter)<ferrlim %ÿ�ֵ��������֡���ۼ�С��15֡
      nframe = nframe + 1;    
      x = round(rand(1, L_total-m));    % info. bits �Ƕ�����
      [temp, alpha] = sort(rand(1,L_total));        % random interleaver mapping�����֯ӳ��
      en_output = encoderm( x, g, alpha, puncture ) ; % encoder output (+1/-1) ����Ϊframe_size*2
          
      r = en_output+sigma*randn(1,L_total*(2+puncture)); % received bits
      yk = demultiplex(r,alpha,puncture); % demultiplex to get input for decoder 1 and 2
      
% Scale the received bits      
      rec_s = 0.5*L_c*yk;

% Initialize extrinsic information ��ʼ������Ϣ     
      L_e(1:L_total) = zeros(1,L_total);
      
      for iter = 1:niter
% Decoder one
         L_a(alpha) = L_e;  % a priori info. 
         if dec_alg == 0
            L_all = logmapo(rec_s(1,:), g, L_a, 1);  % complete info.
         else   
            L_all = sova0(rec_s(1,:), g, L_a, 1);  % complete info.
         end   
         L_e = L_all - 2*rec_s(1,1:2:2*L_total) - L_a;  % extrinsic info.

% Decoder two         
         L_a = L_e(alpha);  % a priori info.
         if dec_alg == 0
            L_all = logmapo(rec_s(2,:), g, L_a, 2);  % complete info.  
         else
            L_all = sova0(rec_s(2,:), g, L_a, 2);  % complete info. 
         end
         L_e = L_all - 2*rec_s(2,1:2:2*L_total) - L_a;  % extrinsic info.
         
% Estimate the info. bits        
         xhat(alpha) = (sign(L_all)+1)/2;

% Number of bit errors in current iteration
         err(iter) = length(find(xhat(1:L_total-m)~=x));
% Count frame errors for the current iteration
         if err(iter)>0
            nferr(nEN,iter) = nferr(nEN,iter)+1;
         end   
      end	%iter
      
% Total number of bit errors for all iterations
      errs(nEN,1:niter) = errs(nEN,1:niter) + err(1:niter);

      if rem(nframe,3)==0 | nferr(nEN, niter)==ferrlim
% Bit error rate
         ber(nEN,1:niter) = errs(nEN,1:niter)/nframe/(L_total-m);
% Frame error rate
         fer(nEN,1:niter) = nferr(nEN,1:niter)/nframe;

% Display intermediate results in process  
         fprintf('************** Eb/N0 = %5.2f db **************\n', EbN0db(nEN));
         fprintf('Frame size = %d, rate 1/%d. \n', L_total, 2+puncture);
         fprintf('%d frames transmitted, %d frames in error.\n', nframe, nferr(nEN, niter));
         fprintf('Bit Error Rate (from iteration 1 to iteration %d):\n', niter);
         for i=1:niter
            fprintf('%8.4e    ', ber(nEN,i));
         end
         fprintf('\n');
         fprintf('Frame Error Rate (from iteration 1 to iteration %d):\n', niter);
         for i=1:niter
            fprintf('%8.4e    ', fer(nEN,i));
         end
         fprintf('\n');
         fprintf('***********************************************\n\n');

% Save intermediate results 
         save turbo_sys_demo EbN0db ber fer
      end   %iter
      
   end		%while
end 		%nEN2
diary off