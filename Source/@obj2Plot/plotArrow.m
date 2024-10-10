function plotArrow(obj,~)
%% Data
type=obj.subType;
width=obj.width(1);
angle=obj.angle;
lin=obj.lin;
col=obj.col;
sty=obj.sty;
arrowProp=obj.arrowProp;
p1=obj.coords(1,:);
if size(obj.coords,1)==2
    p2=obj.coords(2,:);
end

%% Plots
if strcmp(type,'axis')
    arrowAxis(p1,width,angle(1),arrowProp,lin,col,sty)
elseif strcmp(type,'rotArrow')
    arrowRot(p1,width,angle,arrowProp,lin,col,sty)
else     
    if size(obj.coords,1)==1
        ang=obj.angle(1);
        p2=[p1(1)+width*cosd(ang) p1(2)+width*sind(ang)];
    end
    % Arrow plot
    arrow2P(p1,p2,arrowProp,lin,col,sty);
end


