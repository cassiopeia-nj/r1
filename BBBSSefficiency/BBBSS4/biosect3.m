%对已知奇偶校验结果的序列的有错AB序列 纠错log2(klen）向上取整或log2(klen）向下取整次
function [Alice,Bob,leakage] = b_biosect3(alice,bob)

global comp;
%ne=0;
klen=length(alice);
%初始校验值
% low=1;high=klen;
% pa0=mod(sum(alice(low:high)),2);
% pb0=mod(sum(bob(low:high)),2);
% p0=xor(pa0,pb0);
% leakage=1;
% % if p0
% % 		fprintf(' start reconciliation by BBBSS\n');
% % 	else    
% % 		fprintf(' no error\n');
% % end
% if ~p0
%     Alice=alice;
%     Bob=bob;
% else
%     ne=1;
% end
%二分纠错
% if p0
%     leakage=0;
% end
% while p0 %p0为1，奇偶校验有错
 leakage=0;
 low=1;high=klen;
while 1
	mid=floor((low+high)/2);%向下取整
    comp=comp+1;
	pa=mod(sum(alice(low:mid)),2);
    comp=comp+(mid-low);
	pb=mod(sum(bob(low:mid)),2);
    leakage=leakage+1;
%     fprintf('error location0');
% 	if pa==pb&((mid+1==high)||mid==high)
% 	    bob(high)=~bob(high);%纠错
%         break;   
%     else 
    if pa==pb%前半部分无错
	    low=mid+1; 
        comp=comp+2;
        if low==high;
            bob(low)=~bob(low);
            comp=comp+3;
        break;
        end
%     else if pa~=pb&(((mid-1==low)||mid==low))
 else if pa~=pb&(low==mid)
 	    %fprintf('error location=3');
        bob(low)=~bob(low);%纠错
        comp=comp+3;
        break;                
	else high=mid;comp=comp+1;	
        end
    end
    end

Alice=alice;
Bob=bob;
end

