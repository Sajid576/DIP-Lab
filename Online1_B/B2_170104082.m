clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

bg =imread('redBack.jpg');
victim =imread('person.png');
figure;

imshow(bg);
figure;

imshow(victim);

maskA = imfill(victim ~= 0, 'holes');
maskB = imfill(rgb2gray(bg) ~= 0, 'holes');
overlapMask = maskA & maskB;
overlapMaskRGB = cat(3, overlapMask, overlapMask, overlapMask);

C = victim +bg;
C(overlapMaskRGB) = C(overlapMaskRGB)/2;
figure; 
imshow(C);
imwrite(C, 'output.jpg');

