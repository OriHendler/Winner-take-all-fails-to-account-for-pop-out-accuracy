%This code is used to plot the data coming out of data_analysis.m


clear all
close all
%Grphics
GrphicSettings
%So what are we doing today?
P_cVSN_plot=0;
heatmap_plot=0;
P_cVSP_c_exp_plot=1;
%%
% Specify the folder where the files live.
myFolder = 'C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 2G\data_analysis';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder,'*.mat'); % Change to whatever pattern you need.
theFiles = dir(filePattern);

if heatmap_plot
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
load(fullFileName);
X=flip(reshape(mean_correct_readout_saver_all_realizations_matrix(:,1),5,5))
% X=flip(reshape(mean_correct_readout_saver_all_realizations_matrix(:,1),5,5)')

    %%
figure(1)
s=heatmap([3 8 15 24 35],[500 100 50 20 10],X,'CellLabelColor','none','Colormap',parula);
s.FontSize = 16
s.FontName = 'Helvetica'
% s.FontWeight = 'bold'
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

annotation('textarrow',[0.96,0.96],[0.5,0.5],'string','Readout Accuracy','HeadStyle','none','LineStyle','none','HorizontalAlignment','center','TextRotation',90, 'fontweight', 'bold');
hAx=s.NodeChildren(3);          % return the heatmap underlying axes handle
hAx.FontWeight='bold';
hCB=s.NodeChildren(2);          % the wanted colorbar handle
hCB.FontWeight='bold';
s.GridVisible = 'off'
% title('100 Neurons per Population (N)','FontSize',15.4,'Fontname','Helvetica','FontWeight', 'bold')
title('Readout for Medium Contexual Modulation Strength (q)')
xlabel('Number of Distractors (M)')
ylabel('Number of Neurons per Population (N)')


s.ColorLimits=[0,1]
% box off
% legend('boxoff')
% legend('Location','best')
% set(gca,'TickDir','out'); % The only other option is 'in'
% pbaspect([1 1 1])

x0=10;
y0=10;
width=700;
height=700;
set(gcf,'position',[x0,y0,width,height])


saveas(figure(1),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.jpg'],'jpg');
saveas(figure(1),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.fig'],'fig');
saveas(figure(1),['MchangingNchangingMeann13var4mu_for_expTwelveOverTenManyRealizations50','.tif'],'tif');
% saveas(h,['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix_plots\',baseFileName,'.jpg'],'jpg')
end

end



if P_cVSN_plot
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
load(fullFileName);
    %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%

figure(41)
for realization=1:length(correct_readout_saver_all_realizations_matrix(1,1,:))
plot(correct_readout_saver_all_realizations_matrix(:,2,realization),correct_readout_saver_all_realizations_matrix(:,1,realization),'k',LineWidth=0.5)
hold on
end
plot(mean_correct_readout_saver_all_realizations_matrix(:,2),mean_correct_readout_saver_all_realizations_matrix(:,1),'r',LineWidth=1.5)
hold on
%%
% In this code I will compute P_c for different N and M 
% Next I will plot P_c(M) for different N while q is const.

%set parameters:

f=12.8/5;
eps=1/1.1;
D_values=[8]; % number of distractors
N_values=1:1:1000;


%%

for M=D_values
N_Range=N_values
round=0
%

for N=N_Range

a(N)=sqrt(N/(eps*f*2*log(M)));
b(N)=eps*f+sqrt((eps*f*2*log(M))/N);
% b(N)=eps*f+sqrt((eps*f*2*log(M))/N)-(sqrt(eps*f)*(log(log(M))+log(4*pi)))/(2*sqrt(N*2*log(M)));



%defines function for integration
syms y
fun = @(y) sqrt(N/(2*pi*f))*exp((-N/(2*f))*(y-f).*(y-f)).*exp(-exp(-a(N)*(y-b(N))));
fun1 = @(y) sqrt(N/(2*pi*f))*exp((-N/(2*f))*(y-f).*(y-f));
fun2 = @(y) exp(-exp(-a(N)*(y-b(N))))
%
% a=10000000
% lim=100
% syms x
% fun = @(x) sqrt(a/pi)*exp(-(a*(x-9).*(x-9)));
% q = vpa(int(fun,x,[-lim,lim]))
%
%the integration
P_c(N)=vpa(int(fun,y,[-100,100]));
end

%%


%
round=round+1
% figure(round)

plot(N_Range,P_c(N_Range),'b',LineWidth=1.5)
ylim([0,1])

box off
hold on
end
%%
set(gca, 'TickDir', 'out')
xlabel('Number of Neurons per Population (N)')
ylabel('Readout Accuracy')
title('Nine Heterogeneous Populations')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.jpg','jpg');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.fig','fig');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.tif','tif');


hold off
end
end



if P_cVSP_c_exp_plot
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
load(fullFileName);
    %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

%

figure(51)
% scatterhist(reshape(correct_readout_saver_all_realizations_matrix(:,5,1:end),[],1),reshape(correct_readout_saver_all_realizations_matrix(:,1,1:end),[],1),"NBins",25,'Color','b',"MarkerSize",2)
scatter(reshape(correct_readout_saver_all_realizations_matrix(:,5,1:end),[],1),reshape(correct_readout_saver_all_realizations_matrix(:,1,1:end),[],1),'blue','filled')

hold on

plot([0 0.1],[0 0.1],'b--')
hold on
%%
set(gca, 'TickDir', 'out')
xlim([0 0.1])
ylim([0 0.1])
xlabel('Readout Accuracy exponential')
ylabel('Readout Accuracy Poisson')
% title('Response Distribution for Same Realization')
% subtitle('15 Distractors, 100 Neurons per Population',FontSize=18,FontWeight='bold')
box off
x0=10;
y0=10;
width=700;
height=700;
set(gcf,'position',[x0,y0,width,height])

% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.jpg','jpg');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.fig','fig');
% saveas(figure(41),'M9Nchangingmeann13var4mu_for_exp5over10.tif','tif');


hold on
end
[c I]=corrcoef(correct_readout_saver_all_realizations_matrix(:,5,:),correct_readout_saver_all_realizations_matrix(:,1,:))
text(0.07,0.02,['\rho=' num2str(c(3))],'FontWeight','bold')


saveas(figure(51),'M9N100meann13var4mu_for_exp3over10.jpg','jpg');
saveas(figure(51),'M9N100meann13var4mu_for_exp3over10.fig','fig');
saveas(figure(51),'M9N100meann13var4mu_for_exp3over10.tif','tif');
end