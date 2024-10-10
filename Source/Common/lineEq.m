function [mb,abc,L]=lineEq(p1,p2)
% coords= [x1 y1
%          x2 y2];
%% Line
x1=p1(1);x2=p2(1);
y1=p1(2);y2=p2(2);
% y=mx+b
m=(y2-y1)/(x2-x1);
b=y1-m*x1;
mb=[m b];
% ax+by+c=0
a=y1-y2; b=x2-x1; c=x1*y2-x2*y1;
abc=[a b c];
% Length
L=sqrt((x2-x1)^2+(y2-y1)^2);
