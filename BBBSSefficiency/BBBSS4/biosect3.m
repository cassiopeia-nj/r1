%����֪��żУ���������е��д�AB���� ����log2(klen������ȡ����log2(klen������ȡ����
function [Alice,Bob,leakage] = b_biosect3(alice,bob)

global comp;
%ne=0;
klen=length(alice);
%��ʼУ��ֵ
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
%���־���
% if p0
%     leakage=0;
% end
% while p0 %p0Ϊ1����żУ���д�
 leakage=0;
 low=1;high=klen;
while 1
	mid=floor((low+high)/2);%����ȡ��
    comp=comp+1;
	pa=mod(sum(alice(low:mid)),2);
    comp=comp+(mid-low);
	pb=mod(sum(bob(low:mid)),2);
    leakage=leakage+1;
%     fprintf('error location0');
% 	if pa==pb&((mid+1==high)||mid==high)
% 	    bob(high)=~bob(high);%����
%         break;   
%     else 
    if pa==pb%ǰ�벿���޴�
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
        bob(low)=~bob(low);%����
        comp=comp+3;
        break;                
	else high=mid;comp=comp+1;	
        end
    end
    end

Alice=alice;
Bob=bob;
end

