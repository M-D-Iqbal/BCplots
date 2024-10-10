function pnts=rect(p,width,ang,plt,fil,lin,col,filCol,sty)
%% Plot Rectangle
if nargin<3
    ang=0; plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<4
    plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<5
    fil=0; lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<6
    lin=1; col='k'; filCol='w'; sty='-';
elseif nargin<7
    col='k'; filCol='w'; sty='-';
elseif nargin<8
    filCol='w'; sty='-';
elseif nargin<9
    sty='-';
end
hold on

%% Plot
x=p(1); y=p(2);
if numel(width)==2
    widthX=width(1)/2; widthY=width(2)/2;
    pnts=[x-widthX y-widthY; x+widthX y-widthY; x+widthX y+widthY; x-widthX y+widthY];
else
    width=width/2;
    pnts=[x-width y-width; x+width y-width; x+width y+width; x-width y+width];
end
pnts=rotPnts(pnts,[x y],ang);
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