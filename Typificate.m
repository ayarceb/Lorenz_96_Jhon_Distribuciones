%  Tipificate function



function [newA,p,h]=Typificate(A,test,nens)

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

% subplot(1,2,1)
% hist(A)
% title('Distribution before')
% subplot(1,2,2)
hist(newA,nens/2);


if test==1
% Test Kosmogorov-Smirnov

[h,p]=kstest(newA);
sprintf('KS test tipificate=%i',kstest(newA));

elseif test==0
% Test Shapiro

[h,p]=swtest(newA);
sprintf('SW test tipificate=%i',swtest(newA));
end



end