clear all
close all



  fh = openfig('M9N100meann13var4mu_for_exp3over10.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
scatter(x{2,1},y{2,1},'blue','filled')
hold on
plot(x{1,1},y{1,1},'Color','blue','LineStyle','--')
xlim([0 0.1])
ylim([0 0.1])
xticks([0 0.05 0.1])
yticks([0 0.05 0.1])
xlabel('Readout Accuracy exponential')
ylabel('Readout Accuracy Poisson')
title('')

saveas(figure(1),'M9N100meann13var4mu_for_exp3over10REMAKE','fig')
saveas(figure(1),'M9N100meann13var4mu_for_exp3over10REMAKE','jpg')
saveas(figure(1),'M9N100meann13var4mu_for_exp3over10REMAKE','tif')