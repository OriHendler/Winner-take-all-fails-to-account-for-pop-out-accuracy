clear all
load('data_saver_for_figure_2E_expN100.mat')
number_of_realizations=25;

mean_readout_exp=mean(data_saver_for_figure_2E_expN100,2);
std_readout_exp=std(data_saver_for_figure_2E_expN100,[],2);

SEM_expE=std_readout_exp/sqrt(number_of_realizations);

load('data_saver_for_figure_2E_poissN100.mat')

mean_readout_poiss=mean(data_saver_for_figure_2E_poissN100,2);
std_readout_poiss=std(data_saver_for_figure_2E_poissN100,[],2);

SEM_poissE=std_readout_poiss/sqrt(number_of_realizations);