function ang=ang2pnt(p1,p2,str)
if nargin<3
    str='d';
end
if strcmp(str,'r')
    ang=mod(atan2((p2(2)-p1(2)),(p2(1)-p1(1))),2*pi);
else
    ang=mod(atan2d((p2(2)-p1(2)),(p2(1)-p1(1))),360);
end
end