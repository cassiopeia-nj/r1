clc;
clear all
filename0='D:\MIKU\VTC2019\VTC2019mat\comparison\090123\';
%decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
%punctured / unpunctured (0/1): default 0 ');
tic
for dec_alg=0:1
    for puncture=0:1
        filename=strcat('TURBO',num2str(dec_alg),num2str(puncture));
        [DATA]= Turbo0(dec_alg,puncture);
        save([filename0, filename], 'DATA');
        clear DATA;
    end
end

addpath D:\MIKU\VTC2019\VTC2019mat\CascadeEfficiency
run C1;
save(['D:\MIKU\VTC2019\VTC2019mat\comparison\090123\', 'CA'], 'DATA')
clear DATA;

addpath D:\MIKU\VTC2019\VTC2019mat\BBBSSefficiency\BBBSS4
run B1;
save(['D:\MIKU\VTC2019\VTC2019mat\comparison\090123\', 'BS'], 'DATA')
toc



