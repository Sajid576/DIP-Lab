
%STEP 1: Display input
img = imread('input.png');
img =  rgb2gray(img);
a = im2double(img);

subplot(2,4,1);
imshow(a);
title('Fig(a)');

%STEP 2: Laplacian filter for positive to detect the changes(slowly/sharply) in edges
laplacian_filter_matrix = [0 1 0;
                           1 -4 1;
                           0 1 0];
[row, col] = size(a);
b = zeros(row,col);

% 3x3 matrix ,so extra 2 pixels taken
padded = zeros(row+2,col+2);
padded(2:2+row-1,2:col+2-1) = a;

for i=2:row+1
    for j= 2:col+1
        temp = padded(i-1:i+1,j-1:j+1).*  laplacian_filter_matrix;
        b(i-1,j-1) = sum(temp(:));
    end
end

subplot(2,4,2);
imshow(b, []);
title('Fig(b)');

%STEP 3: Laplacian enhanced image 
c = a - b;
subplot(2,4,3);
imshow(c);
title('Fig(c)');

%STEP 4: Sobel filter
sobel_x = [-1 0 1;
          -2 0 2;
          -1 0 1];
sobel_y = [-1 -2 -1;
           0 0 0;
           1 2 1];
d = zeros(row,col); 

for i=2:row+1
    for j= 2:col+1
        temp1 = padded(i-1:i+1,j-1:j+1).* sobel_x;
        tempx = sum(temp1(:));
        temp2 = padded(i-1:i+1,j-1:j+1).* sobel_y;
        tempy = sum(temp2(:));
        d(i-1,j-1) = sqrt(tempx.^2 + tempy.^2);
    end
end

subplot(2,4,4);
imshow(d);
title('Fig(d)');

%STEP 5: 5X5 average filter mask
padded = zeros(row+4,col+4);
padded(3:row+2,3:col+2) = d;
e =  zeros(row,col);

for i=3:row+2
    for j= 3: col+2
        filter = padded(i-2:i+2,j-2:j+2);
        e(i-2,j-2) = mean(filter(:));
    end
end

subplot(2,4,5);
imshow(e);
title('Fig(e)');



%STEP 6: Product of c and e
f=c.*e;
subplot(2,4,6);
imshow(f);
title('Fig(f)');



%STEP 7: add a and f
g=a+f;
subplot(2,4,7);
imshow(g);
title('Fig(g)');



%STEP 8: Apply power law transformation
c = 1;
gamma = 0.5;

h = c*abs(g).^gamma;
subplot(2,4,8);
imshow(h);
title('Fig(h)');


