n = 11;
img = zeros(n, n);
img(1, 1) = 1;
img(1, n) = 1;
img(n, 1) = 1;
img(n, n) = 1;
img(round(n/2), round(n/2)) = 1;
dSampling = 0.6;
thetaSampling = 0.4;
HT = 2;
houghT(img, img, HT, dSampling, thetaSampling);


laneImage = imread('lanes.png');
binImage = sobelOperator(laneImage, 170);
binImage(:,1:10) = 0;
binImage(1:10,:) = 0;
binImage(:,(end-10):end) = 0;
binImage((end-10):end,:) = 0;
houghT(laneImage, binImage, -1, 2, 1);

commons1 = imread('mscommons1.jpeg');
binImage = sobelOperator(commons1, 50);
binImage(:,1:10) = 0;
binImage(1:10,:) = 0;
binImage(:,(end-10):end) = 0;
binImage((end-10):end,:) = 0;
houghT(commons1, binImage, -1, 1, 1);

commons2 = imread('mscommons2.jpeg');
binImage = sobelOperator(commons2, 80);
binImage(:,1:10) = 0;
binImage(1:10,:) = 0;
binImage(:,(end-10):end) = 0;
binImage((end-10):end,:) = 0;
houghT(commons2, binImage, -1, 2, 0.5);