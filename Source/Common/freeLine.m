function freeLine(p1,p2,width,~,shift,lin,col,sty)
%% Plot clamped line
if nargin<3
    width=0; shift=0;
    lin=1; col='k'; sty='-';
elseif nargin<4
    shift=0;
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
[p3,p4]=paraLin(p1,p2,-width(1)/2,0,1);
plot([p3(1) p4(1)],[p3(2) p4(2)],sty,'Color',col,LineWidth=lin);

end