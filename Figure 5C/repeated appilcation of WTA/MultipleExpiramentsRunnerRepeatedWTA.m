for experimant= 1:50
NetworkCreaterAndCompetitionRepeatedWTA

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['WTArepeated','M',num2str(Marr(1)),num2str(Marr(end)),'N',num2str(Narr(1)),num2str(Narr(end)),'-date-',datestr(datetime('now'),time),'ExpQMeanRange','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\hendlero\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\repeated appilcation of WTA\results\' filename],'data_saver')

end

