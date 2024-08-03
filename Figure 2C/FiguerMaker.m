%This code will produce figure 2 pannels A,B,D,E
clear all
close all



%Importing data:
open('inset.fig');
a = get(gca,'Children');
xdata_PannelA = get(a, 'XData');
ydata_PannelA = get(a, 'YData');

%%
close all
%
GrphicSettings
figure(1)
scatter(xdata_PannelA{1,1},ydata_PannelA{1,1},'b','filled')
hold on
scatter(xdata_PannelA{2,1},ydata_PannelA{2,1},'r','filled')
hold on
scatter(xdata_PannelA{3,1},ydata_PannelA{3,1},'g','filled')
hold off
xlim([0 36]);
ylim([0 15*10^4]);
xticks([0:12:36]);
yticks([0:5*10^4:15*10^4]);
xlabel('Number of Distractors')
ylabel('N_{ceil}')
legend('P_{ceil}=0.9','P_{ceil}=0.8','P_{ceil}=0.7',Location='northwest')
box off
%

fig_number=1;
saveas(figure(fig_number),'inset','jpg');
saveas(figure(fig_number),'inset','fig');
saveas(figure(fig_number),'inset','tif');

