%   PCA.m
%   This program visualizes Principal Component Analysis for terrestrial 
%   samples and lunar mare basalts. 
%   December, 2016.
%   Last Modified: December 23, 2016.
%   written by:Yaray Ku
%% read data
global LData TData title
% terrestrial samples
filename = 'Petros.csv';
TData = sortgeochem(filename);
% screen the data
TData(:,1:2) = []; % the sample number 
TData(:,3:4) = []; % FeO and Fe2O3 would be corrected in FeO* term
TData(:,11) = []; % Na2O+K2O shouldn't be analysis since there are Na2O and K2O measurements
% cell array for component names
title = TData(1,:);
TData(1,:) = [];
[row,col] = size(TData);
TData = reshape(str2num(char(TData)),row,col);
% TData = zscore(TData);
% lunar samples
filename = 'LunarBasalt.csv';
LData = sortgeochem(filename);

% screen the ldata
LData(:,2) = []; % reference 
LData(:,12:13) = []; % Na2O+K2O shouldn't be analysis since there are Na2O and K2O measurements;Cr2O3 is mot comparable with terrestrial
title = LData(1,:);
LData(1,:) = [];
LData = findMedium(LData);
title(1) = []; % parent is not needed anymore
% LData = zscore(LData);

%% run GUI
PCAGUI