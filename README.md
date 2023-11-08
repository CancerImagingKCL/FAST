# FAST
*Note: the FAST repository is a work-in-progress, and new code/documentation is being added continually. Thus, some of the code and data referred to in the readme here will not be present yet — in this case, please be patient, and take the information provided more as a plan of the structure of this repository, and keep checking back.* 

Welcome to the repository for the radiomics and image processing software FAST, created and maintained by the Department of Cancer Imaging at King's College London (KCL). Our GitHub Pages website is [here](https://cancerimagingkcl.github.io/), and our King's website is [here](https://www.kcl.ac.uk/bmeis/our-departments/cancer-imaging).  

Our software is compliant with the standards set by the Image Biomarker and Standardisation Initiative, [IBSI](https://theibsi.github.io/), is written for use within Matlab, and is provided under a BSD 3-Clause License. We have contributed to both phases of the IBSI so far, namely, radiomics features (phase 1) and convolutional filters (phase 2), and the code provided here is split according to those, with another section for reproducing the IBSI tests. There is also a utilities folder, for bits and pieces that come in handy generally. Each of these has further documentation below. Thanks for visiting, and enjoy FAST. 

## PREREQUISITES
- Matlab

## IBSI compliance
FAST has contributed to, and been tested against, consensus IBSI values, with the aim of making biomedical image processing and analysis more reproducible. In the folder titled "IBSI", we provide spreadsheets with our results on phantom and real data, compared to the consensus values defined by IBSI. There are also Matlab scripts to reproduce the analysis, which can be used to get familiar with how to use FAST, or to help in testing your own implementations, should you have them. 

## RADIOMICS FEATURES
Here, there is code to calculate a number of radiomic features, grouped according to these categories:
- Morphological
- Intensity-based
- Histogram-based
- Grey level co-occurrence matrix-based

And below is more detail on the feature calculations available within each category, and how to use them.

### Mophological features
*Documentation to come.*

### Intensity-based features
*Documentation to come.*

### Histogram-based features
*Documentation to come.*

### Grey level co-occurrence matrix-based features
*Documentation to come.*

## CONVOLUTIONAL FILTERS
In this section, there is code for image filtering. As with the radiomic features, they are grouped according to some categories:
- Mean
- Laplacian of Gaussian
- Laws Kernels
- Gabor
- Wavelets

And there is documentation on each, and how to use them, below.

### Mean filter
*Documentation to come.*

### Laplacian of Gaussian filter
*Documentation to come.*

### Laws Kernels
*Documentation to come.*

### Gabor filter
*Documentation to come.*

### Wavelets
*Documentation to come.*

## UTILITIES
In this section, there are Matlab functions/scripts for the jobs you'll need to do frequently, for any processing and analysis pipeline. Things such as loading images, and regions of interest (ROIs), or calculating diagnostic measures of image data. 