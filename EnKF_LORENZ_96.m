clear all
close all
clc

Tsim=500;
dt=0.01; %step length
m=40;
n=40;
F=8;
sigma=40e-1;
R=sigma^2*eye(m);
H = eye(n,n); 
H = H(randperm(n,m),:);
<<<<<<< HEAD
=======
N=60;               % Number of ensembles
sparse=0.1 % Sparse of the initial ensemble
% imagesc(H)    %plot measurenment states to know which states are being observed
% xlabel('State number');
% ylabel('Observation');

>>>>>>> 4ab574727032dbbf402c1e35e4e26730908fa79d
%===Generate real state===
x0=1*rand(n,1);
[Xreal]=Lorenz_96(Tsim,dt,x0,F);


%==================================================================
% Enemble forward propagation


x00=-sparse/2+sparse*rand(n,N); %The ensemble is generated by the initial condition
xb(:,1,:)=x00;


for i=2:Tsim
    for Nen=1:N %Propagation in time of all the ensemble members to generate background
        [xb(:,i,Nen),t]=Lorenz_96_one_step(1,dt,squeeze(xb(:,i-1,Nen)),F);  
    end
    i
end



%==Number of Ensembles==
N=100;
Xb=zeros(n,N,Tsim);
Xb(:,:,1)=10*rand(n,N);
Xa=Xb;
meanxb=zeros(40,500);

%=====Scenario EnKF===
%==Observations===
<<<<<<< HEAD
Y=H*Xreal;
=======
Y=H*Xreal;     %  Sampling observation with the observation operator


>>>>>>> 4ab574727032dbbf402c1e35e4e26730908fa79d
for i=1:Tsim-1
    %===== Forecast Step=====
    for en=1:N
        [Xb(:,en,i+1)]=Lorenz_96_one_step(1,dt,squeeze(Xa(:,en,i)),F);
     end 
    meanxb(:,i)=mean(Xb(:,:,i),2);
    L=Xb(:,:,i)-meanxb(:,i);
    P0=((1/N-1)*(L*L'));
    B=P0; 
   % ===== Analysis Step=====
    K=B*H'*pinv(H*B*H'+R);
    for en=1:N
        Xa(:,en,i+1)=Xb(:,en,i+1)+K*(Y(:,i+1)+sigma*randn(m,1)-H*Xb(:,en,i+1));
    end
    meanxa_EnKF(:,i+1)=mean(Xa(:,:,i+1),2);
%     imagesc(pinv(H*B*H'+R))
%     colorbar
%     title(sprintf('%i',i))
%   pause(0.1)
end

error_EnKF=norm(abs(sum(meanxa_EnKF(:,:)-Xreal(:,:))))
%% just to plot the simulation ensemble and the mean
for i=1:N
plot(squeeze(Xb(1,i,:)))
    hold on
end
plot(meanxb(1,:),'k','LineWidth',3)
figure


figure
 imagesc(Xreal),title('Truth State')
 figure
 imagesc(meanxa_EnKF),title('Analysis State EnKF')
figure
subplot(1,4,1)
plot(Xreal(10,:),'r','LineWidth',2)
hold on
plot(meanxa_EnKF(10,:),'b','LineWidth',2)
legend({'X truth','Xa'})
title('State 10')
subplot(1,4,2)
plot(Xreal(20,:),'r','LineWidth',2)
hold on
plot(meanxa_EnKF(20,:),'b','LineWidth',2)
title('State 20')
subplot(1,4,3)
plot(Xreal(30,:),'r','LineWidth',2)
hold on
plot(meanxa_EnKF(30,:),'b','LineWidth',2)
title('State 30')
subplot(1,4,4)
plot(Xreal(40,:),'r','LineWidth',2)
hold on
plot(meanxa_EnKF(40,:),'b','LineWidth',2)
title('State 40')