function spring(p1,p2,R,nP,lin,col)
%% Plot helical spring 
%  Online source (mathworks)
if nargin<6 
    lin=1; col='k'; 
elseif nargin<7 
    col='k';
end
hold on

%% Plot
[spr.spr0_x, spr.spr0_y, spr.spr0_len]=sprInit(R,nP);
[x,y]=getSpr(spr, p1, p2);
plot(x,y,'-','Color',col,LineWidth=lin)

end

%% Initialize spring
function [x, y, len] = sprInit(R, n)
r = 0.7 * R;
step = 2 * (R - r);

ang_R = linspace(3 * pi / 2, pi / 2, 20);
ang_r = linspace(pi / 2, -pi / 2, 20);

x = [];
y = [];

c_R = 0;

for i = 1 : n

    c_R = c_R + step;
    R_x = R * cos(ang_R);
    R_y = c_R + R * sin(ang_R);

    c_r = c_R + R - r;
    r_x = R * cos(ang_r);
    r_y = c_r + r * sin(ang_r);

    x = [x, R_x, r_x];
    y = [y, R_y, r_y];

    if i == n
        c_R = c_R + step;
        R_x = R * cos(ang_R);
        R_y = c_R + R * sin(ang_R);

        % Add straight lines at the spring's two ends
        x = [0, x, R_x, 0];
        y = [y(1) - R, y, R_y, y(end) + 3 * R];

        % Move the spring's start point to origin
        y = y - min(y);
        break;
    end

end
len = abs(y(end) - y(1));
end

%% Get spring
function [x, y] = getSpr(spr, pt1, pt2)
% Scale
scale = sqrt((pt1(1) - pt2(1)) ^ 2 + (pt1(2) - pt2(2)) ^ 2) / spr.spr0_len;
x = spr.spr0_x;
y = spr.spr0_y * scale;
[theta, r] = cart2pol(x, y);

% Rotate
alpha = pi / 2 - atan((pt2(2) - pt1(2)) / (pt2(1) - pt1(1)));
if pt1(1) > pt2(1)
    alpha = alpha + pi;
end
theta = theta - alpha;
[x, y] = pol2cart(theta, r);

% Move
x = x + pt1(1);
y = y + pt1(2);
end