function dashPot(p1,p2,width,lin,col)
%% Plot dashpot
if nargin<4
    lin=1; col='k';
elseif nargin<5
    col='k';
end
hold on

%% Plot
p3=[(p1(1)+p2(1))/2 (p1(2)+p2(2))/2];
[~,~,L]=lineEq(p1,p3);
[p4,p5]=paraLin(p1,p3,3*width/4,1-width/2/L,1+width/2/L);
[p6,p7]=paraLin(p1,p3,-3*width/4,1-width/2/L,1+width/2/L);
pnts=[p5; p4; p6; p7];
p8=[(p4(1)+p6(1))/2 (p4(2)+p6(2))/2];
[p9,p10]=perLin(p2,p3,p3,width/2);
p11=[(p9(1)+p10(1))/2 (p9(2)+p10(2))/2];
plot(pnts(:,1),pnts(:,2),'Color',col,LineWidth=lin)
plot([p1(1) p8(1)],[p1(2) p8(2)],'Color',col,LineWidth=lin)
plot([p9(1) p10(1)],[p9(2) p10(2)],'Color',col,LineWidth=lin)
plot([p2(1) p11(1)],[p2(2) p11(2)],'Color',col,LineWidth=lin)

end