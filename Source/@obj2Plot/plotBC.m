function plotBC(obj,i)
%% Data
type=obj.subType;
width=obj.width;
angle=obj.angle;
nP=obj.numObj;
shift=obj.shift;
lin=obj.lin;
col=obj.col;
sty=obj.sty;
arrowProp=obj.arrowProp;
idF=obj.idxF; idR=obj.idxR; idP=obj.idxP;
p1=obj.coords(1,:);
if size(obj.coords,1)==2
    p2=obj.coords(2,:);
end

%% BCs types
nP1=nP(1);
if strcmp(type,'roller')
    roller(p1,width,angle,nP1,shift,lin,col,sty)
elseif strcmp(type,'fixed')
    fixed(p1,width,angle,nP1,shift,lin,col,sty)
elseif strcmp(type,'pin')
    pin(p1,width,lin,col,sty)
elseif strcmp(type,'pinned')
    pinned(p1,width,angle,nP1,shift,lin,col,sty,1)
elseif strcmp(type,'pinnedFree')
    pinned(p1,width,angle,nP1,shift,lin,col,sty,0)
elseif strcmp(type,'clamped')
    clamped(p1,width,angle,nP1,shift,lin,col,sty)
elseif strcmp(type,'clampedLine')
    clampedLine(p1,p2,width,nP1,shift,lin,col,sty)
elseif strcmp(type,'tension')
    tension(p1,p2,width,angle,nP1,shift,arrowProp,lin,col,sty)
elseif strcmp(type,'compression')
    compression(p1,p2,width,angle,nP1,shift,arrowProp,lin,col,sty)
elseif strcmp(type,'rollerLine')
    rollerLine(p1,p2,width,nP,shift,lin,col,sty)
elseif strcmp(type,'fixedLine')
    fixedLine(p1,p2,width,nP,shift,lin,col,sty)
elseif strcmp(type,'pinnedLine')
    pinnedLine(p1,p2,width,nP,shift,lin,col,sty,1)
elseif strcmp(type,'pinnedLineFree')
    pinnedLine(p1,p2,width,nP,shift,lin,col,sty,0)
elseif strcmp(type,'partialLine')
    partialLine(p1,p2,width,nP,idF,idR,idP,shift,lin,col,sty)
else
    fprintf('Subtype of obejct No. %i is not implemented...\n',i);
end
end