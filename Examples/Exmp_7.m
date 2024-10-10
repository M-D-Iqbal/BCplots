clear; clc; close all;

%% Data
width=0.075; nL=4; lin=1.25;
arrowProp=[20 0.05 0.03];

%% Profile
p=patch([0 0.5 1 0.5],[0.5 0 0.5 1],'w'); p.LineWidth=1.5;

%% Objects
% Roller point
roller([0,0.5],width,-45,nL,0.01,lin,'k')
% Fixed point
pinned([1,0.5],width,135,nL,0.01,lin,'k','-',0)
% Clamped points
clamped([0.5 0],width,0,nL,0.01,lin,'k','-')
fixed([0.5 1],width,180,nL,0.01,lin,'k','-')
% Forces
tension([0 0.5],[0.5 0],width*2,-45,7,width*2,arrowProp,lin,'k','-')
tension([1 0.5],[0.5 1],width*2,0,7,width*2,arrowProp,lin,'k','-')
compression([0.5 0],[1 0.5],width*2,-45,7,width*2,arrowProp,lin,'k','-')
compression([0.5 1],[0 0.5],width*2,0,7,width*2,arrowProp,lin,'k','-')
% Details
axis equal; axis off;

