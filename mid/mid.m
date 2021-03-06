clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

I = rgb2gray(im2double(imread('noisy_img.jpeg')));
sigma = 1;
figure(1);
subplot(221),imshow(I);

[m,n] = size(I);
padImg = zeros(m+6,n+6);

for i = 4: m+3
    for j = 4:n+3
        padImg(i,j) = I(i-3,j-3);
    end
end


filx = 5;
fily = 5;
[X, Y]=meshgrid(-(filx-1)/2:(filx-1)/2, -(fily-1)/2:(fily-1)/2);
a = 1/(2*pi*power(sigma,2));
b1 = -(power(X,2) + power(Y,2));
b2 = 2*power(sigma,2);
b = b1/b2;
gussfil = a*exp(b);

filteredImg = zeros([m,n]);
for i = 1:m
    for j = 1:n
        N = padImg(i:i+4,j:j+4);
        N = N.*gussfil;
        B = reshape(N,1,[]);
        filteredImg(i,j) = sum(B);
    end
end

subplot(222),imshow(filteredImg);

subI = I - filteredImg;
subplot(223),imshow(subI);

small_pic = rgb2gray(im2double(imread('msg.jpg')));
[rows,col] = size(small_pic);



r_cnt=343;
c_cnt=500;

filteredImg(r_cnt+1:m,c_cnt+1:n)=small_pic(:,:);


person_x_start=193; 
person_x_end=205;

person_y_start_1=200; 
person_y_end_1=250;

person_y_start_2=400; 
person_y_end_2=450;

temp=filteredImg(person_x_start+1:person_x_end,person_y_start_1+1:person_y_end_1);

filteredImg(person_x_start+1:person_x_end,person_y_start_2+1:person_y_end_2)= temp;

figure(2);
imshow(filteredImg);







