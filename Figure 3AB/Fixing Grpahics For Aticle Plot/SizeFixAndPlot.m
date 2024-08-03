clear all
close all



  fh = openfig('MeanFAvsTPwithStats.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
for k=1:21
scatter(x{k,1},y{k,1},'blue','filled')
hold on
end
plot([0 0.5],[0 0.5],'Color','blue','LineStyle','--')
hold off
xlim([0 0.5])
ylim([0 0.5])
xticks([0 0.25 0.5])
yticks([0 0.25 0.5])
xlabel('Hit Rate (C_{ii})')
ylabel('Mean Flase Alaram (C_{ij}) i \neq j')
title('')

saveas(figure(1),'MeanFAvsTPwithStatsREMAKE','fig')
saveas(figure(1),'MeanFAvsTPwithStatsREMAKE','jpg')
saveas(figure(1),'MeanFAvsTPwithStatsREMAKE','tif')