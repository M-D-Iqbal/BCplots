function pinnedLine(p1,p2,width,nP,shift,lin,col,sty,clamp)
%% Plot pinned line
if nargin<5
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
% Nums objs
if numel(nP)==2
    nP1=nP(1); nP2=nP(2);
else
    nP1=nP; nP2=nP*4;
end
% Widths objs
if numel(width)==2
    width1=width(1); width2=width(2);
else
    width1=width; width2=3*width1/4;
end

%% Plot
% Rollers
ang=atan2d((p2(2)-p1(2)),(p2(1)-p1(1)));
x=linspace(p1(1),p2(1),nP1);
y=linspace(p1(2),p2(2),nP1);
for iR=1:nP
    pinned([x(iR) y(iR)],width1,ang,0,shift,lin,col,sty)
end
% Line
[p1,p2]=redLin(p1,p2,-width1/2,-width1/2);
[p3,p4]=paraLin(p1,p2,-width1,0,1);
if clamp==1
    clampedLine(p3,p4,width2,nP2,shift,lin,col,sty)
else
    freeLine(p3,p4,width2,nP2,shift,lin,col,sty)
end

end