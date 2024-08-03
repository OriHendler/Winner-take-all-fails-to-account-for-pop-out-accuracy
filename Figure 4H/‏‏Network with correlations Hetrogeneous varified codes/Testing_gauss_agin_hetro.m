%Homo wta- poiss noise
clear all
close all
lambda_target=12.8/5;

N=5000;
trials=1000;
M=35;
q=1.3

for Nidx=1:N
target(:,Nidx)=normrnd(lambda_target,sqrt(lambda_target),trials,1);
end

for Midx=1:M
q_hetro=1+(q-1)*rand(1,N);
lambda_distractor=lambda_target./q_hetro;

clear var Nidx
for Nidx=1:N
distractor{Midx}(:,Nidx)=normrnd(lambda_distractor(Nidx),sqrt(lambda_distractor(Nidx)),trials,1);
end

MAXd(:,Midx)=max(distractor{1,Midx},[],2);
end

MAXt=max(target,[],2);
MAXMAXd=max(MAXd,[],2);
readout_accuracy_temp=(sum(MAXt>MAXMAXd)+nansum((MAXt==MAXMAXd)./(sum(MAXt==MAXd,2)+1)))/trials
