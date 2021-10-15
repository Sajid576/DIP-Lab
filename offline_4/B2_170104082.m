clc;
clear all;
close all;

f1=(imread('f1.png'));
original1=f1;
f1=rgb2gray(f1);
f1=imbinarize(f1);

f2=(imread('f2.png'));
original2=f2;
f2=rgb2gray(f2);
f2=imbinarize(f2);

f3=(imread('f3.png'));
original3=f3;
f3=rgb2gray(f3);
f3=imbinarize(f3);
f4=(imread('f4.png'));
original4=f4;
f4=rgb2gray(f4);
f4=imbinarize(f4);
f5=(imread('f5.png'));
original5=f5;
f5=rgb2gray(f5);
f5=imbinarize(f5);


se=strel('disk',45);
open1=imopen(f1,se);
open2=imopen(f2,se);
open3=imopen(f3,se);
open4=imopen(f4,se);
open5=imopen(f5,se);


fn1=f1-open1;
fn2=f2-open2;
fn3=f3-open3;
fn4=f4-open4;
fn5=f5-open5;




se1=strel('disk',10);


fnnoiseless1=imopen(fn1,se1);
fnnoiseless2=imopen(fn2,se1);
fnnoiseless3=imopen(fn3,se1);
fnnoiseless4=imopen(fn4,se1);
fnnoiseless5=imopen(fn5,se1);


[L1,num1]=bwlabel(fnnoiseless1);
[L2,num2]=bwlabel(fnnoiseless2);
[L3,num3]=bwlabel(fnnoiseless3);
[L4,num4]=bwlabel(fnnoiseless4);
[L5,num5]=bwlabel(fnnoiseless5);



subplot(5,6,1);
imshow(original1);
title('Original image');

subplot(5,6,2);
imshow(f1);
title('Binary image');

subplot(5,6,3);
imshow(open1);
title('palm');

subplot(5,6,4);
imshow(fn1);
title('fingers(Noisy)');

subplot(5,6,5);
imshow(fnnoiseless1);
title('fingers(Noiseless)');


subplot(5,6,6);
text(0.5,0.5,(num2str(num1)));
set(gca,'XTick',[], 'YTick', [])
title('Number of fingers');




subplot(5,6,7);
imshow(original2);
title('Original image');


subplot(5,6,8);
imshow(f2);
title('Binary image');

subplot(5,6,9);
imshow(open2);
title('palm');


subplot(5,6,10);
imshow(fn2);
title('fingers(Noisy)');

subplot(5,6,11);
imshow(fnnoiseless2);
title('fingers(Noiseless)');

subplot(5,6,12);
text(0.5,0.5,(num2str(num2)));
set(gca,'XTick',[], 'YTick', [])
title('Number of fingers');



subplot(5,6,13);
imshow(original3);
title('Original image');

subplot(5,6,14);
imshow(f3);
title('Binary image');

subplot(5,6,15);
imshow(open3);
title('palm');

subplot(5,6,16);
imshow(fn3);
title('fingers(Noisy)');

subplot(5,6,17);
imshow(fnnoiseless3);
title('fingers(Noiseless)');

subplot(5,6,18);
text(0.5,0.5,(num2str(num3)));
set(gca,'XTick',[], 'YTick', [])
title('Number of fingers');



subplot(5,6,19);
imshow(original4);
title('Original image');

subplot(5,6,20);
imshow(f4);
title('Binary image');

subplot(5,6,21);
imshow(open4);
title('palm');

subplot(5,6,22);
imshow(fn4);
title('fingers(Noisy)');

subplot(5,6,23);
imshow(fnnoiseless4);
title('fingers(Noiseless)');

subplot(5,6,24);
text(0.5,0.5,(num2str(num4)));
set(gca,'XTick',[], 'YTick', [])
title('Number of fingers');



subplot(5,6,25);
imshow(original5);
title('Original image');


subplot(5,6,26);
imshow(f5);
title('Binary image');

subplot(5,6,27);
imshow(open5);
title('palm');

subplot(5,6,28);
imshow(fn5);
title('fingers(Noisy)');

subplot(5,6,29);
imshow(fnnoiseless5);
title('fingers(Noiseless)');

subplot(5,6,30);
text(0.5,0.5,(num2str(num5)));
set(gca,'XTick',[], 'YTick', [])
title('Number of fingers');





