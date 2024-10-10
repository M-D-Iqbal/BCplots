function arrow2P(p1,p2,arrowProp,lin,col,sty)
%% Plot arrow between 2 points
if nargin<3
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';  
elseif nargin<4
    lin=1; col='k'; sty='-';  
elseif nargin<5
    col='k'; sty='-';  
elseif nargin<6
    sty='-';  
end
hold on

%% Line
% Angle
ang=atan2((p2(2)-p1(2)),(p2(1)-p1(1)));
% Plot Line
[p1,p2]=paraLin(p1,p2,0,0,0.99);
plot([p1(1) p2(1)],[p1(2) p2(2)],sty,'color',col,'LineWidth',lin,'HandleVisibility','off')

%% Arrow head
arrowHead(p2,ang,arrowProp,lin,col)

end
