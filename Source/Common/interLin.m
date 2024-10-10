function S=interLin(line1,line2)

%                 y2             y1         x2          x1
slope = @(line) (line(2,2) - line(1,2))/(line(2,1) - line(1,1));
a1 = slope(line1);
a2 = slope(line2);

%                      y1            x1
intercept = @(line,m) line(1,2) - m*line(1,1);                              % intersection with y-axis
b1 = intercept(line1,a1);
b2 = intercept(line2,a2);

if abs(a1)>1e10                                                             % if line1 is vertical
    xintersect=0.5*(line1(1,1)+line1(2,1));                                 % use average x coordinates of this line
    yintersect = a2*xintersect + b2;                                        % evaluate line2 at this x
elseif abs(a2)>1e10                                                         % if line2 is vertical
    xintersect=0.5*(line2(1,1)+line2(2,1));                                 % use average x coordinates
    yintersect = a1*xintersect + b1;                                        % evaluate line1 at this x
elseif (abs(a1)<1e-9)&&(abs(a2)<1e-9)                                       % both slopes are zero
    xintersect=mean([line1(:,1);line2(:,1)]);
    yintersect=mean([line1(:,2);line2(:,2)]);
else                                                                        % both lines well behaved
    xintersect = (b2-b1)/(a1-a2);                                           % x position
    yintersect = 0.5*((a1*xintersect + b1)+(a1*xintersect + b1));           % average of both lines at x
end
S=[xintersect,yintersect];                                                  % intersection point


% figure
% h = plot(line1(:,1),line1(:,2),'linewidth',2);
% hold all
% h(2) = plot(line2(:,1),line2(:,2),'linewidth',2);
% set(h,'linewidth',2)
% plott(S,'o')
% axis equal
% S


end