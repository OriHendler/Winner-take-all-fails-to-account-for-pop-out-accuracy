% This code is used to plot the data coming out of DataAnalysis


clear all
close all

%%
% Specify the folder where the files live.
myFolder = 'C:\Users\orihe\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\Figure 4HV2 edited for 2I2AFC\‏‏Network with correlations Hetrogeneous varified codes\data_analysis';
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
skip_size=34;
arr_x=3;
arr_y=2;
figure(41)
plot(mean_correct_readout_saver_all_realizations_matrix(1+2*skip_size:3*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+2*skip_size:3*skip_size,arr_y),'color',[0 0 1],LineWidth=1.5)
hold on
plot(mean_correct_readout_saver_all_realizations_matrix(1+skip_size:2*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+skip_size:2*skip_size,arr_y),'color',[0 0 0.7],LineWidth=1.5)
hold on
plot(mean_correct_readout_saver_all_realizations_matrix(1:skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1:skip_size,arr_y),'color',[0 0 0.5],LineWidth=1.5)
hold on


% plot(mean_correct_readout_saver_all_realizations_matrix(1+5*skip_size:6*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+5*skip_size:6*skip_size,arr_y),'color',[1 0 0],LineWidth=1.5)
% hold on
% plot(mean_correct_readout_saver_all_realizations_matrix(1+4*skip_size:5*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+4*skip_size:5*skip_size,arr_y),'color',[0.7 0 0],LineWidth=1.5)
% hold on
% plot(mean_correct_readout_saver_all_realizations_matrix(1+3*skip_size:4*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+3*skip_size:4*skip_size,arr_y),'color',[0.5 0 0],LineWidth=1.5)
% 
% 
% plot(mean_correct_readout_saver_all_realizations_matrix(1+8*skip_size:9*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+8*skip_size:9*skip_size,arr_y),'color',[0 1 0],LineWidth=1)
% hold on
% plot(mean_correct_readout_saver_all_realizations_matrix(1+7*skip_size:8*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+7*skip_size:8*skip_size,arr_y),'color',[0 0.7 0],LineWidth=1)
% hold on
% plot(mean_correct_readout_saver_all_realizations_matrix(1+6*skip_size:7*skip_size,arr_x),mean_correct_readout_saver_all_realizations_matrix(1+6*skip_size:7*skip_size,arr_y),'color',[0 0.5 0],LineWidth=1)

% %%

set(gca, 'TickDir', 'out')
xlabel('Number of Distractors (M)')
ylabel('Readout Accuracy')
box off
legend('r=0 q=1.3','r=0 q=1.2','r=0 q=1.1','r=0.01 q=1.3','r=0.01 q=1.2','r=0.01 q=1.1','r=0.05 q=1.3','r=0.05 q=1.2','r=0.05 q=1.1',Location='best');
legend boxoff  
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(41),'POPM8N1000qrangeRrange','jpg');
saveas(figure(41),'POPM8N1000qrangeRrange','fig');
saveas(figure(41),'POPM8N1000qrangeRrange','tif');


hold on
end

%%
Mar=[1:100];
mu=12.8*0.2;
q=1.3;
N_eff=20
% sigma=sqrt(mu/(q*N_eff));
sigma=sqrt(mu/(N_eff));

correct_readout=0; %initialise for next loop
for Mind = 1:length(Mar)
    M=Mar(Mind)+1 % i think this corr is needed??
am = (sqrt(2*log(M)))/(sigma);
bm = mu/q+(sqrt(2*log(M)) - 0.5*(log(log(M)) + log(4*pi))./sqrt(2*log(M)))*(sigma);
%
%Analytical solution with gambel apporixmation but without window
%aprroximation
xvec=-10:0.01:10;
% Argoment=exp(-exp(-(x-bm)*am))*normpdf(x,mu,sigma);
Gussian=normpdf(xvec,mu,sigma*sqrt(q));
% plot(Gussian)
% hold on
GambelCdf=exp(-exp(-(xvec-bm)*am));
% plot(GambelCdf)
% hold on
Argoment=Gussian.*GambelCdf;
% plot(Argoment)
% P_c_function=vpaintegral(Argoment, -inf, inf);
P_c_function=trapz(xvec,Argoment);
%
P_c_saver(Mind)=P_c_function;
end
%%
plot(Mar,P_c_saver)