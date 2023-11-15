% CALCULATE_INTENSITY_STATISTICAL_FEATURES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For calculation of the intensity-based statistical features, according to
% IBSI phase 1. 
%
% INPUT(S):
%
%   image — the image to be analysed, can be 2D or 3D. Assumed to be
%   double.
%
%   mask — the binary image that defines a region of interest. It should be
%   of the same size as the input image, and does not have to be a logical,
%   since it is converted here, but should, of course, be made of 0 and 1.
%
% OUTPUT(S):
%
%   intensityStatsFeatures — a vector of the intensity-based statistical
%   features, in this order:
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
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function intensityStatsFeatures = ...
    calculate_intensity_statistical_features(image,mask)

% get the voxels from the image
inVox = image(logical(mask));

% mean
meanIntensity = mean(inVox);

% variance (with non-default normalisation, i.e., divide by N, not N-1)
variance = var(inVox,1);

% skewness
skew = skewness(inVox);

% kurtosis, with 3 taken off it for Fisher correction 
kurt = kurtosis(inVox)-3;

% median
med = median(inVox);

% minimum
minimum = min(inVox);

% 10th percentile
ptileTen = prctile(inVox,10);

% 90th percentile
ptileNty = prctile(inVox,90);

% maximum
maximum = max(inVox);

% IQR
intQrt = iqr(inVox);

% range
rng = range(inVox);

% mean absolute deviation
mnAbs = mad(inVox);

% IQR set
iqrSet = inVox(inVox >= ptileTen & inVox <= ptileNty);

% robust mean deviation
robMnAbs = mad(iqrSet);

% differences of voxel intensities to the median
absDev = abs(inVox-med);

% median absolute deviation
mdAbs = mean(absDev);

% standard deviation
sd = variance^0.5;

% coefficient of variation
coeffVar = sd/meanIntensity;

% 25th percentile
ptile25 = prctile(inVox,25);

% 75th percentile
ptile75 = prctile(inVox,75);

% quartile coefficient of variation
qrtCoeffVar = (ptile75-ptile25)/(ptile75+ptile25);

% energy
energy = sum(inVox.^2);

% root-mean-square
rtMnSq = sqrt(energy/length(inVox));

% add to the output array
intensityStatsFeatures = [...
    meanIntensity;...
    variance;...
    skew;...
    kurt;...
    med;...
    minimum;...
    ptileTen;...
    ptileNty;...
    maximum;...
    intQrt;...
    rng;...
    mnAbs;...
    robMnAbs;...
    mdAbs;...
    coeffVar;...
    qrtCoeffVar;...
    energy;...
    rtMnSq...
    ];