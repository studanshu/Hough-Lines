% n = 11;
% img = zeros(n, n);
% img(1, 1) = 1;
% img(1, n) = 1;
% img(n, 1) = 1;
% img(n, n) = 1;
% img(round(n/2), round(n/2)) = 1;
% dSampling = 0.45;
% thetaSampling = 0.3;
% HT = 2;
% houghT(img, HT, dSampling, thetaSampling);


laneImage = imread('lanes.png');
binImage = sobelOperator(laneImage, 180);
imagesc(binImage);
colorbar;
ihoughT(binImage, -1, 1, 0.45);