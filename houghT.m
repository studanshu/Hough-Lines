function houghT(origImage, binImage, HT, dSampling, thetaSampling)
% INPUTS
%   origImage       - original Image for display purposes
%   binImage        - binary Image for which hough transform 
%                                                     is to be computed
%   HT              - Hough Threshold
%   dSampling       - the interval in which d should be sampled
%   thetaSampling   - the interval in which theta should be sampled
    [height, width] = size(binImage);
    dMax = round(sqrt(height * height + width * width));
    d = (-dMax):dSampling:dMax;
    theta = degtorad(0:thetaSampling:180);
    
    szD = size(d);
    szTheta = size(theta);
    numThetas = szTheta(1,2);
    rangeMatrix = zeros(szD(1,2), szTheta(1,2));

      count = 0;
%        for x = 1:width
%            for y = 1:height
%                if binImage(y, x) > 0
%                    for thetaItr = 1:szTheta(1,2)
%                        dTemp = y * cos(theta(thetaItr)) + x * sin(theta(thetaItr));
%                        dTemp = dTemp;
%                        [~, dIdx] = min(abs(d - dTemp));
%                        rangeMatrix(dIdx, thetaItr) = rangeMatrix(dIdx, thetaItr) + 1;
%                    end
%                end
%            end
%        end
    [xIndicies, yIndicies] = find(binImage);

    %Preallocate space for the accumulator array
    numEdgePixels = numel(xIndicies);
    accumulator = zeros(numEdgePixels,numThetas);
    cosine = (0:height-1)'*cos(theta); %Matrix Outerproduct  
    sine = (0:width-1)'*sin(theta); %Matrix Outerproduct

    accumulator((1:numEdgePixels),:) = cosine(xIndicies,:) + sine(yIndicies,:);
    for i = (1:numThetas)
        rangeMatrix(:,i) = hist(accumulator(:,i),d);
    end
    if HT == -1
        HT = 0.5 * max(rangeMatrix(:));
    end
    figure(1);
    imagesc(origImage);
    colorbar;
    for i = 1:szD(1,2)
        for j = 1:szTheta(1,2)
            if rangeMatrix(i, j) > HT
                count = count + 1;
                dVal = d(i);
                thVal = theta(j);
                x = 0:(width + 1);
                y = (dVal - x * sin(thVal)) / cos(thVal);
                line(x, y);
            end
        end
    end
    count
end