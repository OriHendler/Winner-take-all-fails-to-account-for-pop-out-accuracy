clear all
close all
GrphicSettings
%
N=1000;
realizations=10;
T_data = readtable("Data.xlsx"); %here you can see and be reminded what each row is
data= table2array(T_data) %converting to a matrix form for analyiss
  x =data(2:end,1)./N;
  y = data(2:end,2:end)


figure(1)
for i=1:realizations
stairs(x,y(:,i),'black')
hold on
end

xlim([0 1])
ylim([0 1])
xticks([0 0.5 1])
yticks([0 0.5 1])
xlabel('Fraction of Participants')
ylabel('Cumulative Participation Rate')
title('')
box off 

saveas(figure(1),'ComulativeParticipationRteVSFractionOfParticipantsN1000','fig')
saveas(figure(1),'ComulativeParticipationRteVSFractionOfParticipantsN1000','jpg')
saveas(figure(1),'ComulativeParticipationRteVSFractionOfParticipantsN1000','tif')