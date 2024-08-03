%This code is used to plot the data coming out of
%multiple_experimence_runner.m

%This code creates the confusion matrix for the population competiton

clear all
close all
%So what would you like to do?
create_confusion_matrix=1;

rounds=1000;
M=9;
probabilty_win=ones(M,M);

% Specify the folder where the files live.
myFolder = 'C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\results';
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
%Here we order the populations from the highest to the lowest readout accuracy
target_win_probabilty=ones(1,M);
for bar_location=1:M
target_win_probabilty(bar_location)=sum(winning_population_index_simulation_saver(bar_location,:)==bar_location)/1000;
end
[sorted_target_win_probabilty,index_of_original_populations] = sort(target_win_probabilty,'descend');
winning_population_index_simulation_saver_copy=winning_population_index_simulation_saver;
for population=1:M
winning_population_index_simulation_saver(find(winning_population_index_simulation_saver_copy==index_of_original_populations(population)))=population;
end
winning_population_index_simulation_saver_copy=winning_population_index_simulation_saver;
for population=1:M
winning_population_index_simulation_saver(population,:)=winning_population_index_simulation_saver_copy(index_of_original_populations(population),:);
end
%%
%Untill here, the data was sorted and orginised. Here the analysis begins
%creating confusion matrix
if create_confusion_matrix
for bar_location=1:M
  for population=1:M
  probabilty_win(population,bar_location)=sum(winning_population_index_simulation_saver(bar_location,:)==population)/rounds;
  end
end
probabilty_win=probabilty_win'
save(['C:\Users\Ori Hendler\Desktop\עבודה\מעוז\סיכום\Entire Code Generation 10.22\confusion_matrix\',baseFileName],"probabilty_win")
end
end