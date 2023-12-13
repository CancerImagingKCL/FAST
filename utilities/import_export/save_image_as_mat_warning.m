% SAVE_IMAGE_AS_MAT_WARNING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Instructions to tell user to create a new directory for the save.
%
% INPUT(S):
%
%   none.
%
% OUTPUTS
%
%   saveFolder, the empty folder ready for saving.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function saveFolder = save_image_as_mat_warning()

% warning message
warnMsg = warndlg({'Images will be saved as Matlab .mat files.'; ...
    'In the next box, please select,';...
    'or create, an empty folder for them.'},'Image saving,','OK');
uiwait(warnMsg);

% initialise an empty-folder-checker and a logical for repeat
emptyCheck = false;
repLog = false;

% and keep asking the user until they choose an empty one
while ~(emptyCheck)
    
    if repLog
        warnMsg = warndlg('Please select an EMPTY folder.','Non-empty folder!','OK');
        uiwait(warnMsg);
    end

    % get user to choose folder
    saveFolder = uigetdir('','Select or create empy folder.');

    % check it is empty!
    folderContents = dir(saveFolder);
    folderContents = {folderContents.name}';
    folderContents(ismember(folderContents,{'.','..'})) = [];
    folderContents(ismember(folderContents,{'.DS_Store','._.DS_Store'})) = [];
    
    if size(folderContents,1) == 0
        emptyCheck = true;
    end
    repLog = true;
end
