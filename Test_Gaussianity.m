% Code to calculate and plot results from the kstest (Kolmogorov-Smirnov)
% and swtest (Sheppiro wills) for an ensemble of 50-100-130-150

clc;clear all;close all

%% ===============  Some general info for the plots  ======================
x0=3000;y0=600;             % size and position of the graphic to generates
width=2000;height=1000;      
Fx=15;                     % Fontsize Xlabel Ylabel
Ft=20;                     % Fontsize title
k=11;                      % Ensemble color grey for ensemble members

tsim=72;  % Simulation time
diffu=12;  % parameter to diffuminate the ensemble members in the plot
nens=50;   % number of ensembles
test=0;      % Shapiro-Wilk--> 0    Kolmogorov-Smirnov --> 1

%state=1
lat=linspace(5.83,6.82,12);
lon=linspace(-76.15,-75.16,12);

load EnseMem_column_50_2.mat     % Load the 50 ensembles from different configuration seems
Ens50_2=EnseMem_column(:,:,1:50);
load EnseMem_column_50.mat     % Load the 50 ensembles
Ens50=EnseMem_column(:,:,1:50);
load EnseMem_column_100.mat     % Load the 100 ensembles
Ens100=EnseMem_column(:,:,1:100);
load EnseMem_column_130.mat     % Load the 130 ensembles
Ens130=EnseMem_column(:,:,1:130);
load EnseMem_column_150.mat     % Load the 150 ensembles
Ens150=EnseMem_column(:,:,1:150);
load EnseMem_column_200.mat     % Load the 200 ensembles
Ens200=EnseMem_column(:,:,1:200);
 
Ensemble=EnseMem_column(:,:,1:nens);


%% Ensemble of 50 members

figure
hold on
set(gcf,'color','w');
set(gcf,'position',[x0,y0,width,height]);
set(gcf,'defaultTextInterpreter','latex');

h_state=zeros(72,121);
for state=1:121
for i=1:72
subplot(8,9,i)
   [newA,p,h]=Typificate(squeeze(Ens50(state,i,:)),test,nens);
   h_state(i,state)=h;
   if h==0
   %title({sprintf('p-value =%i',p),sprintf('KS test  = %i Time =%i',h,i)})
   title(sprintf('KS test  = %i Time =%i',h,i));
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0 0.5 0.5];
    %g.EdgeColor = 'w';
   else
    title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0.9 0.8 0.1];
   end
end
state
end
if test==1
suptitle('50 Ensembles Kosmogorov-Smirnov test')
elseif test==0
suptitle('50 Ensembles Shapiro-Wilk test')
end

h=figure
axis tight manual         % this ensures that getframe() returns a consistent size
filename = '50_Members.gif';
for i=1:72
sb1=subplot(1,1,1)
A=reshape(h_state(i,:),11,11);
imagesc(A);
drawnow;
set(sb1,'CLim',[2e-10 1.8e-09],'Layer','top','XTickLabel',...
    {'-76.06','-75.88','-75.7','-75.52','-75.34'},'YTickLabel',...
    {'6.82','6.73','6.64','6.55','6.46','6.37','6.28','6.19','6.1','6.01','5.92'});
xlabel('longitude (°)');
ylabel('latitude (°)');
title({sprintf('Time (hours)= %i',i),'50 ensemble'});
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
pause(1)
end


%% Ensemble 100 members

figure
hold on
set(gcf,'color','w');
set(gcf,'position',[x0,y0,width,height]);
set(gcf,'defaultTextInterpreter','latex');
nens=100;   % number of ensembles
h_state=zeros(72,121);
for state=1:121
for i=1:72
subplot(8,9,i)
   [newA,p,h]=Typificate(squeeze(Ens100(state,i,:)),test,nens);
   h_state(i,state)=h;
   if h==0
   title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0 0.5 0.5];
    %g.EdgeColor = 'w';
   else
    title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0.9 0.8 0.1];
   end
end
state
end

if test==1
suptitle('100 Ensembles Kosmogorov-Smirnov test')
elseif test==0
suptitle('100 Ensembles Shapiro-Wilk test')
end

h=figure
axis tight manual         % this ensures that getframe() returns a consistent size
filename = '100_Members.gif';
for i=1:72
sb1=subplot(1,1,1)
A=reshape(h_state(i,:),11,11);
imagesc(A)
drawnow
set(sb1,'CLim',[2e-10 1.8e-09],'Layer','top','XTickLabel',...
    {'-76.06','-75.88','-75.7','-75.52','-75.34'},'YTickLabel',...
    {'6.82','6.73','6.64','6.55','6.46','6.37','6.28','6.19','6.1','6.01','5.92'});
xlabel('longitude (°)');
ylabel('latitude (°)');
title({sprintf('Time (hours)= %i',i),'100 ensemble'});
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
pause(1)
end

%% Ensemble 130 members


figure
hold on
set(gcf,'color','w');
set(gcf,'position',[x0,y0,width,height]);
set(gcf,'defaultTextInterpreter','latex');
nens=130;   % number of ensembles
h_state=zeros(72,121);
for state=1:121
for i=1:72
subplot(8,9,i)
   [newA,p,h]=Typificate(squeeze(Ens130(state,i,:)),test,nens);
   h_state(i,state)=h;
   if h==0
   title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0 0.5 0.5];
    %g.EdgeColor = 'w';
   else
    title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0.9 0.8 0.1];
   end
end
state
end

if test==1
suptitle('130 Ensembles Kosmogorov-Smirnov test')
elseif test==0
suptitle('130 Ensembles Shapiro-Wilk test')
end

h=figure
axis tight manual         % this ensures that getframe() returns a consistent size
filename = '130_Members.gif';
for i=1:72
sb1=subplot(1,1,1)
A=reshape(h_state(i,:),11,11);
imagesc(A)
drawnow
set(sb1,'CLim',[2e-10 1.8e-09],'Layer','top','XTickLabel',...
    {'-76.06','-75.88','-75.7','-75.52','-75.34'},'YTickLabel',...
    {'6.82','6.73','6.64','6.55','6.46','6.37','6.28','6.19','6.1','6.01','5.92'});
xlabel('longitude (°)');
ylabel('latitude (°)');
title({sprintf('Time (hours)= %i',i),'130 ensemble'});
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
pause(1)
end

%% Ensemble 150

figure
hold on
set(gcf,'color','w');
set(gcf,'position',[x0,y0,width,height]);
set(gcf,'defaultTextInterpreter','latex');
nens=150;   % number of ensembles
h_state=zeros(72,121);

for state=1:121
for i=1:72
subplot(8,9,i)
   [newA,p,h]=Typificate(squeeze(Ens150(state,i,:)),test,nens);
   h_state(i,state)=h;
   if h==0
   title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0 0.5 0.5];
    %g.EdgeColor = 'w';
   else
    title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0.9 0.8 0.1];
   end
end
state
end

if test==1
suptitle('150 Ensembles Kosmogorov-Smirnov test')
elseif test==0
suptitle('150 Ensembles Shapiro-Wilk test')
end


h=figure
axis tight manual         % this ensures that getframe() returns a consistent size
filename = '150_Members.gif';
for i=1:72
sb1=subplot(1,1,1)
A=reshape(h_state(i,:),11,11);
imagesc(A)
drawnow
set(sb1,'CLim',[2e-10 1.8e-09],'Layer','top','XTickLabel',...
    {'-76.06','-75.88','-75.7','-75.52','-75.34'},'YTickLabel',...
    {'6.82','6.73','6.64','6.55','6.46','6.37','6.28','6.19','6.1','6.01','5.92'});
xlabel('longitude (°)');
ylabel('latitude (°)');
title({sprintf('Time (hours)= %i',i),'150 ensemble'});
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
pause(1)
end
%% Ensemble 200


figure
hold on
set(gcf,'color','w');
set(gcf,'position',[x0,y0,width,height]);
set(gcf,'defaultTextInterpreter','latex');
nens=200;   % number of ensembles
h_state=zeros(72,121);

for state=1:121
for i=1:72
subplot(8,9,i)
   [newA,p,h]=Typificate(squeeze(Ens200(state,i,:)),test,nens);
    h_state(i,state)=h;
   if h==0
   title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0 0.5 0.5];
    %g.EdgeColor = 'w';
   else
    title(sprintf('KS test  = %i Time =%i',h,i))
    g = findobj(gca,'Type','patch');
    g.FaceColor = [0.9 0.8 0.1];
   end
end
state
end

if test==1
suptitle('200 Ensembles Kolmogorov-Smirnov test')
elseif test==0
suptitle('200 Ensembles Shapiro-Wilk test')
end

h=figure
axis tight manual         % this ensures that getframe() returns a consistent size
filename = '200_Members.gif';
for i=1:72
sb1=subplot(1,1,1)
A=reshape(h_state(i,:),11,11);
imagesc(A)
drawnow
set(sb1,'CLim',[2e-10 1.8e-09],'Layer','top','XTickLabel',...
    {'-76.06','-75.88','-75.7','-75.52','-75.34'},'YTickLabel',...
    {'6.82','6.73','6.64','6.55','6.46','6.37','6.28','6.19','6.1','6.01','5.92'});
xlabel('longitude (°)');
ylabel('latitude (°)');
title({sprintf('Time (hours)= %i',i),'200 ensemble'});
frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
pause(1)
end





%% Gráficas para los ensambles difuminados

% figure 
% tsim=72;
% diffu=12;
% for i=1:nens
%  EEE=plot(squeeze(Ensemble(20,:,i)),'linewidth',1,'Color',[0 0 0]+0.05*diffu);xlim([0,tsim])
% hold on
% end
% mean=plot(mean(squeeze(Ensemble(20,:,:))'));
% h=legend([mean EEE ],'Ensemble mean meanxb','Ensemble member');
% 
% xlabel('Time [days]','FontSize',Fx,'interpreter','latex');ylabel('Concentration [mlc/cm$^2$]*1e15','FontSize',Fx,'interpreter','latex')
% title('NO$_2$ Column 200 member ensemble','FontSize',Ft,'interpreter','latex')
% grid on;
% line([12 12], [0 3500]);


%%



 figure
 subplot(1,2,1);plot(squeeze(A(20,:,:)))
grid on;subplot(1,3,2);plot(squeeze(B(20,:,:)))
 grid on;subplot(1,2,2);plot(squeeze(D(20,:,:)));grid on




figure

for i=1:nens

    EEE=plot(squeeze(Ens200(state,:,i)),'linewidth',1,'Color',[0 0 0]+0.05*diffu);xlim([0,tsim])
hold on
end
grid on;
ylim([0 3500])
title(sprintf('%i ensembles',nens))
mean=plot(mean(squeeze(Ens200(state,:,1:end-1))'),'Color','k')
h=legend([mean EEE ],'Ensemble mean meanxb','Ensemble member');
 xlabel('Time [days]','FontSize',Fx,'interpreter','latex');ylabel('Concentration [mlc/cm$^2$]*1e15','FontSize',Fx,'interpreter','latex')
 title(sprintf('NO$_2$ Column ensemble, state = %i',state),'FontSize',Ft,'interpreter','latex')
 
for i=1:nens
    subplot(1,2,2)
 FFF=plot(squeeze(D(20,:,i)),'linewidth',1,'Color',[0 0 0]+0.05*diffu);xlim([0,tsim])
hold on
end
mean2=plot(mean(squeeze(D(20,:,:))'))
h=legend([mean2 FFF ],'Ensemble mean meanxb','Ensemble member');
grid on;
title('100 ensembles')
mean=plot(mean(squeeze(C(20,:,:))'))
h=legend([mean EEE ],'Ensemble mean meanxb','Ensemble member');

