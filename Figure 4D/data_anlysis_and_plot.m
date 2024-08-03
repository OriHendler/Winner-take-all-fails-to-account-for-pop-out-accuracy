clear all
close all
load('data_saver')
GrphicSettings
Number_Of_Realizations=20;

for idx=2:109
all_means(idx)=mean(data_saver(idx:109:(Number_Of_Realizations-1)*109+idx,1))
error_values(idx)=std(data_saver(idx:109:(Number_Of_Realizations-1)*109+idx,1))
end

all_means(1)=all_means(2);
error_values(1)=error_values(2);

SEM_D=error_values/sqrt(Number_Of_Realizations);
figure(1)
plot([1:9 10:10:1000],all_means,Color='g')
hold on
plot([1,1000],[1/9 1/9],Color='k')
xlim([0 1000])
ylim([0 1])
xticks(0:500:1000)
yticks(0:0.5:1)
xlabel('Neurons per Population')
ylabel('Readout Accuracy')
box off

saveas(figure(1),'PlotReadoutVN','fig')
saveas(figure(1),'PlotReadoutVN','jpg')
saveas(figure(1),'PlotReadoutVN','tif')