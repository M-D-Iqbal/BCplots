function plotObj(objects)
%% Extract objects
idComp=false(numel(objects),1);
idBc=idComp; idDim=idComp; idArr=idComp;
for i=1:numel(objects)
    obj=objects(i);
    if strcmp(obj.type,'comp') || strcmp(obj.type,'sys')
        idComp(i)=true;
    elseif strcmp(obj.type,'bc')
        idBc(i)=true;
    elseif strcmp(obj.type,'dim') || strcmp(obj.type,'dimension')
        idDim(i)=true;
    elseif strcmp(obj.type,'arrow') || strcmp(obj.type,'arrows')
        idArr(i)=true;
    else
        fprintf('Type of obejct No. %i is not implemented...\n',i);
    end
end

%%  First Components
comp=find(idComp==1);
for i=1:numel(comp)
    obj=objects(comp(i));
    hold on
    plotComp(obj,comp(i));
end

%%  Second Bcs
bc=find(idBc==1);
for i=1:numel(bc)
    obj=objects(bc(i));
    hold on
    plotBC(obj,bc(i));
end

%%  Third Dimensions
dim=find(idDim==1);
for i=1:numel(dim)
    obj=objects(dim(i));
    hold on
    plotDim(obj,dim(i));
end

%%  Fourth Arrows
arr=find(idArr==1);
for i=1:numel(arr)
    obj=objects(arr(i));
    hold on
    plotArrow(obj,arr(i));
end
end