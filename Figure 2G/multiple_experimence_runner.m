for experimant= 1:100

network_creater_and_competition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['POP','M','48','N','100','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'SingleMeanElevenOverTen','.mat'];
% filename=['POP','M','8','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'ExponentialMeanElevenOverTen','.mat'];
% filename=['POP','M','changing','N','changing','-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_expElvenOverTen','.mat'];
save(['C:\Users\hendlero\Desktop\Figure 2I\results\' filename],'correct_readout_saver')

end

