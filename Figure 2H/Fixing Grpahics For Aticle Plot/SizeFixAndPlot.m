clear all
close all



  fh = openfig('M9Nchangingmeann13var4mu_for_expChanging.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');

close all

GrphicSettings
figure(1)
plot(x{5,1},y{5,1},'blue')
hold on
plot(x{4,1},y{4,1},'Color',[0 0 0.8])
hold on
plot(x{3,1},y{3,1},'Color',[0 0 0.6])
hold on
plot(x{2,1},y{2,1},'Color',[0 0 0.4])
hold on
plot(x{1,1},y{1,1},'black')
hold on

xlim([0 5000])
ylim([0 1])
xticks([0 2500 5000])
yticks([0 0.5 1])
xlabel('Neurons per Population')
ylabel('Readout Accuracy')
title('')
legend('q=1.5','q=1.44','q=1.3','q=1.1','Chance Value',Location='northwest')
box off 

% saveas(figure(1),'M9Nchangingmeann13var4mu_for_expChangingREMAKE','fig')
% saveas(figure(1),'M9Nchangingmeann13var4mu_for_expChangingREMAKE','jpg')
% saveas(figure(1),'M9Nchangingmeann13var4mu_for_expChangingREMAKE','tif')