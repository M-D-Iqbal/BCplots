clear; clc; close all;

addpath(genpath('../Source'))

%% Example 
figure;
L=2; H=1;
arrowProp=[20 0.075 0.05];

%% Profile
pgon=polyshape([0 L L 0],[0 0 H H]);
p=plot(pgon); p.FaceColor=[0.9 0.9 0.9]; p.FaceAlpha=1;
set(p,'LineWidth',1);
axis equal; axis off;

%% objects
ib=0;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='roller';
objs(ib).coords=[L H];
objs(ib).angle=90;
objs(ib).numObj=5;
objs(ib).shift=0.05;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='fixed';
objs(ib).coords=[0 H];
objs(ib).angle=-90;
objs(ib).numObj=5;
objs(ib).shift=0.05;
 
ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='rollerLine';
objs(ib).coords=[0 0.7*H; 0 0.2*H; ];
objs(ib).numObj=[4 14];
objs(ib).shift=0.05;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='fixedLine';
objs(ib).coords=[L 0.2*H; L 0.7*H];
objs(ib).numObj=[4 14];
objs(ib).shift=0.05;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='partialLine';
objs(ib).coords=[0 0; L 0];
objs(ib).idxF=[1 5 10];
objs(ib).idxR=setdiff(1:10,[1,5,10]);
objs(ib).numObj=10;
objs(ib).shift=0.05;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='bc';
objs(ib).subType='tension';
objs(ib).coords=[L H; 0 H];
objs(ib).width=0.15;
objs(ib).numObj=15;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='arrow';
objs(ib).subType='axis';
objs(ib).coords=[0 0];
objs(ib).angle=0;
objs(ib).width=0.225;
objs(ib).arrowProp=arrowProp;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='dimension';
objs(ib).coords=[0 0; L 0];
objs(ib).shift=-0.25;
objs(ib).txtWid=0.15;
objs(ib).str='$$L$$';
objs(ib).width=0.1;
objs(ib).arrowProp=arrowProp;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='dimension';
objs(ib).coords=[0 0; 0 H];
objs(ib).shift=0.25;
objs(ib).txtWid=0.15;
objs(ib).str='$$H$$';
objs(ib).width=0.1;
objs(ib).arrowProp=arrowProp;

ib=ib+1;
objs(ib)=obj2Plot;
objs(ib).type='dimension';
objs(ib).coords=[0 H; L 0];
objs(ib).shift=0;
objs(ib).txtWid=0.15;
objs(ib).str='$$D$$';
objs(ib).width=0.05;
objs(ib).arrowProp=arrowProp;

plotObj(objs)

