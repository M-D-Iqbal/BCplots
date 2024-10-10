function [out,in,sec]=polyShpGen(nP,angS,angE,radU,radL,open,secId,scale,plt)
%% Poly shape generator %%
% nP    : number of points
% angS  : angle of 1st vertex in deg
% angE  : angle of last vertex in deg
% radU  : uper limit of radius
% radL  : lower limit of radius
% open  : open or close (id)
% sec   : requested sector points
% scale : Inner boundary
% Notes : Angle S and E must not be same (or multiple of 360)

%% Data set
if nargin<6
    open=0; secId=0; scale=0; plt=0;
elseif nargin<7
    secId=0; scale=0; plt=0;
elseif nargin<8
    scale=0; plt=0;
elseif nargin<9
    plt=0;
end

%% Data points
rad=radL+(radU-radL).*rand(1,nP);
if angS>angE
    angE=angE+360;
end
ang=linspace(angS,angE,nP);
if abs(angE-angS)==0 || abs(angE-angS)==360
    rad=rad(1:end-1);
    ang=ang(1:end-1);
    nP=nP-1;
end
cosA=cosd(ang); sinA=sind(ang);
x=rad.*cosA; y=rad.*sinA;
pnts=[x;y]';

%% Inner boundary
if scale~=0
    ang_i=ang;
    rad_i=rad.*scale;
    x_i=rad_i.*cosA; y_i=rad_i.*sinA;
    pnts_i=[x_i;y_i]';
else
    pnts_i=[];
    rad_i=[];
    ang_i=[];
end

%% Open close
if open~=0
    if open>nP
        error('Open poly flag is out of bound')
    elseif open<nP && open>0
        idO=[(open+1):nP 1:open];
        pnts=pnts(idO,:);
        if ~isempty(pnts_i)
            pnts_i=pnts_i(idO,:);
        end
    end
    isOpen=1;
else
    pnts(end+1,:)=pnts(1,:);
    if ~isempty(pnts_i)
        pnts_i(end+1,:)=pnts_i(1,:);
    end
    isOpen=0;
end

%% Requested section
if secId~=0 && secId<=nP
    idS=[secId mod(secId,nP)+1];
    pnts_s=pnts(idS,:);
    rad_s=rad(idS);
    ang_s=ang(idS);
    if ~isempty(pnts_i)
        pnts_is=pnts_i(idS,:);
        rad_is=rad_i(idS);
        ang_is=ang(idS);
    else
        pnts_is=[]; rad_is=[]; ang_is=[];
    end
else
    pnts_s=[];
    rad_s=[];
    ang_s=[];
    pnts_is=[];
    rad_is=[];
    ang_is=[];
end

%% Store
% Out
out.coord=pnts;
out.rad=rad;
out.ang=ang;
out.cen=[0 0];
out.isOpen=isOpen;
% In
if scale==0 || scale==1
    in=[];
else
    in.coord=pnts_i;
    in.rad=rad_i;
    in.ang=ang_i;
    in.cen=[0 0];
    in.isOpen=isOpen;

end
% Sec
if secId~=0
    sec.coord=pnts_s;
    sec.rad=rad_s;
    sec.ang=ang_s;
    sec.coord_i=pnts_is;
    sec.rad_i=rad_is;
    sec.ang_i=ang_is;
    sec.cen=[0 0];
else
    sec=[];
end

%% Plots
if plt==1
    pnts=out.coord;
    cx=out.cen(1); cy=out.cen(2);
    % Plot Domain
    figure; hold on
    for iP=1:size(pnts,1)-1
        x1=pnts(iP,1); x2=pnts(iP+1,1);
        y1=pnts(iP,2); y2=pnts(iP+1,2);
        plot([x1 x2],[y1 y2],'-k','LineWidth',1,'HandleVisibility','off')
        plot([cx x1],[cy y1],'--k','LineWidth',0.75,'HandleVisibility','off')
        plot([cx x2],[cy y2],'--k','LineWidth',0.75,'HandleVisibility','off')
        if ~isempty(in)
            x1=in.coord(iP,1); x2=in.coord(iP+1,1);
            y1=in.coord(iP,2); y2=in.coord(iP+1,2);
            plot([x1 x2],[y1 y2],'-k','LineWidth',0.5,'HandleVisibility','off')
        end
    end
    plot(cx,cy,'ok','MarkerFaceColor','w','HandleVisibility','off')
    plot(cx,cy,'+k','MarkerFaceColor','w','HandleVisibility','off')
    plot(pnts(:,1),pnts(:,2),'ok','MarkerFaceColor','w','HandleVisibility','off')
    axis equal
    axis off
end
end
