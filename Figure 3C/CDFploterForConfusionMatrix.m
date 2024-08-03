clear all
close all

%Loading the matrix of all twenty realizations which is already sorted and
%ready for use
load('ConfusionMatrixM8N1000data1804.mat')

%%

set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 14) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 14) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')
%%
%Normilizing the 20 matrix so the values will range from zero to one
for i=1:20
MATRIXsaverALLorted_norm{1, i}=ConfusionMatrix{1, i};
end

%Here one begins to work only with the digonal, later on one can return to
%working on the entire diagonal
for i=1:20
MATRIX_diagonal(i,:)= diag(MATRIXsaverALLorted_norm{1, i})';
end

[Pc_Max_Prefferd_Pop] = max(MATRIX_diagonal'); %finding the maximal value per matrix diagonal. ie. the maximal self Pc per realiziation
[Pc_Min_Prefferd_Pop] = min(MATRIX_diagonal'); %same as Max, just Min value
B= Pc_Max_Prefferd_Pop-Pc_Min_Prefferd_Pop; %computing the difference between the maximal and minimal value per realization for the diagonal of self Pc
Mean_B= mean(B); %computing that mean value of the B

[Max_B,Max_B_Population_IDX]= max(B); %locating the maximal B and the realization index for this value
[Min_B,Min_B_Population_IDX]= min(B);


%%


for i=[1,20]
    figure(1)
h = histogram(MATRIX_diagonal(i,:),9);
hNormalized = h.Values / sum(h.Values);

cdf = cumsum(hNormalized)

x=mean([h.BinEdges(1:end-1);h.BinEdges(2:end)])
close(figure(1)) 
f=figure(2)
plot([0,x(1),x,x(end),0.6],[0,0,cdf,1,1],'--')

% ecdf(diag_saver(:,i));
hold on
title('Extreme realizations and all realizations')
ylabel('CDF')
xlabel('Pc')
xlim([0,0.6])
ylim([0,1.1])
% histogram(diag_saver(:,5),10)
end
hold on

%now we will compute and plot also the CDF of all 20 networks combined
VECTOR_NumberOfWinnesOfPrefPopulation_normalized=reshape(MATRIX_diagonal,1,[]); % convert matrix to row vector
for i=[1]
    figure(1)
h = histogram(VECTOR_NumberOfWinnesOfPrefPopulation_normalized(i,:),9);
hNormalized = h.Values / sum(h.Values);

cdf = cumsum(hNormalized)
% s2 = cumsum(hNormalized.^2);
% n = (1:numel(x)).';
% v = (s2 - cdf.^2 ./ n) ./ (n-1); % v(1) will be NaN, rather than 0 as in the first version
% v(1) = 0; % so we set it to 0 explicitly here


xx=mean([h.BinEdges(1:end-1);h.BinEdges(2:end)])
close(figure(1)) 
f=figure(2)
plot([0,xx(1),xx,xx(end),0.6],[0,0,cdf,1,1])

% ecdf(diag_saver(:,i));
hold on
title('Extreme realizations and all realizations')
ylabel('CDF')
xlabel('Pc')
xlim([0,0.6])
ylim([0,1.1])
% histogram(diag_saver(:,5),10)
end


%%
%Here we begin working on the data for multi false alram versus true
%positive. A given population is the winner as the target population sometimes (true positive) versus 
% false alarm where the given population is wrongly the winner.

for j= 1:20
    for i=1:9
TruePositive{1,j}(i)=MATRIXsaverALLorted_norm{1, j}(i,i);
MeanFalseAlarm{1,j}(i)=(sum(MATRIXsaverALLorted_norm{1, j}(1:9, i))-MATRIXsaverALLorted_norm{1, j}(i,i))/8;
    end
  %%

set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 14) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 14) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')
%%  
figure(3)
scatter(TruePositive{1,j},MeanFalseAlarm{1,j},'blue')
hold on
end

plot([0 0.5],[0 0.5],'b--')
hold on

vector_of_TruePositive_all_realizations=cat(2,TruePositive{:});
vector_of_MeanFalseAlarm_all_realizations=cat(2,MeanFalseAlarm{:});
[pirson_corrolation,p_value]=corrcoef(vector_of_TruePositive_all_realizations,vector_of_MeanFalseAlarm_all_realizations);

text(0.2,0.3,['\rho=',num2str(round(pirson_corrolation(2,1),3))],'FontWeight','bold')
% text(0.2,0.25,['P value ',num2str(round(p_value(2,1),35))])

title('Results Upon All Realizations')
ylabel('Mean False Alarm (C_{ij}) for i≠j')
xlabel('Hit Rate (C_{ii})')
xlim([0,0.5])
ylim([0,0.5])
xticks(0:0.1:0.5)
yticks(0:0.1:0.5)
box off
set(gca,'TickDir','out'); % The only other option is 'in'
pbaspect([1 1 1])
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(3),'MeanFAvsTPwithStats','fig')
saveas(figure(3),'MeanFAvsTPwithStats','jpg')
saveas(figure(3),'MeanFAvsTPwithStats','tif')