clear all;close all;clc

NumeroExperimentos=1000


for j=1:NumeroExperimentos
fprintf('NumeroExperimento=%i \n',j)

ALPHA=0.3; % Nivel de significancia entre más alto más probabilidad de rechazar, el test es más exigente
N=100;
F=8;
Tsim=500;
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
for i=1:Tsim
[newA,p,h]=Typificate(xb(:,i,1),test,N,ALPHA,i);
MatrixH(j,i)=h;
%pause(4)
end
%% QQ Plot and distribution fit


end

for j=1:Tsim
A(j)=sum(MatrixH(:,j))
end
 subplot(1,2,1)
imagesc(MatrixH)
colorbar
subplot(1,2,2)
bar(A)

