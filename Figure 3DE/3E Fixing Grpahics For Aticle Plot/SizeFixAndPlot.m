clear all
close all



  fh = openfig('CDFOfScorerN100.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
for k=1:20
plot(x{k,1},y{k,1},'black','LineWidth',0.1)
hold on
end
xlim([0 0.3])
ylim([0 1])
xticks([0 0.15 0.3])
yticks([0 0.5 1])
xlabel('Participation Rate')
ylabel('Probability(P_R)<Participation Rate')
title('')
% legend('q=1.5','q=1.44','q=1.3','q=1.1','Chance Value',Location='northwest')
box off 

saveas(figure(1),'CDFOfScorerN100REMAKE','fig')
saveas(figure(1),'CDFOfScorerN100REMAKE','jpg')
saveas(figure(1),'CDFOfScorerN100REMAKE','tif')