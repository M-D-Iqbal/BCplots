function pnts=randShp(plt,numP,crc,len,radR)
%% Generate random shapes 
% not robust, keep generating to get desired shape
% plt:  Shape plot
% numP: 1x2 or 1x1, numP(1) number of output points, numP(2) randomness [3:inf]
% crc : 1x1 Crack or close boundary
% len : 1x1 length of crack
% rad : 1x2 min and max radius of random points

%% Data set
if nargin<1
    plt=1; numP=10;
    crc=0; len=0.1;
    radR=[1 2];
elseif nargin<2
    numP=10;
    crc=0;   len=0.1;
    radR=[1 2];
elseif nargin<3
    crc=0;   len=0.1;
    radR=[1 2];
elseif nargin<4
    len=0.1; radR=[1 2];
elseif nargin<5
    radR=[1 2];
end
% Type
if numel(numP)==2
    nPnts=numP(2);
    numP=numP(1);
elseif numel(numP)==1
    nPnts=6;
end

%% Random shape
% Points location
a=radR(1); b=radR(2);
lenX=a+(b-a).*rand(1,nPnts);
lenY=a+(b-a).*rand(1,nPnts);
% Angles
diff=2*pi/nPnts;
ang=linspace(diff/2,2*pi-diff/2,nPnts);
x=lenX.*cos(ang); y=lenY.*sin(ang);
% Generated Points
pntsD=[x;y];
pntsD(:,end+1)=pntsD(:,1);
pPnts=cscvn(pntsD);
pData=fnplt(pPnts);
pData=pData';
genP=size(pData,1);
endP=floor(genP/numP);
% Close or open boundary
if crc~=1
    % Selection of points
    id=floor(linspace(1, genP-endP-1, numP));
    pnts=pData(id,:);
else
    % Selection of crack opening
    cV1=ceil((genP-4).*rand(1,1)+2);
    cV2=cV1-1;
    % Sorting points so tip is 1st
    idS=[cV1:genP-1 1:cV2];
    pData=pData(idS,:);
    % Points selection
    id=floor(linspace(endP,genP-endP-1,numP));
    pnts=pData(id,:);
    pnts=[pData(1,:);pnts;pData(end,:)];
    % Tip location
    midP=(pnts(1,:)+pnts(end,:))./2;
    angP=ang2pnt([0 0],midP);
    dis=sqrt(midP(1)^2+midP(2)^2)-len;
    tip=[dis*cosd(angP) dis*sind(angP)];
    % Add tip as 1st
    pnts=[tip;pnts];
end

%% Plot check
if plt==1
    mySty;
    pgon=polyshape(pnts);
    p=plot(pgon);
    p.FaceColor=filCol;
    p.FaceAlpha=1;
    p.EdgeColor='k';
    p.LineWidth=LineWidth;
    axis equal; grid on;
end
end