%This code is used to plot the data coming out of data_analysis.m
%Here we plot the confusion matrix

clear all
close all
%So what are we doing today?
heatmap_plot=0;
corrolation_of_off_diagonal_plot=0;
true_positive_versus_false_alarm_plot=1;
CDF_of_matrix_diagonal=0;
%%
% Specify the folder where the files live.
myFolder = 'C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix';
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
    %%
figure(1)
s=heatmap(probabilty_win,'CellLabelColor','none','Colormap',parula);
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
% title(['Matrix of Realization ',num2str(k)])
title('Confusion Matrix with 50 Neurons per Population')
xlabel('Population Index')
ylabel('Target Population Index')


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


saveas(figure(1),['M9N50meann13var4mu_for_exp1.1ConfusionMatrix',num2str(k),'.jpg'],'jpg');
saveas(figure(1),['M9N50meann13var4mu_for_exp1.1ConfusionMatrix',num2str(k),'.fig'],'fig');
saveas(figure(1),['M9N50meann13var4mu_for_exp1.1ConfusionMatrix',num2str(k),'.tif'],'tif');
% saveas(h,['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix_plots\',baseFileName,'.jpg'],'jpg')
end
end


%%
if corrolation_of_off_diagonal_plot
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
set(gca, 'TickDir', 'out')
%
figure(20)
    for i=1:length(probabilty_win)-1

        for j=i+1:length(probabilty_win)
    scatter (probabilty_win(i,j),probabilty_win(j,i))
    hold on
        end
    end    

cycle=1;
%create pairs of ij and ji values
for i=1:8
    for j=i+1:9 
pair(9*(i-1)+j,:)= [probabilty_win(i,j),probabilty_win(j,i)];
cycle=cycle+1;
    end
end

    hold on
save_pairs_for_all_realizations{k}(:,1)=nonzeros(pair(:,1))
save_pairs_for_all_realizations{k}(:,2)=nonzeros(pair(:,2)) 
end

vector_of_all_true_positive_and_mean_false_alarm=cat(1,save_pairs_for_all_realizations{:});

[pirson_corrolation_of_pairs,p_value]=corrcoef(vector_of_all_true_positive_and_mean_false_alarm(:,1),vector_of_all_true_positive_and_mean_false_alarm(:,2));

%
plot([0,0.15],[0,0.15],'k',LineWidth=1)
%

%
text(0.08,0.05,['correlation ',num2str(round(pirson_corrolation_of_pairs(2,1),3))])
text(0.08,0.04,['P value ',num2str(round(p_value(2,1),10))])

xlabel('ij Elements')
ylabel('ji Elements')
title('Off Diagonal Elements of Confusion Matrices')
xlim([0,0.15])
ylim([0,0.15])
box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(20),'M9N50meann13var4mu_for_exp1.1.jpg','jpg');
saveas(figure(20),'M9N50meann13var4mu_for_exp1.1.fig','fig');
saveas(figure(20),'M9N50meann13var4mu_for_exp1.1.tif','tif');
hold off

end

%%
if true_positive_versus_false_alarm_plot
for k = 1 :  length(theFiles)
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
set(gca, 'TickDir', 'out')
%
figure(30)
xlim([0,1])
ylim([0,0.1])


    for i=1:length(probabilty_win)
        if i==1
           scatter(probabilty_win(i,i),mean(probabilty_win(2:length(probabilty_win),1)))
           hold on
        end

        if i~=1
    scatter (probabilty_win(i,i),mean(probabilty_win(1:length(probabilty_win) ~=i,i)))
    hold on

        end     
    end
    hold on

true_positive_and_mean_false_alarm{k}(:,1)=diag(probabilty_win)
true_positive_and_mean_false_alarm{k}(:,2)=sum(probabilty_win-diag(diag(probabilty_win)))/(length(probabilty_win)-1)
end
%
hold on
vector_of_all_true_positive_and_mean_false_alarm=cat(1,true_positive_and_mean_false_alarm{:});

[pirson_corrolation_of_pairs,p_value]=corrcoef(vector_of_all_true_positive_and_mean_false_alarm(:,1),vector_of_all_true_positive_and_mean_false_alarm(:,2));

%
text(0.2,0.08,['correlation ',num2str(round(pirson_corrolation_of_pairs(2,1),3))])
text(0.2,0.075,['P value ',num2str(round(p_value(2,1),40))])

xlabel('True Positive')
ylabel('Mean False Alarm')
title('Confusion Matrices')

box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(30),'M9N50meann13var4mu_for_exp1.1TPvsFA.jpg','jpg');
saveas(figure(30),'M9N50meann13var4mu_for_exp1.1TPvsFA.fig','fig');
saveas(figure(30),'M9N50meann13var4mu_for_exp1.1TPvsFA.tif','tif');

hold off
end


if CDF_of_matrix_diagonal
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
set(gca, 'TickDir', 'out')
%

MATRIX_diagonal=diag(probabilty_win);
edges = 0:0.01:1;
figure(40)
h = histogram(MATRIX_diagonal',edges);
hNormalized = h.Values / sum(h.Values);
cdf = cumsum(hNormalized)
cdf_saver(k,:)=cdf;
close(figure(40))

figure(41)
stairs(edges,[0,cdf],Color=[17 17 17]/255)
hold on
end
mean_cdf_saver=mean(cdf_saver);
stairs(edges,[0,mean_cdf_saver],'r',LineWidth=1.5)
xlabel('p_c')
ylabel('Prob(p_c<P_c)')
title('CDF of all Realizations')
subtitle('8 Distractors, 50 Neurons per Population',FontSize=18,FontWeight='bold')
box off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(41),'M9N50meann13var4mu_for_exp1.1CDF.jpg','jpg');
saveas(figure(41),'M9N50meann13var4mu_for_exp1.1CDF.fig','fig');
saveas(figure(41),'M9N50meann13var4mu_for_exp1.1CDF.tif','tif');


hold off
end