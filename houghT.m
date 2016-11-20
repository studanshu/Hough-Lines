function houghT(binImage, HT, dSampling, thetaSampling)
% INPUTS
%   binImage        - binary Image for which hough transform is to be computed
%   HT              - Hough Threshold
%   dSampling       - the interval in which d should be sampled
%   thetaSampling   - the interval in which theta should be sampled
    [height, width] = size(binImage);
    dMax = round(sqrt(height * height + width * width));
    d = (-dMax):dSampling:dMax;
    theta = 0:thetaSampling:(2 * pi);
    
    szD = size(d);
    szTheta = size(theta);
    rangeMatrix = zeros(szD(1,2), szTheta(1,2));
    for x = 1:height
        for y = 1:width
            if binImage(x,y) == 1
                for thetaItr = 1:szTheta(1,2)
                    dTemp = x * cos(theta(thetaItr)) + y * sin(theta(thetaItr));
                    dTemp = dTemp + dMax;
                    [~, dIdx] = min(abs(d - dTemp));
                    rangeMatrix(dIdx, thetaItr) = rangeMatrix(dIdx, thetaItr) + 1;
                end
            end
        end
    end
    if HT == -1
        HT = 0.75 * max(rangeMatrix(:));
    end
    figure(1);
    imagesc(binImage)
    colorbar
    hold;
    for i = 1:szD(1,2)
        for j = 1:szTheta(1,2)
            if rangeMatrix(i, j) > HT
                dVal = d(i) - dMax;
                thVal = theta(j);
                x = 0:(width + 1);
                y = (dVal - x * cos(thVal)) / sin(thVal);
                line(x, y);
            end
        end
    end
end


