function clamped(p,width,ang,nP,shift,lin,col,sty)
%% Plot clamped point
if nargin<3
    ang=0; nP=5; shift=0; lin=1; col='k'; sty='-';
elseif nargin<4
    nP=5; shift=0; lin=1; col='k'; sty='-';
elseif nargin<5
    shift=0; lin=1; col='k'; sty='-';
elseif nargin<6
    lin=1; col='k'; sty='-';
elseif nargin<7
    col='k'; sty='-';
elseif nargin<8
    sty='-';
end
hold on

%% Plot
x=p(1); y=p(2); r=width(1)/2;
p1=[x-r y]; p2=[x+r y];
newP=rotPnts([p1;p2],p,-ang);
clampedLine(newP(1,:),newP(2,:),3*width(1)/4,nP,shift,lin,col,sty)

end