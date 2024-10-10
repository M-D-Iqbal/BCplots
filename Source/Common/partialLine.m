function partialLine(p1,p2,width,nP,idF,idR,idP,shift,lin,col,sty)
%% Plot partially fixed line
if nargin<7
    idP=0; shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<8
    shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<9
    lin=1; col='k'; sty='-';
elseif nargin<10
    col='k'; sty='-';
elseif nargin<11
    sty='-';
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

%% Plot fix/roller points
ang=atan2d((p2(2)-p1(2)),(p2(1)-p1(1)));
x=linspace(p1(1),p2(1),nP1);
y=linspace(p1(2),p2(2),nP1);
for iP=1:nP
    if find(iP==idF)
        fixed([x(iP) y(iP)],width1,ang,0,shift,lin,col,sty,0)
    elseif find(iP==idR)
        roller([x(iP) y(iP)],width1,ang,0,shift,lin,col,sty,0)
    elseif find(iP==idP)
        pinned([x(iP) y(iP)],width1,ang,0,shift,lin,col,sty)
    end
end

%% Clamped line
[p1,p2]=redLin(p1,p2,-width1/2,-width1/2);
[p3,p4]=paraLin(p1,p2,-width1,0,1);
clampedLine(p3,p4,width2,nP2,shift,lin,col,sty)

end