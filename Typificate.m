%  Tipificate function



function [newA,p,h]=Typificate(A,test,nens,ALPHA,i)
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
[h,p]=kstest(newA,ALPHA);
sprintf('KS test tipificate=%i',kstest(newA));
elseif test==0
% Test Shapiro
[h,p]=swtest(newA,ALPHA);
sprintf('SW test tipificate=%i',swtest(newA));
end

% subplot(1,2,1)
% % hist(A)
% % title('Distribution before')
% % subplot(1,2,2)
% hist(newA,nens/2);
% histfit(newA,nens/2,'kernel')
% if h==1
% title({sprintf('p value is %i',p),sprintf('h value is %i, se rechaza',h),sprintf('Time simulation = %i',i)})
% elseif h==0
% title({sprintf('p value is %i',p),sprintf('h value is %i, no se rechaza',h),sprintf('Time simulation = %i',i)})
% end
% subplot(1,2,2)
% qqplot(newA)

end