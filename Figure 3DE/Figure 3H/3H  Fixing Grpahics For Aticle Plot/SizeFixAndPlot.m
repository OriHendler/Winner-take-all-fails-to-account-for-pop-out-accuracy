clear all
close all
GrphicSettings
%
T_data = readtable("data_for_plot.xlsx"); %here you can see and be reminded what each row is
data= table2array(T_data) %converting to a matrix form for analyiss
  x =data(:,1)
  y = data(:,3)


figure(1)
scatter(x,y,'blue','filled')
set(gca,'xscale','log')

xlim([10 10000])
ylim([0 0.3])
xticks([10 100 1000 10000])
yticks([0 0.1 0.2 0.3])
xlabel('Neurons per Population')
ylabel('Fraction of Participants')
title('')
box off 
% 
% saveas(figure(1),'FractionofParticipantsVSlogN','fig')
% saveas(figure(1),'FractionofParticipantsVSlogN','jpg')
% saveas(figure(1),'FractionofParticipantsVSlogN','tif')