%Testing how to add correlations to the network

clear all
close all
wta=1;
Popwta=1;
%
correlation_cofarr=[0 0.01 0.05];%correlation between the firing rate of neurons in the same population 
Narr=[10000]; %number of neurons per population
Marr=[10];  %number of distracotrs
qarr=[1.1 1.2 1.3];
iteration=0; %initial value
for correlation_cof=correlation_cofarr
for q=qarr
for N=Narr
trials=1000;
Correlation_matrix=correlation_cof*(ones(N)-eye(N))+eye(N); %Correlation matrix
U=chol(Correlation_matrix); %Cholesky decomposition 
for M=Marr
clear var MEANt MEANd Rd Rt MAXt MAXd MAXMAXd
%Generate networks
for Midx=1:M+1
R=randn(trials,N); %Random data in N columns
Rc_uniform=R*U; %Correlated matrix
mu=12.8/5;
sigma=sqrt(mu);
Rt=mu+sigma*Rc_uniform;%Gussian Correlated matrix
q_Hetro=exprnd_shifted(q-1,N,1);
% q_Hetro=1+(q-1)*rand(N,1);
% q_Hetro=q*ones(N,1);
for idx=1:length(q_Hetro)
Rd(:,idx)=mu/q_Hetro(idx)+sigma/sqrt(q_Hetro(idx))*Rc_uniform(:,idx);
end
%Verify Correlation-Coeffs of generated vectors
% coeffMatrixt=corrcoef(Rt(:,7),Rt(:,85));
% coeffMatrixd=corrcoef(Rt(:,7),Rt(:,85));
Rt_saver{1,Midx}=Rt;
Rd_saver{1,Midx}=Rd;
end

if wta
%Begin wta computation
bar_location=1;
MAXt=(max(Rt_saver{1, bar_location}'))';
for Didx=2:M+1
MAXd(:,Didx)=(max(Rd_saver{1, Didx}'))';
end
MAXMAXd=max(MAXd,[],2);

readout_accuracy=sum(MAXt>MAXMAXd)/trials;
end

if Popwta
%Begin Population-wta computation
bar_location=1;
MEANt=(mean(Rt_saver{1, bar_location}'))';
for Didx=2:M+1
MEANd(:,Didx)=(mean(Rd_saver{1, Didx}'))';
end
POP_readout_accuracy=sum(MEANt>max(MEANd,[],2))/trials;
end
iteration=iteration+1;
data_saver(iteration,1)=readout_accuracy;
data_saver(iteration,2)=POP_readout_accuracy;
data_saver(iteration,3)=M;
data_saver(iteration,4)=N;
data_saver(iteration,5)=q;
data_saver(iteration,6)=correlation_cof;
end
end
end
end