function [p3,p4]=paraLin(p1,p2,d,t1,t2)
%% Create paralled line
% d = shift
% t1= % distance from p1
% t2= % distance from p2
if nargin<4
    t1=0; t2=0;
end
if nargin<5
    t2=0;
end
x1=p1(1); y1=p1(2);
x2=p2(1); y2=p2(2);
r=sqrt((x2-x1)^2+(y2-y1)^2);
dx=(y1-y2)*d/r;
dy=(x2-x1)*d/r;
x3=x1+dx;   y3=y1+dy;
x4=x2+dx;   y4=y2+dy;
p3=[x3+t1*(x4-x3),y3+t1*(y4-y3)];
p4=[x3+t2*(x4-x3),y3+t2*(y4-y3)];
end
