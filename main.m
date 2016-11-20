% n = 11;
% img = zeros(n, n);
% img(1, 1) = 1;
% img(1, n) = 1;
% img(n, 1) = 1;
% img(n, n) = 1;
% img(round(n/2), round(n/2)) = 1;
% dSampling = 0.5;
% thetaSampling = 0.9;
% HT = 2;
% houghT(img, HT, dSampling, thetaSampling);


laneImage = imread('lanes.png');
binImage = sobelOperator(laneImage, 128);
houghT(binImage, -1, 0.01, 1);