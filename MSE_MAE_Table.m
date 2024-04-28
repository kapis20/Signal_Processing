function [CleanTable] = MSE_MAE_Table(DataCell)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Find columns with at least one non-empty element
EmptyCols = any(cellfun(@isempty, DataCell),1);
% Use logic ~ to find nonempty cells
   NotemptyCols = find(~EmptyCols)
%Rearrange cells by getting rid of empty columns 
CLeanedMSE1 = DataCell(:,NotemptyCols);

%Create table 
NamesCols = {'M = 1','M = 3','M = 5','M = 7','M = 9', 'M = 11', 'M = 13', 'M = 15', 'M = 17', 'M = 19'};
RowNames = {'N = 1', 'N = 2','N = 3', 'N = 4', 'N = 5'};
CleanTable = cell2table(CLeanedMSE1,"VariableNames",NamesCols,"RowNames",RowNames)


end

