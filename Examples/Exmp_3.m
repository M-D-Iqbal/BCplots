clear; clc; close all;

%% Test_3
figure;
axis equal; axis off; 
hold on

%% Details
% Arrow
arrowProp=[20 0.125 0.08];
% Colors
clr_1=[0.9 0.9 0.9];
% General
wid=0.15; np=5; shift=0.001; aL=0.3;
lin=1;    aW=0.1;  aWb=0.08;
tW=0.275; 
% MarkerSize
markSize=20;
% FontSize
font=16;

%% Data
L=1; angC=3*pi/4; a=0.2;
pnts=[ 0    0
       L    0;
       L    L;
       2*L  L;
       2*L  2*L;
       L    2*L;
       L    3*L;
       0    3*L;
       0    2*L;
       -L   2*L;
       -L   L;
       0    L];

%% Profile
pgon=polyshape(pnts(:,1),pnts(:,2));
p=plot(pgon); p.FaceColor=clr_1; p.FaceAlpha=1;
set(p,'LineWidth',lin); 

%% Cracks
plot([1 1+0.2*cos(3*pi/4)],[1 1+0.2*sin(3*pi/4)],...
    'color','k','linewidth',lin+0.5)

plot([0 -0.2*cos(3*pi/4)],[2 2-0.2*sin(3*pi/4)],...
    'color','k','linewidth',lin+0.5)
   
%% BCs
ib=0; 

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='tension';
bc(ib).coords=[L 3*L; 0 3*L];
bc(ib).width=aL;
bc(ib).arrowProp=arrowProp;
bc(ib).numObj=np+2;
bc(ib).shift=0;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='pinnedLineFree';
bc(ib).coords=[0 0;L 0];
bc(ib).width=wid;
bc(ib).numObj=np;
bc(ib).shift=0.05;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='partialLine';
bc(ib).coords=[-L 2*L; -L L];
bc(ib).width=[wid wid];
bc(ib).numObj=[np 15];
bc(ib).idxF=3;
bc(ib).idxR=[2 4];
bc(ib).idxP=[1 5];
bc(ib).shift=0.01;

ib=ib+1;
bc(ib)=obj2Plot;
bc(ib).type='bc';
bc(ib).subType='partialLine';
bc(ib).coords=[2*L L; 2*L 2*L];
bc(ib).width=[wid wid];
bc(ib).numObj=[np 15];
bc(ib).idxF=3;
bc(ib).idxR=[2 4];
bc(ib).idxP=[1 5];
bc(ib).shift=0.01;

plotObj(bc)

%% Dimensions
ib=0; 

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[0 2*L+3*wid; L 2*L+3*wid];
dim(ib).width=tW;
dim(ib).txtWid=tW;
dim(ib).arrowProp=arrowProp;
dim(ib).str='$$L$$';

ib=ib+1;
dim(ib)=obj2Plot;
dim(ib).type='dimension';
dim(ib).coords=[-3*wid L; -3*wid 2*L];
dim(ib).width=tW;
dim(ib).txtWid=tW;
dim(ib).arrowProp=arrowProp;
dim(ib).str='$$L$$';

plotObj(dim)

%% Arrows
ib=0;
ib=ib+1;
arrows(ib)=obj2Plot;
arrows(ib).type='arrows';
arrows(ib).subType='axis';
arrows(ib).coords=[-L 0];
arrows(ib).width = 0.5;
arrows(ib).arrowProp=arrowProp;
plotObj(arrows)

%% Text
text(-1.5*wid,3*L,'$$A$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(L+1.5*wid,3*L,'$$B$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(2*L-wid,2*L+wid,'$$C$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(2*L-wid,L-1.5*wid,'$$D$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(L+1.5*wid,wid,'$$E$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(-1.5*wid,wid,'$$F$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(-L+wid,L-1.5*wid,'$$G$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(-L+wid,2*L+wid,'$$H$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(0.825,0.975,'$$a_0$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(1-0.825,3-0.925,'$$a_0$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(-L+3*wid,-wid,'$$x$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')
text(-L+wid,3*wid,'$$y$$','FontSize',font,...
    'HorizontalAlignment','center','VerticalAlignment','mid','Interpreter','latex')


