clear all
close all



  fh = openfig('qVSpcRealization11N1000withCorraltionCoffcorrected.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
scatter(x,y,'blue','filled')
hold on
% plot(x{1,1},y{1,1},'Color','blue','LineStyle','--')
xlim([1 1.5])
ylim([0 0.06])
xticks([1 1.25 1.5])
yticks([0 0.03 0.06])
xlabel('Contextual Modulation Strength')
ylabel('Participation Rate')
title('')

saveas(figure(1),'qVSpcRealization11N1000withCorraltionCoffcorrectedREMAKE','fig')
saveas(figure(1),'qVSpcRealization11N1000withCorraltionCoffcorrectedREMAKE','jpg')
saveas(figure(1),'qVSpcRealization11N1000withCorraltionCoffcorrectedREMAKE','tif')