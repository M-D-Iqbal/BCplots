clear; clc; close all;

%% Data
nPnts=8;                                                                    % number of vertex                                     
openLine=0;                                                                 % open element
startAng=230;                                                               % start ange
endAng=220;                                                                 % end angle
minRad=1;                                                                   % minimum radius from center
maxRad=1;                                                                   % maximum radius from center
section=3;                                                                  % subdomain
scaleLine=0.6;                                                              % boundary scaling 

%% Controls
% Data
radLin=1;
xsiD=0.175;
etaD=0.065;       
etaR=0.35;

% Details
lin=1.5; fontM=16; 
col_1=[0.95 0.95 0.95];
col_2=[0 0.5 1];
arrowProp=[20 0.05 0.03];


%% Get polygon data
[~,~,sec]=polyShpGen(nPnts,startAng,endAng,minRad,maxRad,openLine,section,scaleLine);
close all;

%% Sector
figure; hold on; axis equal; axis off;
secC=sec.coord; cen=sec.cen; 
shp=[secC; cen];
f=fill(shp(:,1),shp(:,2),col_1);
f.EdgeColor='w';
for i=1:size(secC,1)-1
    plot([secC(i,1) secC(i+1,1)],[secC(i,2) secC(i+1,2)],'-k','LineWidth',lin)
end

%% Radial lines
if radLin==1
    for i=1:size(secC,1)
        plot([secC(i,1) cen(1)],[secC(i,2) cen(2)],'--k','LineWidth',lin-0.5)
    end
end

%% Xi
mid=[(secC(1,1)+secC(2,1))/2 (secC(1,2)+secC(2,2))/2];
p1=cen; 
p2=mid;
[p3,p4]=redLin(p1,p2,0,-xsiD);
arrow2P(p3,p4,arrowProp,lin-0.25)

%% Eta
p1=secC(1,:); p2=secC(2,:);
[~,~,Leta]=lineEq(p1,p2);
[p3,p4]=paraLin(p1,p2,-etaD,etaR,1-etaR);
arrow2P(p3,p4,arrowProp,lin-0.25)

%% Center
plot(cen(1),cen(2),'o','LineWidth',lin-0.75,...
    'MarkerEdgeColor','k','MarkerFaceColor',col_2,'MarkerSize',8);

%% Nodes
plot(secC(:,1),secC(:,2),'o','LineWidth',lin-0.5,...
    'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',7);
plot(mid(1),mid(2),'o','LineWidth',lin-0.5,...
    'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',7);
