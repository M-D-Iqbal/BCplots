clear; clc; close all;

%% Test_5
figure;
axis equal; axis off; 
hold on

%% Details
% Arrow
arrowProp=[20 0.09 0.05];
% Colors
clr_1=[0.9 0.9 0.9];
% General
wid=0.15; np=2;  shift=0.05;
lin=1;    aW=0.1; tW=0.225; 
% MarkerSize
markSize=20;
% FontSize
font=16;

%% Data
L=1; W=1; a=0.3; angC=60;
pnts=[ 0    0
       2*W  0;
       2*W  2*L;
       0    2*L;];

%% Profile
pgon=polyshape(pnts(:,1),pnts(:,2));
p=plot(pgon); p.FaceColor=clr_1; p.FaceAlpha=1;
set(p,'LineWidth',lin); 

%% Crack
plot([W W+a],[L L],'-k','LineWidth',lin-0.25);
cx1=W+a*cosd(angC);    cy1=L+a*sind(angC);
cx2=W+a*cosd(angC+180); cy2=L+a*sind(angC+180);
plot([W cx1],[L cy1],...
    'color','k','linewidth',lin+0.5)
plot([W cx2],[L cy2],...
    'color','k','linewidth',lin+0.5)
   
%% BCs
bc=obj2Plot;
bc.type='bc';
bc.subType='fixed';
bc.coords=[0 0;];
bc.width=wid;
bc.shift=shift;
bc.lin=lin;
plotObj(bc)

bc=obj2Plot;
bc.type='bc';
bc.subType='roller';
bc.coords=[2*W 0];
bc.width=wid;
bc.shift=shift;
bc.lin=lin;
plotObj(bc)

bc=obj2Plot;
bc.type='bc';
bc.subType='tension';
bc.coords=[2*W 0; 2*W L];
bc.width=wid*2;
bc.shift=0.1;
bc.lin=lin;
bc.numObj=5;
bc.arrowProp=arrowProp;
plotObj(bc)

bc=obj2Plot;
bc.type='bc';
bc.subType='compression';
bc.coords=[2*W L; 2*W 2*L];
bc.width=wid*2;
bc.shift=0.1;
bc.lin=lin;
bc.numObj=5;
bc.arrowProp=arrowProp;
plotObj(bc)

%% Dimensions
ib=0; 

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 0; 0 2*L];
dim(ib).width=tW/2;
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).str='$$2L$$';
dim(ib).lin=lin*0.75;
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 2*L; 2*W 2*L];
dim(ib).width=tW/2;
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).str='$$2W$$';
dim(ib).lin=lin*0.75;
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[cx2 cy2; cx1 cy1];
dim(ib).width=tW/2;
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).str='$$2a$$';
dim(ib).lin=lin*0.75;
dim(ib).font=font;
dim(ib).arrowProp=arrowProp;

plotObj(dim)

%% Arrow
ib=0; 
ib=ib+1;
arrow(ib)=obj2Plot;
arrow(ib).type='arrow';
arrow(ib).subType='rotArrow';
arrow(ib).coords=[W L];
arrow(ib).angle=[0 angC];
arrow(ib).width=3*a/4;
arrow(ib).arrowProp=arrowProp;
plotObj(arrow)


