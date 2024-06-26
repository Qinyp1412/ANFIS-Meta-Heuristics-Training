
clc;
clear;
close all;

%% Load Data

data=LoadData();

%% Generate Basic FIS

fis=CreateInitialFIS(data,10);

% %% Train Using PSO or GA
% 
% Options = {'Genetic Algorithm', 'Particl Swarm Optimization'};
% 
% [Selection, Ok] = listdlg('PromptString', 'Select training method for ANFIS:', ...
%                           'SelectionMode', 'single', ...
%                           'ListString', Options);
% 
% pause(0.01);
%           
% if Ok==0
%     return;
% end
% 
% switch Selection
%     case 1, fis=TrainAnfisUsingGA(fis,data);        
%     case 2, fis=TrainAnfisUsingPSO(fis,data);        
% end

%% Results

% Train Data
TrainOutputs=evalfis(fis, data.TrainInputs);
PlotResults(data.TrainTargets,TrainOutputs,'Train Data');

% Test Data
TestOutputs=evalfis(fis, data.TestInput);
PlotResults(data.TestTargets,TestOutputs,'Test Data');

% All Data
Outputs=evalfis(fis, data.Inputs);
PlotResults(data.Targets,Outputs,'All data');
