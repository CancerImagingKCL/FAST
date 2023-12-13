% LOAD_IMAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For loading image metadata. 
%
% INPUT(S):
%
%   imageMetaData, the image metadata, for all slices. Slices are imported 
%   in ascending order of instance number
%
%   slicesToLoad, a slice-by-slice logical to indicate which slices should 
%   be loaded from the image volume.
%
% OUTPUTS
%
%   image, the image volume, will be of type double.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function image = load_image(imageMetaData,slicesToLoad)

% get out image names
sliceNames = {imageMetaData.Filename}';

% prune for those to be loaded
sliceNames = sliceNames(slicesToLoad);

% make an empty image to import into
% the next 6 lines are leftover from cases where slicesToLoad is not all
% true; in those cases, we would want to use only the sizes of the slices
% we were to import (the idea being that if the UIDs differed, or something
% like that, then the image size might conceivable differ too; however,
% these cases don't seem to crop up, anyway)
rows = {imageMetaData.Rows}';
rows = rows(slicesToLoad);
cols = {imageMetaData.Columns}';
cols = cols(slicesToLoad);
imageSize = [rows{1},cols{1},length(sliceNames)];
image = zeros(imageSize); % double type

% read in slice-by-slice
for j = 1:length(sliceNames)
    image(:,:,j) = dicomread(sliceNames{j,1});
end

% adjust HU, if required
if isfield(imageMetaData,RescaleIntercept)
    rescaleIntercept = imageMetaData.RescaleIntercept;
    image = image + rescaleIntercept;
end
