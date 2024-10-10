function clampedLine(p1,p2,width,nP,shift,lin,col,sty)
%% Plot clamped line
if nargin<3
    width=0; nP=10; shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<4
    nP=10; shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<5
    shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<6
    lin=1; col='k'; sty='-';
elseif nargin<7
    col='k'; sty='-';
elseif nargin<8
    sty='-';
end
hold on

%% Plot clapmed line
[p1,p2]=redLin(p1,p2,-shift,-shift);
plot([p1(1) p2(1)],[p1(2) p2(2)],sty,'Color',col,LineWidth=lin);
[p3,p4]=paraLin(p1,p2,width(1),0,1);
x1=linspace(p1(1),p2(1),nP);
y1=linspace(p1(2),p2(2),nP);
x2=linspace(p3(1),p4(1),nP);
y2=linspace(p3(2),p4(2),nP);
pnt1=[x1' y1']; pnt2=[x2' y2'];
for iP=1:nP
    pnt2(iP,:)=rotPnts(pnt2(iP,:),pnt1(iP,:),-135);
    plot([pnt1(iP,1) pnt2(iP,1)],[pnt1(iP,2) pnt2(iP,2)],...
        sty,'Color',col,LineWidth=lin);
end

end