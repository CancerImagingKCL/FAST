% CHECK_INPUT_FOLDER_STRUCTURE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For ensuring the folder structure for input image/masks is correct.
%
% INPUT(S):
%
%   inputFolder - the path to the input folder.
%
% OUTPUTS
%
%   folderCheck - a logical to indicate whether the structure is correct 
%   (true) or not, but in reality, an error is thrown if it would be false.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function folderCheck = check_input_folder_structure(inputFolder)

% trim down the entries structure and convert to a cell
folderContents = trim_dir_entries(inputFolder);

% loop over entries and check
numFolders = length(folderContents);
sep = filesep();
for i = 1:numFolders

    % current subfolder
    currSubFolder = [inputFolder,sep,folderContents{i,1}];

    % get contents and test size and if "image" and "mask"
    % TODO: case-insensitivity in subfolder names
    subFolderContents = trim_dir_entries(currSubFolder);
    if length(subFolderContents) > 2
        error('Input folders have too many subfolders');
    end
    if ~((strcmp(subFolderContents{1},'mask')) && ...
            (strcmp(subFolderContents{2},'image')) ...
            || (strcmp(subFolderContents{1},'image')) && ...
            (strcmp(subFolderContents{2},'mask')))
        error('Input sub-folders are not named correctly');
    end

    % now check they contain dicom files
    currImageFolder = [currSubFolder,sep,'image'];
    imageFolderContents = trim_dir_entries(currImageFolder);
    for j = 1:length(imageFolderContents)
        currFile = imageFolderContents{j,1};
        [~,~,fileExt] = fileparts(currFile);
        if ~(strcmp(fileExt,'.dcm'))
            error('At least one image input file is not dicom.')
        end
    end
    
    % mask folder should have only one entry
    currMaskFolder = [currSubFolder,sep,'mask'];
    maskFolderContents = trim_dir_entries(currMaskFolder);
    if length(maskFolderContents) > 1
        error('More than one mask input file per image detected.')
    end
    [~,~,fileExt] = fileparts(maskFolderContents{1,1});
    if ~(strcmp(fileExt,'.dcm'))
        error('One input mask is not dicom.')
    end
end

% if not errors have been thrown, folders are good.
folderCheck = true;
