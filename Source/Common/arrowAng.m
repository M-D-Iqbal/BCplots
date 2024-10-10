function arrowAng(p1,ang,Len,arrowProp,lin,col,sty)    
%% Plot arrow at an angle
if nargin<4
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
p2=[p1(1)+Len*cosd(ang) p1(2)+Len*sind(ang)];
arrow2P(p1,p2,arrowProp,lin,col,sty)

end