% Ensayo con el Lorenz 96 para el análisis de distribuciones


function output=EnKF_LORENZ_96(params,domain)
N=params(1);
F=params(2);
Tsim=domain(2);
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

output=struct()
output.x=0:Tsim-1;
output.y=squeeze(xb(1,:,:))'

end


%% Test de normalidad test de hipotesis
Typificate
test=0;      % Shapiro-Wilk--> 0    Kolmogorov-Smirnov --> 1

