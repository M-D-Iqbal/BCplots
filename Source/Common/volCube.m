function  pnts=volCube(p,width,ang,plt,fil,lin,col,filCol,sty)
%% Plot Cube
if nargin<3
    ang=20; plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
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
hold on;

%% Data
x=p(1); y=p(2);
if numel(width)~=3
    error("Cube requires width, height, and depth ...")
end
wX=width(1)/2; wY=width(2)/2; wZ=width(3);
pnts=[x-wX y-wY; x+wX y-wY; x+wX y+wY; x-wX y+wY;];
pnts(5,:)=[pnts(2,1)+wZ*cosd(ang) pnts(2,2)+wZ*sind(ang)];
pnts(6,:)=[pnts(3,1)+wZ*cosd(ang) pnts(3,2)+wZ*sind(ang)];
pnts(7,:)=[pnts(4,1)+wZ*cosd(ang) pnts(4,2)+wZ*sind(ang)];
pnts(8,:)=[pnts(1,1)+wZ*cosd(ang) pnts(1,2)+wZ*sind(ang)];

%% Plot
if plt==1
    % Surface index
    id1=[1 2 3 4 1];
    id2=[2 5 6 3 2];
    id3=[4 3 6 7 4];
    % Surface 1
    f1=patch(pnts(id1,1),pnts(id1,2),col,'HandleVisibility','off');
    f1.FaceColor=filCol;
    f1.FaceAlpha=fil;
    f1.EdgeAlpha=0;
    plot(pnts(id1,1),pnts(id1,2),sty,'Color',col,...
        'LineWidth',lin,'HandleVisibility','off')
    % Surface 2
    f2=patch(pnts(id2,1),pnts(id2,2),col,'HandleVisibility','off');
    f2.FaceColor=filCol;
    f2.FaceAlpha=fil;
    f2.EdgeAlpha=0;
    plot(pnts(id2,1),pnts(id2,2),sty,'Color',col,...
        'LineWidth',lin,'HandleVisibility','off')
    % Surface 3
    f3=patch(pnts(id3,1),pnts(id3,2),col,'HandleVisibility','off');
    f3.FaceColor=filCol;
    f3.FaceAlpha=fil;
    f3.EdgeAlpha=0;
    plot(pnts(id3,1),pnts(id3,2),sty,'Color',col,...
        'LineWidth',lin,'HandleVisibility','off')
end