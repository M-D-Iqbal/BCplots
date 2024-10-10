function massCirc(p,width,fil,lin,col,filCol,txtCol,str,font)
%% Plot mass circle
if nargin<3
    fil=1; lin=1; col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<4
    lin=1; col='k'; filCol='w'; txtCol='k'; str=''; font=12;  
elseif nargin<5
    col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<6
    filCol='w'; txtCol='k'; str=''; font=12;  
elseif nargin<7
    txtCol='k'; str=''; font=12;  
elseif nargin<8
    str=''; font=12;
elseif nargin<9
    font=12;
end
hold on

%% Plot
arc(p,width/2,[0 360],1,fil,lin,col,filCol);
txtPlot(p,str,font,0,txtCol);

end