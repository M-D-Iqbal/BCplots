clear; clc; close all;

%% Test_2
figure;
axis equal; axis off; 
hold on

%% Details
% Arrow
arrowProp=[20 0.0425 0.025];
% Colors
clr_1=[0.85 0.85 0.85];
clr_2=[0.95 0.95 0.95];
% General
lin=1; aW=0.03;   tW=0.075; 
wid=0.05; np=7;   shift=-0.0001;
% MarkerSize
markSize=20;
% FontSize
font=16;

%% Data
L=1; h1=0.359; h2=0.461;
pnts=[ 0    0
       0   -h2;
       L   -h2;
       L     0;
       L    h1;
       0    h1;];
   
%% BCs.
bc=obj2Plot;
bc.type='bc';
bc.subType='partialLine';
bc.coords=[L -h2; L h1];
bc.width=wid;
bc.numObj=[np 35];
bc.shift=shift;
bc.idxF=1;
bc.idxR=2:np;
bc.shift=wid/2;
plotObj(bc)

%% Profile
id1=[1 4 5 6]; id2=[1 2 3 4];
pgon=polyshape(pnts(id1,1),pnts(id1,2));
p=plot(pgon); p.FaceColor=clr_1; p.FaceAlpha=1;
set(p,'LineWidth',lin); 
pgon=polyshape(pnts(id2,1),pnts(id2,2));
p=plot(pgon); p.FaceColor=clr_2; p.FaceAlpha=1;
set(p,'LineWidth',lin); 

%% Material interface
plot([0 L],[0 0],'-k','linewidth',lin)

%% Dimensions
ib=0; 

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 h1; L h1];
dim(ib).str='$$L$$';
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).width=wid;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 0; 0 h1];
dim(ib).str='$$h_1$$';
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).width=wid;
dim(ib).arrowProp=arrowProp;

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 -h2; 0 0];
dim(ib).str='$$h_2$$';
dim(ib).txtWid=tW;
dim(ib).shift=wid;
dim(ib).width=wid;
dim(ib).arrowProp=arrowProp;

plotObj(dim)

%% Text
text(L/2,h1/2,'$$E_1, \nu_1, \alpha_1$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(L/2,-h2/2,'$$E_2, \nu_2, \alpha_2$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')

