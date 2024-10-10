function roller(p,width,ang,nP,shift,lin,col,sty,clamp)
%% Plot roller at a point
if nargin<3
    ang=0; nP=5; shift=0; lin=1; col='k'; sty='-'; clamp=1;
elseif nargin<4
    nP=5; shift=0; lin=1; col='k'; sty='-'; clamp=1;
elseif nargin<5
    shift=0; lin=1; col='k'; sty='-'; clamp=1;
elseif nargin<6
    lin=1; col='k'; sty='-'; clamp=1;
elseif nargin<7
    col='k'; sty='-'; clamp=1;
elseif nargin<8
    sty='-'; clamp=1;
elseif nargin<9
    clamp=1;
end
hold on

%% Data
% Widths objs 
if numel(width)==2
    width1=width(1); width2=width(2);
else
    width1=width; width2=3*width1/4;
end

%% Plot
% Roller
x=p(1);y=p(2); r=width1/2; pc=[x y-r];
pc=rotPnts(pc,p,-ang);
arc(pc,r,[0 360],1,1,lin,col,'w',sty,1);
% Clamped line
if clamp==1
    p1=[x-r y-width1]; p2=[x+r y-width1];
    newP=rotPnts([p1;p2],p,-ang);
    clampedLine(newP(1,:),newP(2,:),width2,nP,shift,lin,col,sty)
end

end