function pntsN=rotPnts(pnts,p,ang)
%% Rotate set of points %%
%  ang: angle of rotation in degree
%  p:   pivot point

%% Rotate
Xc = p(1);Yc = p(2);
X = pnts(:,1)';Y = pnts(:,2)';
Xrot = (X-Xc)*cosd(ang) + (Y-Yc)*sind(ang) + Xc;
Yrot = -(X-Xc)*sind(ang) + (Y-Yc)*cosd(ang) + Yc;
pntsN(:,1)=Xrot'; pntsN(:,2)=Yrot';

end