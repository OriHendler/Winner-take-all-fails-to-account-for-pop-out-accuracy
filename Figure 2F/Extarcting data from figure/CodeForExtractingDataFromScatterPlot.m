clear all
close all
openfig('qVSfiringratetoPopOutstimuliWithStats.fig')

hSc=findobj(gcf,'Type','scatter');
xvec = hSc.XData([1:21 23:end]); 
yvec = hSc.YData([1:21 23:end]);

[pirson_corrolation,p_value]=corrcoef(xvec,yvec)
