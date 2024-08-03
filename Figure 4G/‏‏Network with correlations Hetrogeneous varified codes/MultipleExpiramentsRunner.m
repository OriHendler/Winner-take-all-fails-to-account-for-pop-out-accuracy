for experimant= 1:20

NetworkCreaterAndCompetition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['POP','M',num2str(Marr(1)),num2str(Marr(end)),'N',num2str(Narr(1)),num2str(Narr(end)),'Crange','-date-',datestr(datetime('now'),time),'ExpQMeanRange','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\‏‏Network with correlations Hetrogeneous varified codes\results\' filename],'data_saver')

end