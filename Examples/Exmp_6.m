clear; clc; close all;

%% Test
L=1; H=0.5;
font=16;
eps=0.15;
arrowProp=[20 0.06 0.04];

%% System
hold on;
plot([0 2*L],[H H],'-k',LineWidth=2)
plot([0 2*L],[-H -H],'-k',LineWidth=2)

%% objects
ib=0;

% Bc
ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='pinned';
objs(ib).coords=[0 H];
objs(ib).angle=-90;
objs(ib).width=0.125;
objs(ib).shift=0.025;
objs(ib).numObj=4;
objs(ib).lin=1;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='roller';
objs(ib).coords=[0 -H-0.001];
objs(ib).angle=0;
objs(ib).width=0.1;
objs(ib).shift=0.025;
objs(ib).numObj=4;
objs(ib).lin=1;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='pinnedFree';
objs(ib).coords=[2*L -H];
objs(ib).angle=45;
objs(ib).width=0.125;
objs(ib).shift=0.025;
objs(ib).numObj=4;
objs(ib).lin=1;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='pin';
objs(ib).coords=[L -H];
objs(ib).width=0.075;
objs(ib).lin=1;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='pinnedFree';
objs(ib).coords=[2*L H];
objs(ib).angle=90;
objs(ib).width=0.125;
objs(ib).shift=0.025;
objs(ib).numObj=4;
objs(ib).lin=1;

% Components
ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='sys';
objs(ib).subType='spring';
objs(ib).coords=[L -H; 2*L H];
objs(ib).shift=0.1;
objs(ib).width=0.1;
objs(ib).numObj=20;
objs(ib).lin=1.5;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='sys';
objs(ib).subType='dashpot';
objs(ib).coords=[L -H; 0 H];
objs(ib).width=0.1;
objs(ib).lin=1.5;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='comp';
objs(ib).subType='massBox';
objs(ib).coords=[L H];
objs(ib).angle=45;
objs(ib).width=0.225;
objs(ib).str='$m_1$';
objs(ib).col='k';
objs(ib).filCol='b';
objs(ib).txtCol='w';

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='comp';
objs(ib).subType='massCirc';
objs(ib).coords=[L/2 -H];
objs(ib).width=0.2;
objs(ib).str='$m_2$';
objs(ib).col='k';
objs(ib).filCol='r';
objs(ib).txtCol='w';

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='comp';
objs(ib).subType='massCirc';
objs(ib).coords=[3*L/2 -H];
objs(ib).width=0.2;
objs(ib).str='$m_3$';
objs(ib).col='k';
objs(ib).filCol='r';
objs(ib).txtCol='w';

% Dimensions
ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='dim';
objs(ib).coords=[0 H; L H];
objs(ib).width=0.1;
objs(ib).txtWid=0.15;
objs(ib).shift=0.2;
objs(ib).str='$L$';
objs(ib).arrowProp=arrowProp;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='dim';
objs(ib).coords=[L H; 2*L H];
objs(ib).width=0.1;
objs(ib).txtWid=0.15;
objs(ib).shift=0.2;
objs(ib).str='$L$';
objs(ib).arrowProp=arrowProp;

% Axis
ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='arrow';
objs(ib).subType='axis';
objs(ib).coords=[0 0];
objs(ib).width=0.2;
objs(ib).angle=90;
objs(ib).arrowProp=arrowProp;

plotObj(objs)

%% Arrows
% wt
plot([2*L+0.2 2*L+0.3],[H H],'-k')
arrow2P([2*L+0.25 H],[2*L+0.25 H-0.2],arrowProp)

%% Text
text(7*L/4,-H/4,'$k$','Interpreter','latex','HorizontalAlignment','center','FontSize',font)
% Arrows
text(0.25,-eps/2,'$x$','Interpreter','latex','HorizontalAlignment','center','FontSize',font)
text(eps,-0.2-eps/2,'$w(x)$','Interpreter','latex','HorizontalAlignment','center','FontSize',font)
text(2*L+0.25,H-0.25,'$w_{k}$','Interpreter','latex','HorizontalAlignment','center','FontSize',font)

%% Details
axis equal; axis off;


