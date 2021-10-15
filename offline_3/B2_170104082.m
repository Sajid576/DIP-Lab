% implement Gaussian filtering from scratch

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.



    S = rgb2gray(imread('funny_pic.jpg'));
    R = S;
    [row, col] = size(S);
    
    S = imnoise(S, 'salt & pepper', 0.02);
    
    for i = 1:row-4
       for j = 1:col-4 
           
           N = S(i:i+4, j:j+4);
           t = mean(N(:));
           %t = min(N(:));
           %t = max(N(:));
           
           R(i,j) = t;
           
       end
    end

    figure; imshow(S);
    figure; imshow(R);
    figure; imshow(abs(R - S), [0 1])
    










