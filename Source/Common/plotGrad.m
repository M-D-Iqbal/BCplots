function [f,gradFun]=plotGrad(x,y,gradFun,n,norm,map,faceAlpha)
%% Plot surface grading given by a function %%
%  x: [minX maxX]
%  y: [minY maxY]
%  f: function handle @f(x,y) ....
%  n: division of surface

%% Data
if nargin<4
    n=10; norm=0; map='default'; faceAlpha=1;
elseif nargin<5
    norm=0; map='default'; faceAlpha=1;
elseif nargin<6
    map='default'; faceAlpha=1;
elseif nargin<7
    faceAlpha=1;
end
xP=linspace(x(1),x(2),n);
yP=linspace(y(1),y(2),n);
% Grade Fun
gradFun = setFuncXY(gradFun);

%% Plot
[X,Y]=meshgrid(xP,yP);
dt=delaunayTriangulation(X(:), Y(:));
X=dt.Points(:,1); Y=dt.Points(:,2);
Z=gradFun(X,Y);
if norm==1
    Zmax=max(Z);
    Zmin=min(Z);
    Znorm=max([abs(Zmax) abs(Zmin)]);
    Z=-Z./Znorm;
end
f=trisurf(dt.ConnectivityList,X,Y,Z);

%% Finding type of grading
    function [func] = setFuncXY(func)
        func=func2str(func);
        idclose=find(func==')');
        idclose=idclose(1);
        func=str2func(strcat('@(x,y)',func(idclose+1:end)));
    end
% Details
f.FaceAlpha=faceAlpha;
colormap(map); shading interp;
set(gca,'SortMethod','childorder');
end