clear; clc; close all;

%% Test_4
figure;
axis equal; axis off;
hold on; 

%% Details
% Arrow
arrowProp=[20 0.09 0.05];
% Colors
clr_1=[0.9 0.9 0.9];
% General
wid=0.075; np=5;    shift=0.001;
lin=1;     aW=0.08; tW=0.13;
% MarkerSize
markSize=8;
% FontSize
font=12;

%% Data
L=1;       W=3*L;      a=0.15*L; 
cx=1.5*L;  cy=0.3*L;   R=0.2*L;
ay1=L;     ay2=L-a;
ax1=1.8*L; ax2=ax1;

pnts=[0   0
      W   0;
      W   L;
      0   L;];

%% Profile
pgon=polyshape(pnts(:,1),pnts(:,2));
p=plot(pgon); p.FaceColor=clr_1; p.FaceAlpha=1;
set(p,'LineWidth',lin);

%% Hole
ang = 0:0.01:2*pi;
xC=R*cos(ang)+cx; yC=R*sin(ang)+cy;
fill(xC,yC,'w','linewidth',lin)

%% Crack
plot([ax1 ax2],[ay1 ay2],...
    'color','k','linewidth',lin+0.5)

%% BCs
ib=0;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='clampedLine';
bc(ib).coords=[0 0; 3*L 0];
bc(ib).width=0.1;
bc(ib).shift=shift;
bc(ib).numObj=50;
bc(ib).arrowProp=arrowProp;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='pinnedLine';
bc(ib).coords=[0 L; 0 0;];
bc(ib).width=wid*2;
bc(ib).shift=shift;
bc(ib).numObj=[6 20];
bc(ib).arrowProp=arrowProp;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='compression';
bc(ib).coords=[3*L 0; 3*L L;];
bc(ib).width=wid*3;
bc(ib).shift=shift;
bc(ib).numObj=10;
bc(ib).arrowProp=arrowProp;

plotObj(bc)

%% Dimensions
ib=0;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 L; ax1 L];
dim(ib).width=tW;
dim(ib).txtWid=2*tW;
dim(ib).shift=1.5*wid;
dim(ib).str='$$1.8$$';
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[ax1 L; W L];
dim(ib).width=tW;
dim(ib).txtWid=2*tW;
dim(ib).shift=1.5*wid;
dim(ib).str='$$1.2$$';
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 0.7; W/2 0.7];
dim(ib).width=tW;
dim(ib).txtWid=2*tW;
dim(ib).shift=0;
dim(ib).str='$$1.5$$';
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[3*W/8 0; 3*W/8 cy];
dim(ib).shift=0;
dim(ib).width=wid;
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[5*W/8 cy+R; 5*W/8 cy-R];
dim(ib).shift=0;
dim(ib).width=wid;
dim(ib).txtWid=0;
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

plotObj(dim)

plot(cx,cy,'+k','markersize',markSize-5,'linewidth',lin-0.5)

%% Text
text(wid+ax1,ay2+a/2,'$$a$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')

