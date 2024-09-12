% TRIM_DIR_ENTRIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For ridding the return of "dir" of the '.', '..', '.DS_Store', etc.
%
% INPUT(S):
%
%   inputFolder - the path to the input folder.
%
% OUTPUTS
%
%   trimFolder - the input folder, without the annoying entries, just the
%   names of folders or files, in a cell.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function trimFolder = trim_dir_entries(inputFolder)

trimFolder = dir(inputFolder);
trimFolder = {trimFolder.name}';
trimFolder(ismember(trimFolder,{'.','..'})) = [];
trimFolder(ismember(trimFolder,{'.DS_Store','._.DS_Store'})) = [];