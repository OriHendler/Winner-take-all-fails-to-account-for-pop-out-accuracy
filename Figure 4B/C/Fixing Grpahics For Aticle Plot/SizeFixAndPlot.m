clear all
close all



  fh = openfig('r1VSpcRealization10N1000WithCorrlationCoff.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
scatter(x,y,'blue','filled')
% hold on
% plot(x{1,1},y{1,1},'Color','blue','LineStyle','--')
xlim([0 20])
ylim([0 0.06])
xticks([0 10 20])
yticks([0 0.03 0.06])
xlabel('Firing Rate (Hz)')
ylabel('Participation Rate')
title('')

saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKE','fig')
saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKE','jpg')
saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKE','tif')