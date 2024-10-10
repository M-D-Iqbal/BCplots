function compression(p1,p2,width,ang,nP,shift,arrowProp,lin,col,sty)
%% Plot compression arrows
if nargin<4
    ang=0; nP=5; shift=0;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
elseif nargin<5
    nP=5; shift=0;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
elseif nargin<6
    shift=0;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
elseif nargin<7
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';
elseif nargin<8
    lin=1; col='k'; sty='-';
elseif nargin<9
    col='k'; sty='-';
elseif nargin<10
    sty='-';
end
hold on

%% Plot 
[p1,p2]=redLin(p1,p2,shift,shift);
[p3,p4]=paraLin(p1,p2,-width(1),0,1);
x1=linspace(p1(1),p2(1),nP);
y1=linspace(p1(2),p2(2),nP);
x2=linspace(p3(1),p4(1),nP);
y2=linspace(p3(2),p4(2),nP);
for iA=1:nP
    pR=rotPnts([x2(iA) y2(iA)],[x1(iA) y1(iA)],ang);
    arrow2P([pR(1) pR(2)],[x1(iA) y1(iA)],arrowProp,lin,col,sty);
end

end