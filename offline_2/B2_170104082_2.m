% Problem: Contrast streching

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

I = imread('cameraman.png');
img = I;

I = im2double(I);

A = min(I(:));
B = max(I(:));
D = B - A;
M = 255;
R = I - A;
R = R./D;
R = R.*M;
R = R + A;
R = uint8(R);


% ploting figures  
figure();
subplot(2,2,1);
imshow(I);
title('Original Image');

subplot(2,2,2);

imshow(R);
title('Contrast Streched Image');


I_hist = zeros(256,1);
R_hist = zeros(256,1);

% histogram plot for orignal image
I = uint8(I);
for i=1:size(I,1)
    for j=1:size(I,2)
        val=img(i,j);
        I_hist(val+1)=I_hist(val+1)+1;
    end
end

%histogram plot for streched image
for i=1:size(R,1)
    for j=1:size(R,2)
        val=R(i,j);
        R_hist(val+1)=R_hist(val+1)+1;
    end
end


% ploting figures  
subplot(2,2,3);
bar(I_hist);
title('Histogram of Original Image');

subplot(2,2,4);
bar(R_hist);
title('Histogram of Contrast Steched Image');




