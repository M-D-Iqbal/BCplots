function dimension(p1,p2,width,shift,texWidth,str,font,arrowProp,lin,col,sty,ang)
%% Plot dimension lines
if nargin<3
    [~,~,L]=lineEq(p1,p2);
    width=L/15;
    shift=0; texWidth=0; str=''; font=16;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<4
    shift=0; texWidth=0; str=''; font=16;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<5
    texWidth=0; str=''; font=16;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<6
    str=''; font=16;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<7
    font=16;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<8
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<9
    lin=1; col='k'; sty='-';
    ang=ang2pnt(p1,p2);
elseif nargin<10
    col='k'; sty='-'; ang=ang2pnt(p1,p2);
elseif nargin<11
    sty='-'; ang=ang2pnt(p1,p2);
elseif nargin<12
    ang=ang2pnt(p1,p2);
end
hold on

%% Plot
% Midpoint
p=[(p1(1)+p2(1))/2 (p1(2)+p2(2))/2];
% Divide lines
[~,p3]=redLin(p1,p,0,texWidth/2);
[~,p4]=redLin(p2,p,0,texWidth/2);
% Parallel line
[p1,p3]=paraLin(p1,p3,shift,0,1);
[p2,p4]=paraLin(p2,p4,-shift,0,1);
% Arrows
arrow2P(p3,p1,arrowProp,lin,col,sty)
arrow2P(p4,p2,arrowProp,lin,col,sty)
% Perpendicular line
[p5,p6]=perLin(p3,p1,p1,width/2);
[p7,p8]=perLin(p4,p2,p2,width/2);
plot([p5(1) p6(1)],[p5(2) p6(2)]',sty,'Color',col,'LineWidth',lin)
plot([p7(1) p8(1)],[p7(2) p8(2)]',sty,'Color',col,'LineWidth',lin)
% Text
cx=(p3(1)+p4(1))/2; cy=(p3(2)+p4(2))/2;
txtPlot([cx,cy],str,font,ang,col);

end