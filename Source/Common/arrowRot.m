function arrowRot(cen,rad,angs,arrowProp,lin,col,sty)
%% Plot rotational arrow
if nargin<4
    arrowProp=[20 0.05 0.03];
    lin=1; col='k'; sty='-';                
elseif nargin<5
    lin=1; col='k'; sty='-';    
elseif nargin<6
    col='k';   sty='-';    
elseif nargin<7
    sty='-';    
end
hold on

%%  Plot Arc
[x,y,angs]=arc(cen,rad,angs,1,0,lin,col,'w',sty,1);

%% Arrow head
% Angle of 1st point
arrWid=3*arrowProp(2)/4;   
angP=(arrWid/rad)*180/pi; 
if angs(1)>angs(2)
    ang1=angs(2)+angP;
else
    ang1=angs(2)-angP;
end
% Points
p1=[cen(1)+rad*cosd(ang1) cen(2)+rad*sind(ang1)]; 
p2=[x(end) y(end)];
ang=ang2pnt(p1,p2,'r');
% Plot head
arrowHead(p2,ang,arrowProp,lin,col);
end