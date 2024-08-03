for experimant= 1:50 
experimant
network_creater_and_competition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['POP','M','changing','N','5000','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'expMeanChaging','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 3B\results\' filename],'correct_readout_saver')

end

