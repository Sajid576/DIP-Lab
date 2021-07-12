% Draw a rectangle over a gray image

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

img = rgb2gray(imread('input2.jpeg')); % read and convert the color image to gray img
fh = figure;
imshow( img, 'border', 'tight' ); %//show your image
hold on;
rectangle('Position', [250 270 200 200] ); %// draw rectangle on image
frm = getframe( fh ); %// get the image+rectangle
imwrite( frm.cdata, 'savedFileName.png' ); %// save to file



