function plotDim(obj,~)
%% Data
p1=obj.coords(1,:); 
p2=obj.coords(2,:);
width=obj.width(1);
shift=obj.shift;
texWidth=obj.txtWid;
str=obj.str;
font=obj.font;
arrowProp=obj.arrowProp;
lin=obj.lin;
col=obj.col;
sty=obj.sty;

%% Plot
dimension(p1,p2,width,shift,texWidth,str,font,arrowProp,lin,col,sty)
end



