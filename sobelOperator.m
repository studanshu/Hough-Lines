function binImage = sobelOperator(I, threshold)
% INPUTS
%   I           - Original Image
%   threshold   - thresholding value to display 1 or 0 for binary image
% OUTPUTS
%   binImage	- Final binary image
sobelX = [-1 0 1; -1 0 1; -1 0 1];
sobelY = sobelX';
imgGray = rgb2gray(I);
Ix = conv2(imgGray,sobelX);
Iy = conv2(imgGray, sobelY);
IMag = sqrt(Ix.^2 + Iy.^2);
binImage = IMag > threshold;
end