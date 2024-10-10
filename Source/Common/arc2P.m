function [x,y]=arc2P(cen,p1,p2,plt,fil,lin,col,filCol,sty,step)
%% Plot circle or arc (points counter clockwise)
if nargin<4
    plt=0; fil=0; lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<5
    fil=0; lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<6
    lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<7
    col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<8
    filCol='w'; sty='-';  step=0.1;
elseif nargin<9
    sty='-';  step=0.1;
elseif nargin<10
    step=0.1;
end

%% Plot
% Data
angs(1)=ang2pnt(cen,p1);
angs(2)=ang2pnt(cen,p2);
rad=sqrt((p1(1)-cen(1))^2+(p1(2)-cen(2))^2);
% Type
angs(3)=0;
if numel(cen)==3 && cen(3)==1
    angs(3)=1;
end
% Arc
[xc,yc]=arc(cen,rad,angs,plt,fil,lin,col,filCol,sty,step);
x=[xc p2(1)];
y=[yc p2(2)];
end
