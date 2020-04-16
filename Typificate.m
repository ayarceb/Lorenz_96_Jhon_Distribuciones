%  Tipificate function



function [newA,p,h,SWstatistic]=Typificate(A,test,nens,ALPHA,i)
M=mean(A);
S=std(A);
n=length(A);
% 
% for i=1:n
% 
% newA(i)=(A(i)-M)/S;
% 
% end

newA=normalize(A);
if test==1
% Test Kosmogorov-Smirnov
[h,p]=kstest(newA);
sprintf('KS test tipificate=%i',kstest(newA));
elseif test==0
% Test Shapiro
[h,p,SWstatistic]=swtest(newA,ALPHA);
sprintf('SW test tipificate=%i',swtest(newA));
end



end