clear global oddIdx;
clearvars -except data comp ;
codelength=10000;
global oddIdx; oddIdx=zeros(4,codelength);

ipass=2;
writePassIab(ipass);
data(ipass).iber=data(ipass-1).ober;
alice=data(ipass).ia;
bob=data(ipass).ib;
Ber_ori=data(ipass).iber;
passLeak=0;
%pass1 置换
klen=length(bob);
%pai_idx=randperm(klen);
pai_idx=klen:(-1):1;
alice=alice(:,pai_idx);
bob=bob(:,pai_idx);
%pass1 计算分组长度
blocklen=floor(0.73/Ber_ori);
blocknum=floor(length(alice)/blocklen)+1;
comp=comp+2;%division
%补零便于分组
alice=[alice,zeros(1,blocknum*blocklen-klen)];%补0
bob=[bob,zeros(1,blocknum*blocklen-klen)];

%reshape按列进行，对每行奇偶校验，按行检验有交织作用
alice=reshape(alice,[blocknum,blocklen]);
bob=reshape(bob,[blocknum,blocklen]);

%先整体计算第ipass轮中各组校验和填入oddIdx，初始化该轮的oddIdx
[ne]=oriPassOddIdx1(alice,bob,ipass);
data(ipass).ma=alice;
data(ipass).mb=bob;
idx=[pai_idx,zeros(1,blocknum*blocklen-klen)];
idx=reshape(idx,[blocknum,blocklen]);
data(ipass).shuff=idx;%置换矩阵写入
%对出错分组二分纠错
for ine=1:blocknum
    flag1=0;
    %ine=3;
    %对第ipass轮每个block根据OdddIdx判断校验和 是否需要纠错 block计数：ine
    if oddIdx(ipass,ine)
        %对ipass轮ine纠错,根据oddIdx发现ipass轮的第eBIdx块校验和为1，纠处错误比特的原始位置eIndex
        [eIndex] = getEIndex1(ipass,ine);
        %对于找出的错误比特eIndex(初始序号) 在所有轮次中进行更新，并改变各轮中其所在组的校验和(更新oddIdx)
        renew2(ipass,eIndex);
        while 1
            oddIdx1=oddIdx';
            parityIdx=find(oddIdx1);%将oddIdx视作一列，parityIdx为其中不为零元素位置
            if parityIdx % oddIdx存在不为0元素;（oddIdx全为零，进入下一轮 ipass++）
                if min(parityIdx)<=(codelength*(ipass-1)+ine)%在当前ipass轮ine块之前有校验和为1的块 对其纠错
                    %找出当前ipass轮ine块之前校验和为1的块中blocklen最小，同一轮中块序号最靠前的块fB优先纠错
                    %找到选择的块fB所在轮次与块序号
                    minBlockIdx=min(parityIdx);
                    [fP,fB] =getPassBlock1(minBlockIdx);
                    %对出错的fP轮fB块纠错 得到错误比特初始序号eIndex2
                    [eIndex2] = getEIndex1(fP,fB);
                    %更新当前各轮中eIndex2所在组的parity
                    renew2(ipass,eIndex2);
                else break;
                end
            else flag1=1;break;
            end
        end
    end
   if flag1
       break;
   end
end

%更新当前轮ma,mb
writePassOab(ipass);
data(ipass).ober=(data(ipass-1).ober)/2;
data(ipass).cber=sum(xor(data(ipass).oa,data(ipass).oa))/codelength;


% sum(oddIdx')
% sum(sum(xor(data(1).ma,data(1).mb)))/codelength
% sum(sum(xor(data(2).ma,data(2).mb)))/codelength