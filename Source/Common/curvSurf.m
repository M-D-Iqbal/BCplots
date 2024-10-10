function  pnts=curvSurf(p,width,curRad,ang,plt,fil,lin,col,filCol,sty)
%% Plot Curved surface
if nargin<3
    curRad=1; ang=0; plt=1; fil=0; lin=1; col='k'; filCol='w'; sty='-';
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
    widthX=width(1)/2; widthY=width(2)/2;
    pntsC=[x-widthX y-widthY; x+widthX y-widthY; x+widthX y+widthY; x-widthX y+widthY];
else
    width=width/2;
    pntsC=[x-width y-width; x+width y-width; x+width y+width; x-width y+width];
end
pntsC=rotPnts(pntsC,[x y],ang);

%% Curves 
p1=pntsC(1,:); p2=pntsC(2,:);
p3=pntsC(3,:); p4=pntsC(4,:);
% Curve 1
[c1,~]=cen2pntsR(p1,p2,curRad);
[~,~,d(1)]=lineEq(p,c1(1,:));
[~,~,d(2)]=lineEq(p,c1(2,:));
[~,id]=max(d);
[x1,y1]=arc2P(c1(id,:),p1,p2,0);
pC1=[x1(2:end-1)' y1(2:end-1)'];
% Curve 2
[c2,~]=cen2pntsR(p2,p3,curRad);
[~,~,d(1)]=lineEq(p,c2(1,:));
[~,~,d(2)]=lineEq(p,c2(2,:));
[~,id]=max(d);
[x2,y2]=arc2P(c2(id,:),p2,p3,0);
pC2=[x2(2:end-1)' y2(2:end-1)'];
% Curve 3
[c3,~]=cen2pntsR(p3,p4,curRad);
[~,~,d(1)]=lineEq(p,c3(1,:));
[~,~,d(2)]=lineEq(p,c3(2,:));
[~,id]=min(d);
[x3,y3]=arc2P(c3(id,:),p3,p4,0);
pC3=[x3(2:end-1)' y3(2:end-1)'];
% Curve 4
[c4,~]=cen2pntsR(p4,p1,curRad);
[~,~,d(1)]=lineEq(p,c4(1,:));
[~,~,d(2)]=lineEq(p,c4(2,:));
[~,id]=min(d);
[x4,y4]=arc2P(c4(id,:),p4,p1,0);
pC4=[x4(2:end-1)' y4(2:end-1)'];
% Updated points
pnts=[p1; pC1; p2; pC2; p3; pC3; p4; pC4; p1;];

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