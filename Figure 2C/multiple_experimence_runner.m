for experimant= 1:1
experimant
network_creater_and_competition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['POP','M','2','N','ceiling','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'expMeanChaging','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 2B\results\' filename],'correct_readout_saver')

end

