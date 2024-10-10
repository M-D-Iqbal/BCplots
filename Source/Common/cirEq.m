function pnt=cirEq(cen,r,xy,str)
if nargin<4
    str='x';
end

syms x y
if strcmp(str,'x')
    sol=solve((xy-cen(1))^2+(y-cen(2))^2==r^2);
    pnt=double(sol);
elseif strcmp(str,'y')
    sol=solve((x-cen(1))^2+(xy-cen(2))^2==r^2);
    pnt=double(sol);
end