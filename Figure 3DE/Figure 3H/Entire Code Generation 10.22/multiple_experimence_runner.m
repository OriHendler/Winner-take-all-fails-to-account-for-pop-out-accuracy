for experimant= 1:2

network_creater_and_competition

%saveing data
time = datestr(now, 'yy_mm_dd_HH_MM_SS');
filename=['wta','M',num2str(M),'N',num2str(N),'-date-',datestr(datetime('now'),time),'-meann',num2str(meann),'var',num2str(variance),'mu_for_exp',num2str(mu_for_exp),'.mat'];


save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 3H\Entire Code Generation 10.22\results\' filename],'correct_readout',"winning_target_neuron_index_simulation")

end

