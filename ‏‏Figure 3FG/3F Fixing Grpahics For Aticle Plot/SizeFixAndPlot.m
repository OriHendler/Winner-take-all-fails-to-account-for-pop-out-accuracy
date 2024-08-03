clear all
close all



  fh = openfig('PcVSneuronIndexRealization5.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
scatter(x,y,'blue','filled')
% hold on
% plot(x{1,1},y{1,1},'Color','blue','LineStyle','--')
xlim([0 1000])
ylim([0 0.2])
xticks([0 500 1000])
yticks([0 0.1 0.2])
xlabel('Neuron Index')
ylabel('Participation Rate')
title('')

saveas(figure(1),'PcVSneuronIndexRealization5REMAKE','fig')
saveas(figure(1),'PcVSneuronIndexRealization5REMAKE','jpg')
saveas(figure(1),'PcVSneuronIndexRealization5REMAKE','tif')