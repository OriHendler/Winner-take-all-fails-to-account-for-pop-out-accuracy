clear all 
close all

% colors = distinguishable_colors(2);
% colors(2,:)=colors(end,:);

%values
Number=7;
PopOutLocation=3;

for i=1:Number
x(i,1:Number)=1:Number;
y(i,1:Number)=i;
end
x(PopOutLocation,PopOutLocation)=1;
%dot size
sz=200;

%scatter 
figure(1)
for i=1:Number
scatter(x(i,:),y(i,:),sz,[0 0 1],'^','LineWidth',10,'SizeData',100)
hold on
scatter(PopOutLocation,PopOutLocation,sz,[0 1 0],'^','LineWidth',10,'SizeData',100)
hold on
end

xlim([0 Number+1])
ylim([0 Number+1])
pbaspect([1 1 1])


%box fitures
box on
box=gca;
box.LineWidth=2;
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])
set(gca,'LooseInset',get(gca,'TightInset'));

%features of saving
x0=10;
y0=10;
width=600;
height=600;
set(gcf,'position',[x0,y0,width,height])

saveas(figure(1),'PopOutShapeStimuliM48ProperSizeAndOrintation','jpg')
saveas(figure(1),'PopOutShapeStimuliM48ProperSizeAndOrintation','tif')
saveas(figure(1),'PopOutShapeStimuliM48ProperSizeAndOrintation','fig')