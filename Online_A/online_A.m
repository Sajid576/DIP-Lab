% draw a triangle
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.
A =rgb2gray(imread('input2.jpeg'));
figure; imshow(A);
hold on;
temp_of_A_image = A;
%input
x1=200;
y1=200;
width=200;
height=100;
%
x2= x1 + width;
y2= y1;
x3=x1+ (abs(x1-x2))/2;
y3 = y1-height;

disp(['(',num2str(x1),',',num2str(y1),')']);
disp(['(',num2str(x2),',',num2str(y2),')']);
disp(['(',num2str(x3),',',num2str(y3),')']);


temp_of_A_image = insertShape(temp_of_A_image,'Line',[x1 y1 x2 y2],'LineWidth',2,'Color','blue');
temp_of_A_image = insertShape(temp_of_A_image,'Line',[x2 y2 x3 y3],'LineWidth',2,'Color','blue');
temp_of_A_image = insertShape(temp_of_A_image,'Line',[x1 y1 x3 y3],'LineWidth',2,'Color','blue');

imshow(temp_of_A_image);






