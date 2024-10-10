function [x,y,angs]=arc(cen,rad,angs,plt,fil,lin,col,filCol,sty,step)
%% Plot circle or arc
if nargin<3
    angs=[0 360]; plt=0; fil=0; lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<4
    plt=0; fil=0; lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<5
    fil=1; lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<6
    lin=1; col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<7
    col='k'; filCol='w'; sty='-';  step=0.1;
elseif nargin<8
    filCol='w'; sty='-';  step=0.1;
elseif nargin<9
    sty='-';  step=0.1;
elseif nargin<10
    step=0.1;
end

%% Angles
%  Angles must be in 0-360 format
%  Angle(3)=0: small arc between two angles
%  Angle(3)=1: large arc between two angles
if numel(angs)==2; angs(3)=0; end
if angs(3)==0 && angs(1)>angs(2)
    step=-step;
elseif angs(3)==1 && angs(1)>angs(2)
    angs(1)=angs(1)-360;
elseif angs(3)==1 && angs(1)<angs(2)
    angs(2)=angs(2)-360;
    step=-step;
end
ang=angs(1):step:angs(2);

%% Plot
x=cen(1)+rad*cosd(ang);
y=cen(2)+rad*sind(ang);
if plt==1
    if fil==1
         xC=[x cen(1)]; yC=[y cen(2)];
        f=fill(xC,yC,col,'LineWidth',lin,'HandleVisibility','off');
        f.EdgeAlpha=0;
        f.EdgeColor=col;
        f.FaceColor=filCol;
        f.FaceAlpha=1;
    end
    plot(x,y,sty,'Color',col,'LineWidth',lin,'HandleVisibility','off')
end
end
