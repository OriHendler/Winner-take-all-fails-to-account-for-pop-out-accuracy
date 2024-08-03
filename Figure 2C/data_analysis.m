%This code is used to plot the data coming out of
%multiple_experimence_runner.m

%This code creates the orginised data of readout accuracy for different N
%and q so it can be anylsed upon many realizations

clear all
close all

rounds=1000;
M=9;
% % probabilty_win=ones(M,M);

% Specify the folder where the files live.
myFolder = 'C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 3A\results\';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder,'*.mat'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    % Now do whatever you want with this file name,
    % such as reading it in as an image array with imread()
load(fullFileName);
    %%
correct_readout_saver_all_realizations{k}=correct_readout_saver;
correct_readout_saver_all_realizations_matrix(:,:,k)=correct_readout_saver;
end
mean_correct_readout_saver_all_realizations_matrix=mean(correct_readout_saver_all_realizations_matrix,3);

% 
save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 23.04\Figure 3A\data_analysis\',baseFileName],"correct_readout_saver_all_realizations_matrix","correct_readout_saver_all_realizations","mean_correct_readout_saver_all_realizations_matrix");
