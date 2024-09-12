% RUN_RADIOMICS_ANALYSIS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For calculation of all the available radiomics features in FAST. 
%
% INPUT(S):
%
%   variable - 
%       if called with no arguments, the user will be asked to locate 
%       an image and mask for analysis.
%
%       if called with an argument,  it is assumed that this function is 
%       being called by another function, "run_radiomics_analysis_batch", 
%       and that that argument will be a list of folders, with two 
%       subfolders for the image and mask. That strict folder organisation 
%       (and also parameter checks) is enforced by the calling function. 
%       In batch mode, the interface for locating files is skipped here.
%
% OUTPUT(S):
%   
%   features - 
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function features = run_radiomics_analysis(varargin)

% check for batch mode, or not
if nargin == 0
    
    % obtain image and mask location
    imgPath = uigetdir('','Please locate the image folder');
    mskPath = uigetdir('','Please locate the mask folder');

    % number of images and "batch mode" logical
    nImg = 1;
    batch = false;

elseif nargin == 1

    % it is expected that the batch mode won't be called unless from the
    % "batch" function, which enforces the format of this input.
    callStrct = dbstack;
    if ~(strcmp('run_radiomics_analysis_batch',callStrct(2).name))
        error('This function, with an argument, must be called from run_radiomics_analysis_batch');
    end

    % cell of folders for analysis
    fldrs = varargin{1};

    % number of images and "batch mode" logical
    nImg = size(fldrs,1);
    batch = true;

    % also make an "imgPath" variable here to use below to check whether
    % the files in question are dicoms or mat files
    imgPath = fldrs{1,1};

else
    error('At most, 1 argument is expected.')
end

% check if input images are mat files
folderContents = trim_dir_entries(imgPath);
firstFile = folderContents{1,1};
[~,~,fileExt] = fileparts(firstFile);

% if they're not .mat, then ask user to convert them first
if ~(strcmp(fileExt,'.mat'))
    % use start_fast_project
    %matSavePath = save_image_as_mat_warning();
    %convert_dicom_to_mat(inputPath,inputFile,outputPath,outputFile)

end

% loop over images
for i = 1:nImg

    % load the current image and mask


end

features = 3;



