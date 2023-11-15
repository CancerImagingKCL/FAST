%% FAST BENCHMARKING SCRIPT, IBSI 1, PHANTOM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script is for use in testing FAST against IBSI 1 standards, using
% the digital phantom. 
%
% Assuming you have cloned or downloaded the repository as-is, and your 
% current working directory is the top-level of it (i.e., FAST), then the
% addpath commands below should work, as should the file path for image 
% import  Otherwise, you'll have to do the directory-adding and specify the
% file paths yourself. 
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%% STEP 1: FUNCTION PATHS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% add all in the repository to the path
addpath(genpath(pwd));

%% STEP 2: IMPORT PHANTOM AND MASK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% default location for the phantom (in this repository — change it yourself
% if it is located elsewhere).
imagePath = './benchmarking/IBSI_1/images/ibsi_1_digital_phantom/nifti/image/phantom.nii.gz';
maskPath = './benchmarking/IBSI_1/images/ibsi_1_digital_phantom/nifti/mask/mask.nii.gz';

% NOTE: you can also call "import_image_phantom" with no argument, and
% locate the image in a dialogue.
[image,info] = import_image_phantom(imagePath);
mask = import_image_phantom(maskPath);

%% STEP 3: INTENSITY-BASED STATISTICAL FEATURES %%%%%%%%%%%%%%%%%%%%%%%%%%%

% the vector returned here, "intensityStatsFeatures", contains the
% intensity-based statistical features of IBSI 1, in this order:
%       Mean
%       Variance
%       Skewness
%       (Excess) kurtosis
%       Median
%       Minimum
%       10th percentile
%       90th percentile
%       Maximum
%       Interquartile range
%       Range
%       Mean absolute deviation
%       Robust mean absolute deviation
%       Median absolute deviation
%       Coefficient of variation
%       Quartile coefficient of dispersion
%       Energy
%       Root mean square

% they can be copied into the spreadsheet provided by IBSI for benchmarking
% against the consensus values.
% NOTE: in the IBSI 1 reference manual (not the resulting publication), it
% is stated that many implementations produce a value of 4.2 for the 90th
% percentile calculation, although the consensus is stated as 4.0. FAST
% gives a value of 4.2.
intensityStatsFeatures = ...
    calculate_intensity_statistical_features(image,mask);

%%

