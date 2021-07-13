% draw circle on an image

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.
A =imread('input2.jpeg');
circle_img =imread('circle.png');
K=A;
[row,col,cha]=size(A);
[row1,col1,cha1]=size(circle_img);

for i=1 : row1
    for j=1 : col1
        if circle_img(i,j,1) > 250 
            A(i,j,1)=0;
            A(i,j,2)=0;
            A(i,j,3)=0;
            
        end
    end
end
figure;
imshow(A);

