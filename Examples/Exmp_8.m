clear; clc; close all;

%% Data
width=0.075; lin=1.25;

%% Profile
p=patch([0 1 1 0],[0 0 1 1],'w'); p.LineWidth=1.5;

%% Objects
% Fixed line
fixedLine([0 0],[1 0],width,[7 25],-0.01,lin,'k','-')
% Roller line
rollerLine([1 0],[1 1],width,[7 25],-0.01,lin,'k','-')
% Partial line
idP=[1 7]; idF=4; idR=[2 3 5 6]; 
partialLine([1 1],[0 1],width,7,idF,idR,idP,-0.01,lin,'k','-')
% Pinned line
pinnedLine([0 1],[0 0],width,[7 25],-0.01,lin,'k','-')
% Clamped line
clampedLine([0 0],[1 1],width/2,25,-0.01,lin,'k','-')
clampedLine([1 1],[0 0],width/2,25,-0.01,lin,'k','-')
% clamped line
clampedLine([1 0],[0 1],width/2,25,-0.01,lin,'k','-')
clampedLine([0 1],[1 0],width/2,25,-0.01,lin,'k','-')
% Details
axis equal; axis off;



