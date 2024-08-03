% x = 0:0.1:10;
% y = exppdf(x,0.2);
% 
% figure;
% plot(x,y)
% xlabel('Observation')
% ylabel('Probability Density')

    pd=makedist('Exponential','mu',0.3);
    t=truncate(pd,1,1.5);
    r = random(t,10,100);
% histogram(r,100)