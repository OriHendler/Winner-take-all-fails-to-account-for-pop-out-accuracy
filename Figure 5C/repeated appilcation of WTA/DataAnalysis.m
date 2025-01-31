%Data analysis coming out of MultipleExpiramentsRunner

%This code creates the orginised data of readout accuracy for different N
%and q so it can be anylsed upon many realizations

clear all
close all

rounds=1000;
M=9;
% % probabilty_win=ones(M,M);

% Specify the folder where the files live.
myFolder = 'C:\Users\orihe\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\repeated appilcation of WTA\results\set 3';
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
correct_readout_saver_all_realizations{k}=data_saver;
correct_readout_saver_all_realizations_matrix(:,:,k)=data_saver;
end
mean_correct_readout_saver_all_realizations_matrix=mean(correct_readout_saver_all_realizations_matrix,3);

% 
save(['C:\Users\orihe\OneDrive\שולחן העבודה\מאמר ראשון מוכן לשליחה\PLOS computational Biology\Peer review A\repeated appilcation of WTA\data_analysis',baseFileName],"correct_readout_saver_all_realizations_matrix","correct_readout_saver_all_realizations","mean_correct_readout_saver_all_realizations_matrix");
