clear all
close all
openfig('r1VSpcRealization10N1000.fig')

hSc=findobj(gcf,'Type','scatter');
xvec = hSc.XData; 
yvec = hSc.YData;

[pirson_corrolation,p_value]=corrcoef(xvec,yvec)
