function arrowAxis(p1,Len,ang,arrowProp,lin,col,sty)
%% Plot arrow at an angle
if nargin<3
    ang=0;
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';  
elseif nargin<4
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';  
elseif nargin<5
    lin=1; col='k'; sty='-';  
elseif nargin<6
    col='k'; sty='-';  
elseif nargin<7
    sty='-';  
end
hold on

%% Plot
%  new points
p2=[p1(1)+Len p1(2)]; p3=[p1(1) p1(2)+Len];
%  rotate points
pntsN=rotPnts([p2;p3],p1,ang);
p2=pntsN(1,:); p3=pntsN(2,:);
%  arrows
arrow2P(p1,p2,arrowProp,lin,col,sty)
arrow2P(p1,p3,arrowProp,lin,col,sty)

end