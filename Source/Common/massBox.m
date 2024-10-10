function  massBox(p,width,ang,fil,lin,col,filCol,txtCol,str,font)
%% Plot mass box
if nargin<3
    ang=0; fil=1; lin=1; col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<4
    fil=1; lin=1; col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<5
    lin=1; col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<6
    col='k'; filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<7
    filCol='w'; txtCol='k'; str=''; font=12; 
elseif nargin<8
    txtCol='k'; str=''; font=12; 
elseif nargin<9
    str=''; font=12;
elseif nargin<10
    font=12;
end
hold on

%% Plot
rect(p,width,ang,1,fil,lin,col,filCol);
txtPlot(p,str,font,0,txtCol)
end