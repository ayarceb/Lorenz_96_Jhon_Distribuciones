clc;clear all;close all

load H_MATRIX_100.mat
load H_MATRIX_100_005.mat
load H_MATRIX_100_06.mat
load H_MATRIX_1000.mat
load H_MATRIX_1000_06.mat
load H_MATRIX_1000_005.mat
load H_MATRIX_10000.mat
load H_MATRIX_10000_06.mat
load H_MATRIX_10000_005.mat



Tsim=500;

ylab='Sum 1 H '   %ylabel

for j=1:Tsim
A(j)=sum(MatrixH_100(:,j));
B(j)=sum(MatrixH_100_06(:,j));
AA(j)=sum(MatrixH_1000(:,j));
BB(j)=sum(MatrixH_1000_06(:,j));
AAA(j)=sum(MatrixH_10000(:,j));
BBB(j)=sum(MatrixH_10000_06(:,j));

C(j)=sum(MatrixH_100_005(:,j));
CC(j)=sum(MatrixH_1000_005(:,j));
CCC(j)=sum(MatrixH_10000_005(:,j));

end

figure 
subplot(3,2,3)
imagesc(MatrixH_100)
xlabel('Timestep')
ylabel('Experiment #')
title('Alpha Value = 0.3')
colormap(parula(2));
colorbar;subplot(3,2,4)
bar(A);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

subplot(3,2,1)
imagesc(MatrixH_100_06)
title('Alpha Value = 0.6')
xlabel('Timestep')
ylabel('Experiment #')
colorbar;subplot(3,2,2)
bar(B);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

subplot(3,2,5)
imagesc(MatrixH_100_005)
title('Alpha Value = 0.6')
xlabel('Timestep')
ylabel('Experiment #')
colorbar;subplot(3,2,6)
bar(C);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

figure


subplot(3,2,3)
imagesc(MatrixH_1000)
xlabel('Timestep')
ylabel('Experiment #')
title('Alpha Value = 0.3')
colorbar;subplot(3,2,4)
bar(AA);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

subplot(3,2,1);
imagesc(MatrixH_1000_06)
title('Alpha Value = 0.6')
xlabel('Timestep')
ylabel('Experiment #');
colorbar;subplot(3,2,2)
bar(BB); xlabel('Timestep')
ylabel(ylab); title('Counts of rejected experiments')


subplot(3,2,5);
imagesc(MatrixH_1000_005)
title('Alpha Value = 0.05')
xlabel('Timestep')
ylabel('Experiment #');
colorbar;subplot(3,2,6)
bar(CC); xlabel('Timestep')
ylabel(ylab); title('Counts of rejected experiments')


figure

 subplot(3,2,3)
imagesc(MatrixH_10000)
xlabel('Timestep')
ylabel('Experiment #')
title('Alpha Value = 0.3')
colorbar;subplot(3,2,4)
bar(AAA);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

subplot(3,2,1)
imagesc(MatrixH_10000_06)
title('Alpha Value = 0.6')
xlabel('Timestep')
ylabel('Experiment #')
colorbar;subplot(3,2,2)
bar(BBB);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')

subplot(3,2,5)
imagesc(MatrixH_10000_005)
title('Alpha Value = 0.05')
xlabel('Timestep')
ylabel('Experiment #')
colorbar;subplot(3,2,6)
bar(CCC);xlabel('Timestep')
ylabel(ylab);title('Counts of rejected experiments')