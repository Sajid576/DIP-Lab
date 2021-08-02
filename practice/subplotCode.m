R = imread('peppers.png');
figure;
subplot(4,2,1);
imshow(R);
R = rgb2gray(R);
subplot(4,2,3);
imshow(R);

subplot(4,2,5);
imshow(R);