% In this code I will compute P_c for different N and M 
% Next I will plot P_c(M) for different N while q is const.

clear all
close all

%here the graphic settings begin
    %%
set(0, 'DefaultAxesFontName', 'Helvetica');
set(groot,'defaultLineLineWidth',2) 
set(0,'DefaultaxesLineWidth', 1.5)
set(0,'DefaultaxesFontSize', 16) 
set(0,'DefaultaxesFontWeight', 'bold') 
set(0,'DefaultTextFontSize', 16) 
set(0,'DefaultaxesFontName', 'Helvetica') 
set(0,'DefaultlegendFontName', 'Helvetica')
%


%set parameters:

f=5;
eps=0.75;
M_values=[3 8 35 99 399 899];
N_values=10:10:500;


%%

for M=M_values
N_Range=N_values
round=0
%

for N=N_Range

a(N)=sqrt(N/(eps*f*2*log(M)));
b(N)=eps*f+sqrt((eps*f*2*log(M))/N)-(sqrt(eps*f)*(log(log(M))+log(4*pi)))/(2*sqrt(N*2*log(M)));



%defines function for integration
syms y
fun = @(y) sqrt(N/(2*pi*f))*exp((-N/(2*f))*(y-f).*(y-f)).*exp(-exp(-a(N)*(y-b(N))));
fun1 = @(y) sqrt(N/(2*pi*f))*exp((-N/(2*f))*(y-f).*(y-f));
fun2 = @(y) exp(-exp(-a(N)*(y-b(N))))
%
% a=10000000
% lim=100
% syms x
% fun = @(x) sqrt(a/pi)*exp(-(a*(x-9).*(x-9)));
% q = vpa(int(fun,x,[-lim,lim]))
%
%the integration
P_c(N)=vpa(int(fun,y,[-100,100]));
end

%%


%
round=round+1
figure(round)

plot(N_Range,P_c(N_Range),'LineWidth',2)
ylim([0,1])
set(gca,'TickDir','out'); % The only other option is 'in'
xlabel('Number of Neurons per Population')
ylabel('Readout Accuracy')

title('Analytical Results')
box off
hold on

end
legend('Three Distractors','Eight Distractors', '35 Distractors', '99 Distractors','399 Distractors','899 Distractors' ,'Location','best')
% legend(['Number of Distractors ',num2str(M_values(1));'Number of Distractors ',num2str(M_values(2));'Number of Distractors ',num2str(M_values(3));'Number of Distractors ',num2str(M_values(4));'Number of Distractors ',num2str(M_values(5));'Number of Distractors ',num2str(M_values(6))])
% legend([num2str(M_values(1)), ' Distractors';num2str(M_values(2)), ' Distractors';num2str(M_values(3)), ' Distractors';num2str(M_values(4)), ' Distractors';num2str(M_values(5)), ' Distractors';num2str(M_values(6)), ' Distractors'])
legend boxoff                   % Hides the legend's axes (legend border and background)
hold off
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(round),['POPNchanging','Mafewcases','eps1'],'jpg');
saveas(figure(round),['POPNchanging','Mafewcases','eps1'],'tif');
