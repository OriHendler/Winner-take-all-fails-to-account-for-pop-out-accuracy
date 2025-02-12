clear all
close all

load('SavedR1R2ValuesPhase')

R1=R1_values_Phase_temp(2:end);
R2=R2_values_Phase_temp(2:end);

clearvars -except R1 R2

Y= R1./R2;
R1_dec=sort(R1,'descend');
R2_dec=sort(R2,'descend');

create_scatter_plot=1

if create_scatter_plot
    
h=scatter(R1,Y,'filled','b');
set(gca, 'XTick', [0:6:30], 'XTickLabel', [0:6:30]) % 5 ticks 
set(gca, 'YTick', [0:1:5], 'YTickLabel', [0:1:5]) % 6 ticks
ylim([0 5])
xlim([0 30])
ax=gca;
ax.LineWidth=1.5;

set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 14) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 14) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

[corraltion,p_value]=corrcoef(R1,Y)

text(15,4,['\rho=',num2str(round(corraltion(2,1),3))],'FontWeight','bold')
% text(15,3.7,['P value ',num2str(round(p_value(2,1),3))])

xlabel('Firing Rate (Hz)')
ylabel("Contextual Modulation Strength (q)")
title('Empirical Relationship between')
subtitle('Contextual Modulation and Rate','FontSize',15.4,'FontWeight','bold')

set(gca,'TickDir','out'); % The only other option is 'in'
pbaspect([1 1 1])
box off

x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

end
saveas(h,'qVSfiringratetoPopOutstimuliWithStats','fig')
saveas(h,'qVSfiringratetoPopOutstimuliWithStats','jpg')
saveas(h,'qVSfiringratetoPopOutstimuliWithStats','tif')

%%

create_bar_plot=0

if create_bar_plot
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 14) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 14) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')

b=bar([2,4],[mean(R2),mean(R1)],0.5)
xlim([0 6])
b.FaceColor = 'flat';
b.CData(1,:) = [0.7500 0.2 0];
hold on

er = errorbar([2,4],[mean(R2),mean(R1)],[std(R2)/2,std(R1)/2],[std(R2)/2,std(R1)/2]);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off


ax=gca;
ax.LineWidth=1.5;

xlabel('')
ylabel('Mean Firing Rate (Hz)')
title('Population Response to Stimuli')

set(gca,'TickDir','out'); % The only other option is 'in'
pbaspect([1 1 1])
box off

x0=10;
y0=10;
width=500;
height=500;
set(gcf,'position',[x0,y0,width,height])
end

