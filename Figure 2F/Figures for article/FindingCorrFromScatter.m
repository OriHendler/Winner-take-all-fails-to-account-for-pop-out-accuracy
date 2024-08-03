 GrphicSettings

fh = openfig('qVSfiringratetoPopOutstimuliWithStatsANOTHERtry.fig');
  h = findobj(fh,'-Property', 'XData'); %any object with property "XData" on figure fh
  x = get(h,'XData');
  y = get(h,'YData');
x=x([1:21 , 23]);
y=y([1:21 , 23]);
  [raw,Idx]=corrcoef(x,y)