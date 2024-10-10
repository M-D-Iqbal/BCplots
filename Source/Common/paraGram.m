function pnts=paraGram(p,width,shearAng,ang,plt,fil,lin,col,filCol,sty)
%% Plot Parallelogram
if nargin<3
    shearAng=20; ang=0; plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<4
    ang=0; plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<5
    plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<6
    fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<7
    lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<8
    col='k'; filCol='w'; sty='-';
elseif nargin<9
    filCol='w'; sty='-';
elseif nargin<10
    filCol='w'; sty='-';
end
hold on

%% Data
x=p(1); y=p(2);
if numel(width)==2
    widthX=width(1); widthY=width(2);
    pnts=[0 0; widthX 0; widthX widthY; 0 widthY];
else
    pnts=[0 0; width 0; width width; 0 width];
end
shrMatx=[1 0; tand(shearAng) 1];
pnts=pnts*shrMatx;

%% Translation and rotation
cen=[sum(pnts(:,1))/4 sum(pnts(:,2))/4];
pnts(:,1)=pnts(:,1)-cen(1)+x;
pnts(:,2)=pnts(:,2)-cen(2)+y;
pnts=rotPnts(pnts,[x y],ang);

%% Plot
if plt==1
    f=patch(pnts(:,1),pnts(:,2),col,'HandleVisibility','off');
    f.FaceAlpha=fil;
    f.LineWidth=lin;
    f.EdgeAlpha=1;
    f.EdgeColor=col;
    f.FaceColor=filCol;
    f.LineStyle=sty;
end
end