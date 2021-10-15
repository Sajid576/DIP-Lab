% histogram equalization

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

% a) Read the image �cameraman.png�
x=imread('cameraman.png');

figure(1);
subplot(1,2,1);
imshow(x);
title('Original Image');

h=zeros(1,256);
[r, c]=size(x);
% b) Compute no. of pixels
total_no_of_pixels=r*c;
n=0:255; 
for i=1:r
    for j=1:c
        h(x(i,j)+1) = h(x(i,j)+1)+1;
    end

end


 figure(2);
subplot(1,2,1);
 stem(n, h);

 title('Histogram of Original Image');
% c) Compute Probability Distribution Function (PDF)
for i=1:256
    h(i)=h(i)/total_no_of_pixels;
end

% d) Compute Cumulative Distribution Function (CDF)
temp=h(1);
for i=2:256
    temp=temp+h(i);
    h(i)=temp;
end


% image matrix for equalized image
y=uint8(zeros(r,c));

% e) Multiply each CDF by L-1
% f) Round the value
for i=1:r
    for j=1:c
       
        y(i,j)=round(h(x(i,j)+1)*255);
    end
end

figure(1);
subplot(1,2,2);
imshow(y);
title('Histogram Equalized image');

figure(2);
subplot(1,2,2);
h=zeros(1,256);
[r, c]=size(x);
total_no_of_pixels=r*c;
n=0:255; 
for i=1:r
    for j=1:c
        h(y(i,j)+1) = h(y(i,j)+1)+1;
    end
end

stem(n, h);
drawnow limitrate;
title('After Histogram Equalization');




