% RUN_RADIOMICS_ANALYSIS_BATCH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For calculation of all the available radiomics features in FAST. 
%
% INPUT(S):
%
%   none - user is asked to locate folder for batch analysis.
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

function features = run_radiomics_analysis_batch()

fldrs = cell(2,1);
run_radiomics_analysis(fldrs);

features = 1;





