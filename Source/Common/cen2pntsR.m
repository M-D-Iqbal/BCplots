function [cen,rad]=cen2pntsR(p1,p2,r)
% Get the center(s) of circle %
%  with p1, p2, with radius r %

%%  Data
x1=p1(1); y1=p1(2);
x2=p2(1); y2=p2(2);
rad=r;    flag=true;

%% Output
while flag
    cenR=robMet(x1,y1,x2,y2,rad);
    if ~isreal(cenR)
        rad=rad+r/10;
    else
        cen=cenR;
        flag=false;
    end
end
end

%% Rhombus method
function cenR=robMet(x1,y1,x2,y2,r)
% Data
x3=x1-x2;
y3=y1-y2;
xa=-0.5*x3; ya=-0.5*y3;
x0=x1+xa;   y0=y1+ya;
a=sqrt(xa^2+ya^2);
b=sqrt(r^2-a^2);
% Center
cenR(1,1)=x0+b*ya/a;
cenR(1,2)=y0-b*xa/a;
cenR(2,1)=x0-b*ya/a;
cenR(2,2)=y0+b*xa/a;
end

%% Circle Equation
function cenC=cirEq(x1,y1,x2,y2,r)
x3=x1-x2;
y3=y1-y2;
d=x1^2+y1^2-x2^2-y2^2;
e=d/(2*y3)-y1;
% Quadratic equation
a=(x3^2+y3^2)/y3^2;
b=-2*x1-2*e*x3/y3;
c=x1^2+e^2-r^2;
% Center
cenC(1,1)=(-b+sqrt(b^2-4*a*c))/(2*a);
cenC(1,2)=-x3*cenC(1,1)/y3+d/(2*y3);
cenC(2,1)=(-b-sqrt(b^2-4*a*c))/(2*a);
cenC(2,2)=-x3*cenC(2,1)/y3+d/(2*y3);
end
