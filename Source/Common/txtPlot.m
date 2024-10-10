function txtPlot(p,str,fontS,ang,col)
if nargin<3
    fontS=14; ang=0; col='k';
elseif nargin<4
    ang=0; col='k';
elseif nargin<5
    col='k';
end
text(p(1),p(2),str,...
    FontSize=fontS,Interpreter="latex",...
    HorizontalAlignment="center",VerticalAlignment="middle",...
    Rotation=ang,color=col)
end