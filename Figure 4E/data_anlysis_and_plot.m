clear all
close all
load('data_saver')
GrphicSettings
Number_Of_Realizations=20;

all_means=[mean(data_saver(1:6:115)),mean(data_saver(2:6:116)),mean(data_saver(3:6:117)),mean(data_saver(4:6:118)),mean(data_saver(5:6:119)),mean(data_saver(6:6:120))]
error_values=[std(data_saver(1:6:115)),std(data_saver(2:6:116)),std(data_saver(3:6:117)),std(data_saver(4:6:118)),std(data_saver(5:6:119)),std(data_saver(6:6:120))]
SEM_E=error_values/sqrt(Number_Of_Realizations)
figure(1)
plot(0:0.01:0.05,all_means,Color='g')
hold on
plot([0 0.05],[1/9 1/9],Color='k')

xlim([0 0.05])
ylim([0 1])
xticks(0:0.025:0.05)
yticks(0:0.5:1)
xlabel('Intra Population Correlation')
ylabel('Readout Accuracy')
box off

saveas(figure(1),'PlotReadoutVSIntraCorrlation','fig')
saveas(figure(1),'PlotReadoutVSIntraCorrlation','jpg')
saveas(figure(1),'PlotReadoutVSIntraCorrlation','tif')