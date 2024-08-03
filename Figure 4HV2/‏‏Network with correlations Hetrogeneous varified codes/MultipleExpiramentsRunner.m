for experimant= 1:20
NetworkCreaterAndCompetition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['POP','M',num2str(Marr(1)),num2str(Marr(end)),'N',num2str(Narr(1)),num2str(Narr(end)),'Crange','-date-',datestr(datetime('now'),time),'ExpQMeanRange','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\hendlero\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\Com biology\Entire Code Generation 23.04\Figure 4HV2\‏‏Network with correlations Hetrogeneous varified codes\results\' filename],'data_saver')

end