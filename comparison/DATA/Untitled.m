for i=1:4
    if i==1
        dec_alg =0;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
        puncture = 1;
    else if i==2   
        dec_alg =0;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
        puncture = 0;
        else  if i==3
             dec_alg =1;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
             puncture = 0;
            else dec_alg =1;%  decoding algorithm. (0:Log-MAP, 1:SOVA)  default 0 ')
        puncture =1;
            end
        end
    end
        
    k=dec_alg +puncture ;
    filename=strcat('T',num2str(i));
     save (filename,'k');
end

    

