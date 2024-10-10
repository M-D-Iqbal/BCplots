classdef obj2Plot
    %% Object plots class
    % plot boundary conditions
    % plot dimensions
    % plot arrows
    % plot components
    properties
        % General
        type                % 'bc'/'boundary conditions', 'dim'/'dimensions', 'arrow'/'arrows',
        subType             % bc   : 'roller', 'fixed', 'line', 'clamped', 'traction'
        % comp : 'massC', massB, spring, dashpot
        % arrow: 'pla'

        coords              % start and end coords [x1 y1; x2 y2;] (max to min) or only start coordinates in case of single object
        angle=0;            % angle of object in degrees

        % Bcs
        numObj=4;           % number of roller/fixed objects if not one e.g. over whole edge length
        idxF=[];            % indices of numObj for partially fixed bc 'Line'
        idxR=[];            % indices of numObj for partially roller bc 'Line'
        idxP=[];            % indices of numObj for partially pinned bc 'Line'

        % Arrows
        arrowProp=[20,...   % angle of tip
            0.05,...  % width of tip
            0.03];    % width of base

        % Dimensions
        str='';             % string of text for dimension, use $$ text $$ for LateX interpreter

        % Styles
        width=0.1;          % width of objects (roller, fixed, arrows length, text space)
        shift=0;            % shift the objects
        txtWid=0;           % text width for dimensions
        font=16;            % font size of text
        lin=1;              % line width of objects
        col='k';            % matlab's definition of color
        sty='-';            % styles
        filCol='w';         % fill color
        txtCol='k';         % txt color in case of fill
    end

    methods
        plotObj(obj)
        plotComp(obj,i)
        plotBc(obj,i)
        plotDim(obj,i)
        plotArrow(obj,i)
    end

end