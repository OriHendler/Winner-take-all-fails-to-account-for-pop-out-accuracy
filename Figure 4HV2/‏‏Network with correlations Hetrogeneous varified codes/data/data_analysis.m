clear all
close all
load('POPM1100N1000010000Crange-date-24_03_07_08_41_43ExpQMeanRange.mat')
number_of_realizations=20;
number_of_other_parameters=4;
for realization_number=1:number_of_realizations
data_saver(:,1)=correct_readout_saver_all_realizations{1, realization_number}(:,3);
data_saver(:,2)=correct_readout_saver_all_realizations{1, realization_number}(:,4);
data_saver(:,3)=correct_readout_saver_all_realizations{1, realization_number}(:,5);
data_saver(:,4)=correct_readout_saver_all_realizations{1, realization_number}(:,6);
data_saver(:,realization_number+number_of_other_parameters)=correct_readout_saver_all_realizations{1, realization_number}(:,2);
end


data_saver_mean_and_SEM=data_saver(:,[1:4]);
data_saver_mean_and_SEM(:,5)=mean(data_saver(:,5:end),2);
data_saver_mean_and_SEM(:,6)=std(data_saver(:,5:end),[],2)/sqrt(number_of_realizations);
% SEM_qElevenOverTen=
% SEM_qTwelveOverTen=
% SEM_qThirteenOverTen=
% SEM_qFourteenOverTen=