function arrowHead(p,ang,arrowProp,lin,col)
%% Plot arrow head
tipAngle=arrowProp(1);
tipWidth=arrowProp(2);
baseWidth=arrowProp(3);
tipAngle=tipAngle*pi/180;
% Head angle
p1Ang=ang+pi-tipAngle;
p2Ang=ang+pi+tipAngle;
% Head end points
ph1=[p(1)+tipWidth*cos(p1Ang) p(2)+tipWidth*sin(p1Ang)]';
ph2=[p(1)+tipWidth*cos(p2Ang) p(2)+tipWidth*sin(p2Ang)]';
% Head center points
pcAng=ang+pi;
pc=[p(1)+baseWidth*cos(pcAng) p(2)+baseWidth*sin(pcAng)']';
% Arrow points
arrPnts=cscvn([ph1 pc ph2]);
arrPnts=fnplt(arrPnts);
arrPnts=[p(1) arrPnts(1,:); p(2) arrPnts(2,:)];
% Plot
p=patch(arrPnts(1,:),arrPnts(2,:),col,'HandleVisibility','off');
p.LineWidth=lin;
p.EdgeColor=col;

end