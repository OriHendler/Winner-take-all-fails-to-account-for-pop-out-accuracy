clear all
close all



  fh = openfig('r1VSpcRealization10N1000WithCorrlationCoff.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');
x_power=[0:20]
y_power=1.769*10^-9*x_power.^5.746
close all

GrphicSettings
figure(1)
scatter(x,y,'blue','filled')
hold on
plot(x_power,y_power,'Color','black','LineStyle','--')
xlim([0 20])
ylim([0 0.06])
xticks([0 10 20])
yticks([0 0.03 0.06])
xlabel('Firing Rate (Hz)')
ylabel('Participation Rate')
title('')

saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKEwithFITPower','fig')
saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKEwithFITPower','jpg')
saveas(figure(1),'r1VSpcRealization10N1000WithCorrlationCoffREMAKEwithFITPower','tif')