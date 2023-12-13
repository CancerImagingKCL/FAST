% SAVE_IMAGE_AS_MAT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For loading a dicom image, and saving it as a .mat file. 
%
% INPUT(S):
%
%   inputPath - the path to the location to load the image.
%
%   inputFile - the name image to load.
%
%   outputPath - the path to the location to save the image.
%
%   outputFile - the name of the file under which the output is saved.
%
% OUTPUTS
%
%   none.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function convert_dicom_to_mat(inputPath,inputFile,outputPath,outputFile)

% load image metada
% load image
% save as a mat file