function pin(p,width,lin,col,sty)
%% Plot pin circle
if nargin<3
    lin=1; col='k'; sty='-';
elseif nargin<4
    col='k'; sty='-';
elseif nargin<5
    sty='-';
end
hold on

%% Plot
r=width/2;
arc(p,r,[0 360],1,1,lin,col,'w',sty,1);
arc(p,r/5,[0 360],1,1,lin,col,'w',sty,1);

end