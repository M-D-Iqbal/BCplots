clear; clc; close all;

%% Data
x=[0 3]; y=[0 1];
n=200; map='winter';

%% Grading Function
f=@(x,y)(1+(25-1)*x.^2).*(x<=1)+...
    (((7+25)/2)+((7-25)/2)*tanh(100*(x-1.15))).*(x>1);

%% Plot
plotGrad(x,y,f,n);
colormap(map)
shading interp












