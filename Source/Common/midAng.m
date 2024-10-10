function [angD,angR]=midAng(a1,a2,str)
%% Calculate the middle angle of 2 angles
% a1:  1st angle
% a2:  2nd angle
% str: 'd' or 'r' for degree and radians

%% Convert
if strcmp(str,'d')
    a1=a1*pi/180;
    a2=a2*pi/180;
end
%% Calculate
x=cos(a1)+cos(a2);
y=sin(a1)+sin(a2);
angR=atan2(y/2,x/2);
angD=angR*180/pi;
end
