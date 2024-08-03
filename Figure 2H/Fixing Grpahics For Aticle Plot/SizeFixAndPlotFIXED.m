clear all
close all



  fh = openfig('MeanFAvsTPwithStatsREMAKE.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all
GrphicSettings

figure(1)
scatter(x,y,'blue','filled')
% plot([0 0.5],[0 0.5],'Color','blue','LineStyle','--')

xlim([0 0.5])
ylim([0 0.2])
xticks([0 0.25 0.5])
yticks([0 0.1 0.2])
xlabel('Hit Rate (C_{ii})')
ylabel('Mean Flase Alaram (C_{ij}) i \neq j')
title('')

% saveas(figure(1),'MeanFAvsTPwithStatsREMAKEREMAKE','fig')
% saveas(figure(1),'MeanFAvsTPwithStatsREMAKEREMAKE','jpg')
% saveas(figure(1),'MeanFAvsTPwithStatsREMAKEREMAKE','tif')