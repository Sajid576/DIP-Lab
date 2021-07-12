image1 = imread('input1.jpg');
image2 = imread('input2.jpeg');

whiteImage = 255 * ones(500, 500, 'uint8');
figure;
imshow(whiteImage);


[x1, y1, z1] = size(image1);
[x2, y2, z2] = size(image2);

const1 = (y1/6);
const2 = (y2/6);

split1 = image1(:,1:const1,:);
split2 = image2(:,const2+1:2*const2,:);
split3 = image1(:,2*const1+1:3*const1,:);
split4 = image2(:,3*const2+1:4*const2,:);
split5 = image1(:,4*const1+1:5*const1,:);
split6 = image2(:,5*const2+1:6*const2,:);


whiteImage = [split1 split2 split3 split4 split5 split6];
imshow(whiteImage);

imwrite(whiteImage, 'output.jpg');


