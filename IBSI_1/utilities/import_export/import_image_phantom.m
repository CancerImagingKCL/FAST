% IMPORT_IMAGE_PHANTOM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% For import of the digital image phantoms, for both IBSI 1 and 2.
%
% INPUT(S):
%
%   varargin — can be left empty, or a char for file path of image. If
%   left empty, the user will be prompted to locate the image in a UI. The
%   image is assumed to be in nifti format; this function is not compatible
%   with dicom.
%
% OUTPUT(S):
%
%   image — the phantom image, with dimensions re-arranged to match IBSI
%   specification, and converted to double precision floating point.
%
%   info - the image metadata.
%
% FAST, created and maintained by the Department of Cancer Imaging, King's
% College London, is provided under a BSD 3-Clause license, the details of
% which can be found in "LICENSE", in this repository.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [image,info] = import_image_phantom(varargin)

if nargin == 0
    
    % find the image file
    [imageFile,imagePath] = uigetfile('*.nii.gz');

    % import the image volume and the metadata
    image = niftiread([imagePath,imageFile]);
    info = niftiinfo([imagePath,imageFile]);

elseif nargin == 1
    
    % get out the file path
    filePath = varargin{1};

    % check for a char (or a string) input
    
    if ~(isa(filePath,'char') || isa(filePath,'string'))
        error('Input is not a char or a string')
    end
    
    % import the image volume and the metadata
    image = niftiread(filePath);
    info = niftiinfo(filePath);

elseif nargin > 1

    error('Too many input arguments')

end

% change the order of the dimensions
% (the image, in Matlab, is always imported in a way that requires sorting
% out the dimensions here)
permutation = [2,1,3];
image = permute(image,permutation);

% change to double precision floating point
image = double(image);
