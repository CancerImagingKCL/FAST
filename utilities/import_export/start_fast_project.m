% START_FAST_PROJECT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For the intial stages of a FAST project - importing images and ROIs (that
% is, saving them as .mat files), and ensuring folder structure is correct.
%
% INPUT(S):
%
%   none.
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

function start_fast_project()

% ask the user to find/create an empty folder for the images
projectFolder = save_image_as_mat_warning();

% now ask the user to locate the images, and ROIs
inputFldrDlg = msgbox('Please locate the input scans folder','modal');
uiwait(inputFldrDlg);
inputFolder = uigetdir('','Scans folder');

% check the folder structure is correct
% TODO: make try/catch block
folderCheck = check_input_folder_structure(inputFolder);

% if inputs are structured properly, then convert the images
convert_dicom_to_mat(inputPath,inputFile,outputPath,outputFile)
