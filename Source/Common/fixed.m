function fixed(p,width,ang,nP,shift,lin,col,sty,clamp)
%% Plot fixed point
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
% Fixed point
x=p(1);y=p(2); r=width1/2;
px=[x x-r x+r x]; py=[y y-width1 y-width1 y];
pnts=rotPnts([px' py'],p,-ang);
plot(pnts(:,1),pnts(:,2),sty,'color',col,'linewidth',lin)
% Clamped
if clamp==1
    p1=[x-r y-width1]; p2=[x+r y-width1];
    newP=rotPnts([p1;p2],p,-ang);
    clampedLine(newP(1,:),newP(2,:),width2,nP,shift,lin,col,sty)
end

end