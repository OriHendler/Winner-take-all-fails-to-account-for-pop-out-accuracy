clear all
close all
load('M48N100PoissExpMorPhasedecember2021.mat')
number_of_realizations=25;

std_readout_exp=std(Preferd_population_win_exprand);
SEM_expD=std_readout_exp/sqrt(number_of_realizations);

std_readout_poiss=std(Preferd_population_win_poissrnd);
SEM_poissD=std_readout_poiss/sqrt(number_of_realizations);
