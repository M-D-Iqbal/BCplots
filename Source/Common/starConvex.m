function [pnts]=starConvex(n)
th = linspace(-pi, pi, 2*n+1);
xi = (1+rem((1:2*n+1),2)).*cos(th);
yi = (1+rem((1:2*n+1),2)).*sin(th);
pnts=[xi',yi'];
end