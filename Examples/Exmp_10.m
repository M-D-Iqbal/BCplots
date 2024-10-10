clear; clc; close all;

%% Data
nPnts=8;                                                                    % number of vertex
openLine=8;                                                                 % open element
startAng=230;                                                               % start ange
endAng=220;                                                                 % end angle
minRad=1;                                                                   % minimum radius from center
maxRad=1;                                                                   % maximum radius from center
section=3;                                                                  % subdomain
scaleLine=0.6;                                                              % boundary scaling

%% Controls
% Data
outShp=1;       radLin=1;                   scaLin=1;
org=1;          orgLoc=[-1.10 -1.00];       orgSize=0.3;
xsi=1;          xsiSec=4;                   xsiD=0.2;
eta=1;          etaSec=3;                   etaD=0.125;
linEle=1;       linEleSec=7;                linEleD=0.125;
sclBon=1;       sclBonSec=2;                sclBonD=0.2;

% Details
lin=1.5; fontM=16; fontT=10;
col_1=[0.80 0.80 0.80;];
col_2=[0 0.4470   0.7410];
arrowProp=[20 0.065 0.045];

%% Figure
figure; hold on;

%% Get polygon
[out,in,sec]=polyShpGen(nPnts,startAng,endAng,minRad,maxRad,openLine,section,scaleLine);
cen=[0 0];

%% Outer shape
if outShp==1
    outC=out.coord; inC=in.coord;
    shp=[outC; cen];
    f=fill(shp(:,1),shp(:,2),col_1);
    f.EdgeColor='w';
    f.FaceAlpha=0;
    for i=1:size(outC,1)-1
        plot([outC(i,1) outC(i+1,1)],[outC(i,2) outC(i+1,2)],'-k','LineWidth',lin)
    end
end

%% Section shade
if ~isempty(sec)
    p=patch([sec.coord(:,1);cen(1)],[sec.coord(:,2);cen(2)],col_1);
end

%% Radial lines
if radLin==1
    for i=1:size(outC,1)
        plot([outC(i,1) cen(1)],[outC(i,2) cen(2)],'--k','LineWidth',lin-0.5)
    end
end

%% Scaling line
if scaLin==1 && ~isempty(in)
    for i=1:size(inC,1)-1
        plot([inC(i,1) inC(i+1,1)],[inC(i,2) inC(i+1,2)],'-',...
            'Color',col_2,'LineWidth',lin)
    end
end

%% Origin
if org==1
    obj=obj2Plot;
    obj.type='arrows';
    obj.subType='axis';
    obj.coords=orgLoc;
    obj.width=orgSize;
    obj.arrowProp=arrowProp;
    obj.lin=lin-0.25;
    plotObj(obj)
end

%% Arrow Xsi
if xsi==1
    p1=cen;
    p2=[(outC(xsiSec+1,1)+outC(xsiSec,1))/2 (outC(xsiSec+1,2)+outC(xsiSec,2))/2];
    [p3,p4]=redLin(p1,p2,0,-xsiD);
    arrow2P(p3,p4,arrowProp,lin-0.25)
end

%% Arrow Eta
if eta==1
    p1=outC(etaSec,:); p2=outC(etaSec+1,:);
    [~,~,Leta]=lineEq(p1,p2);
    [p3,p4]=paraLin(p1,p2,-etaD,0.25,0.75);
    arrow2P(p3,p4,arrowProp,lin-0.25)
end

%% Line element
if linEle==1
    obj=obj2Plot;
    obj.type='dim';
    obj.coords=[outC(linEleSec-1,:);outC(linEleSec,:)];
    obj.arrowProp=arrowProp;
    obj.shift=-linEleD;
    obj.width=0;
    obj.lin=lin-0.25;
    plotObj(obj)
end

%% Scaled boudnary
if sclBon==1 && ~isempty(in)
    p1=[(outC(sclBonSec+1,1)+outC(sclBonSec,1))/2 (outC(sclBonSec+1,2)+outC(sclBonSec,2))/2];
    p2=[(inC(sclBonSec+1,1)+inC(sclBonSec,1))/2 (inC(sclBonSec+1,2)+inC(sclBonSec,2))/2];
    [p3,p4]=redLin(p1,p2,-sclBonD,0);
    arrow2P(p3,p4,arrowProp,lin-0.25)
end

%% Center
plot(cen(1),cen(2),'o','LineWidth',lin-0.75,...
    'MarkerEdgeColor','k','MarkerFaceColor',col_2,'MarkerSize',8);

%% Nodes
plot(outC(:,1),outC(:,2),'o','LineWidth',lin-0.5,...
    'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',7);

