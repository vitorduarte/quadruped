function [x,fval,exitflag,output,population,score] = codigo_online_training(nvars,lb,ub,PopulationSize_Data,CrossoverFraction_Data,InitialPopulationMatrix_Data,InitialScoresMatrix_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('gamultiobj');
%% Modify options setting
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'CrossoverFraction', CrossoverFraction_Data);
options = optimoptions(options,'InitialPopulationMatrix', InitialPopulationMatrix_Data);
options = optimoptions(options,'InitialScoresMatrix', InitialScoresMatrix_Data);
options = optimoptions(options,'CrossoverFcn', @crossoverscattered);
options = optimoptions(options,'MutationFcn', @mutationadaptfeasible);
options = optimoptions(options,'Display', 'final');
options = optimoptions(options,'PlotFcn', {  @gaplotdistance @gaplotgenealogy @gaplotscorediversity @gaplotselection @gaplotstopping @gaplotpareto @gaplotparetodistance @gaplotrankhist @gaplotspread });
[x,fval,exitflag,output,population,score] = ...
gamultiobj(@online_training,nvars,[],[],[],[],lb,ub,[],options);
