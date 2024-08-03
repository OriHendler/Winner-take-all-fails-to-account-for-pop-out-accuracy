set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')


figure(1)
plot(1:1000,[pop_wta_y_saver(2),pop_wta_y_saver(2:end)],Color=[0 1 1])
hold on
plot(1:1000,[wta_y_saver(2),wta_y_saver(2:end)],Color=[1 0 1])
hold on
plot([1 1000],[0.1111 0.1111],'k')

ylim([0,1])
set(gca, 'TickDir', 'out')
xlabel('Number of Neurons per Population')
ylabel('Readout Accuracy')
title('Model Performance in Pop-out Task')
box off
legend('Population Winner-take-all','Winner-take-all','Chance value',Location='northwest');
legend boxoff  
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'WTAvsPOPM8N1000','jpg');
saveas(figure(1),'WTAvsPOPM8N1000','fig');
saveas(figure(1),'WTAvsPOPM8N1000','tif');
