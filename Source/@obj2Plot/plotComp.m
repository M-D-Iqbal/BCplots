function plotComp(obj,i)
%% Data
type=obj.subType;
width=obj.width;
angle=obj.angle;
nP=obj.numObj(1);
lin=obj.lin;
col=obj.col;
filCol=obj.filCol;         
txtCol=obj.txtCol;         
str=obj.str;
font=obj.font;
p1=obj.coords(1,:);
if size(obj.coords,1)==2
    p2=obj.coords(2,:);
end

%% Plot
% Spring
if strcmp(type,'spring')
    spring(p1,p2,width(1),nP,lin,col);
    % Dashpot
elseif strcmp(type,'dashpot')
    dashPot(p1,p2,width(1),lin,col);
    % Mass (box)
elseif strcmp(type,'massBox')
    massBox(p1,width,angle,1,lin,col,filCol,txtCol,str,font)
    % Mass (circle)
elseif strcmp(type,'massCirc')
    massCirc(p1,width(1),1,lin,col,filCol,txtCol,str,font)
else
    fprintf('Subtype of obejct No. %i is not implemented...\n',i);
end
end



