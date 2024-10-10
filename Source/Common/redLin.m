function [p3,p4]=redLin(p1,p2,r1,r2)
% Reduce the line segment 
% r1: reduction on start point
% r2: reduction on end point

%% Reduction
dx=p2(1)-p1(1); dy=p2(2)-p1(2); d=sqrt(dx^2+dy^2);
% At start point
p3(1)=p1(1)+r1*dx/d; p3(2)=p1(2)+r1*dy/d;
% At end point
p4(1)=p2(1)-r2*dx/d; p4(2)=p2(2)-r2*dy/d;
end