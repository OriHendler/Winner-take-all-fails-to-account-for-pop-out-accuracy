clear all
close all
load('POPMchangingN5000-date-23_05_18_01_04_55-meann12.8var4expMeanChaging.mat')
number_of_realizations=40;
number_of_other_parameters=3;
for realization_number=1:number_of_realizations
data_saver(:,1)=correct_readout_saver_all_realizations{1, realization_number}(:,2);
data_saver(:,2)=correct_readout_saver_all_realizations{1, realization_number}(:,3);
data_saver(:,3)=correct_readout_saver_all_realizations{1, realization_number}(:,4);
data_saver(:,realization_number+number_of_other_parameters)=correct_readout_saver_all_realizations{1, realization_number}(:,1);
end
data_saver_temp(1:26,:)=data_saver([1:4:end-3],:);
data_saver_temp(27:52,:)=data_saver([2:4:end-2],:);
data_saver_temp(53:78,:)=data_saver([3:4:end-1],:);
data_saver_temp(79:104,:)=data_saver([4:4:end],:);

data_saver=data_saver_temp;
data_saver_mean_and_SEM=data_saver(:,[1:3]);
data_saver_mean_and_SEM(:,4)=mean(data_saver(:,4:end),2);
data_saver_mean_and_SEM(:,5)=std(data_saver(:,4:end),[],2)/sqrt(number_of_realizations);
% SEM_qElevenOverTen=
% SEM_qTwelveOverTen=
% SEM_qThirteenOverTen=
% SEM_qFourteenOverTen=