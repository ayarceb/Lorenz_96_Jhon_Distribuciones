clear all;close all;clc

NumeroExperimentos=1



nens=500;
ALPHA=0.1; % Nivel de significancia entre más alto más probabilidad de rechazar, el test es más exigente
N=100;
F=8;
Tsim=300;
dt=0.01; %step length
m=40;
n=100;
sigma=40e-1;
% R=sigma^2*eye(m);
% H = eye(n,n); 
% H = H(randperm(n,m),:);
% sparse=1 % Sparse of the initial ensemble
%===Generate real state===
x0=1*randn(n,N);
xb=zeros(n,Tsim,N);
xb(:,1,:)=x0;

for i=2:Tsim
    for Nen=1:N %Propagation in time of all the ensemble members to generate background
        [xb(:,i,Nen),t]=Lorenz_96_one_step(1,dt,squeeze(xb(:,i-1,Nen)),F); 
        
    end
end

plot(squeeze(xb(1,:,:)))

%% Test de normalidad Shapiro Wilk, Kosmogorov Smirnov
test=0;      % Shapiro-Wilk--> 0    Kolmogorov-Smirnov --> 1
cont=1
 for i=1:40:Tsim
[newA,p,h,SWstatistic]=Typificate(xb(:,i,1),test,N,ALPHA,i)


%% QQ Plot and distribution fit

 subplot(3,4,cont)
% hist(A)
% title('Distribution before')
 subplot(3,4,cont)
hist(newA,nens/50);
histfit(newA,nens/50,'kernel')
normalitytest(xb(:,i,1)')
 if h==1
 title({sprintf('p value is %i',p),sprintf('h value is %i, rejected',h),sprintf('Time simulation = %i',i),sprintf(' SWstatistics %i',SWstatistic)})
 elseif h==0
 title({sprintf('p value is %i',p),sprintf('h value is %i, no rejected',h),sprintf('Time simulation = %i',i),sprintf(' SWstatistics %i',SWstatistic)})
 end
 subplot(3,4,cont+1)

qqplot(newA)
% 
 cont=cont+2;
pause(4)
 end
