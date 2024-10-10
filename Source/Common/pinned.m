function pinned(p,width,ang,nP,shift,lin,col,sty,clamp)
%% Plot pinned point
if nargin<3
    ang=0; nP=5; shift=0; lin=1; col='k'; sty='-'; clamp=[];
elseif nargin<4
    nP=5; shift=0; lin=1; col='k'; sty='-'; clamp=[];
elseif nargin<5
    shift=0; lin=1; col='k'; sty='-'; clamp=[];
elseif nargin<6
    lin=1; col='k'; sty='-'; clamp=[];
elseif nargin<7
    col='k'; sty='-'; clamp=[];
elseif nargin<8
    sty='-'; clamp=[];
elseif nargin<9
    clamp=[];
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
% Pinned
r1=width1/6; 
arc(p,r1,[0 360],1,1,lin-0.5,'k','w',sty,1); 
% Fixed point
x=p(1);y=p(2); r=width1/2;
px=[x x-r+r1/2 x+r-r1/2 x]; py=[y-r1 y-width1 y-width1 y-r1];
pnts=rotPnts([px' py'],p,-ang);
plot(pnts(:,1),pnts(:,2),sty,'color',col,'linewidth',lin)
% Line
p1=[x-r y-width1]; p2=[x+r y-width1];
newP=rotPnts([p1;p2],p,-ang);
if clamp==1
    clampedLine(newP(1,:),newP(2,:),width2,nP,shift,lin,col,sty)
elseif clamp==0
    freeLine(newP(1,:),newP(2,:),width2,nP,shift,lin,col,sty)
end

end