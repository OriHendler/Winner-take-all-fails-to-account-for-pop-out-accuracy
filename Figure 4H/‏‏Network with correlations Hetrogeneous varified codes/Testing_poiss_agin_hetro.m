%Homo wta- poiss noise
clear all
close all
lambda_target=12.8;

N=5000;
trials=1000;
M=8;
q=1.2

target=poissrnd(lambda_target,trials,N);

for Midx=1:M
q_hetro=1+(q-1)*rand(1,N);
lambda_distractor=lambda_target./q_hetro;

for trialidx=1:trials
distractor{Midx}(trialidx,:)=poissrnd(lambda_distractor);
end

MAXd(:,Midx)=max(distractor{1,Midx},[],2);
end

MAXt=max(target,[],2);
MAXMAXd=max(MAXd,[],2);
readout_accuracy_temp=(sum(MAXt>MAXMAXd)+nansum((MAXt==MAXMAXd)./(sum(MAXt==MAXd,2)+1)))/trials
