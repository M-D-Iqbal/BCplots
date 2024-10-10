function [p4,p5]=perLin(p1,p2,p3,d)
%% Find the perpendicular line
%  p1-p2: points of line
%  p3   : pass point of perpendicular line
%  d    : length of perpendicular line on each side

%% Calculations
[mb,~,~]=lineEq(p1,p2); m=mb(1);
% Horizontal line
if m==0
    p4(1)=p3(1);
    p4(2)=p3(2)+d;
    p5(1)=p3(1);
    p5(2)=p3(2)-d;
    % Vertical line
elseif isinf(m)
    p4(1)=p3(1)+d;
    p4(2)=p3(2);
    p5(1)=p3(1)-d;
    p5(2)=p3(2);
else % Line at angle
    mp=-1/m;
    bp=(p3(2)-mp*p3(1));
    p4(1)=p3(1)+d/sqrt(1+mp^2);
    p4(2)=mp*p4(1)+bp;
    p5(1)=p3(1)-d/sqrt(1+mp^2);
    p5(2)=mp*p5(1)+bp;
end
