% Histogram specification of two images

clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
clear;  % Erase all existing variables. Or clearvars if you want.

my_pic=rgb2gray(imread('funny_photo.jpg'));
% a) Read the image ‘cameraman.png’
x=imread('cameraman.png');
x_copy=x;

figure(1);
subplot(3,2,1);
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
%copying the histogram of input image

subplot(3,2,3);
stem(n, h);
title('Histogram of Original Image');
 


% histogram of my desired image
my_h=zeros(1,256);
[mr, mc]=size(my_pic);
% b) Compute no. of pixels

my_n=0:255; 
for i=1:mr
    for j=1:mc
        my_h(my_pic(i,j)+1) = my_h(my_pic(i,j)+1)+1;
    end
end


subplot(3,2,2);
imshow(my_pic);
title('My desired Image');

subplot(3,2,4);
stem(my_n, my_h);
title('Histogram of my desired image');


% Equalize the histogram of both images

% Compute Probability Distribution Function (PDF)
for i=1:256
    h(i)=h(i)/total_no_of_pixels;
end
% Compute Cumulative Distribution Function (CDF)
temp=h(1);
for i=2:256
    temp=temp+h(i);
    h(i)=temp;
end

y=uint8(zeros(r,c));
for i=1:r
    for j=1:c
        % e) Multiply each CDF by L-1
        % f) Round the value
        y(i,j)=round(h(x(i,j)+1)*255);
    end
end


x_eql_hist=zeros(1,256);
[r, c]=size(x);
total_no_of_pixels=r*c;
n=0:255; 
for i=1:r
    for j=1:c
        x_eql_hist(y(i,j)+1) = x_eql_hist(y(i,j)+1)+1;
    end
end
subplot(3,2,5);
stem(n, x_eql_hist);
title('After Histogram Equalization(original)');






% Compute Probability Distribution Function (PDF)
for i=1:256
    my_h(i)=my_h(i)/total_no_of_pixels;
end
% Compute Cumulative Distribution Function (CDF)
temp=my_h(1);
for i=2:256
    temp=temp+my_h(i);
    my_h(i)=temp;
end

y=uint8(zeros(r,c));
for i=1:r
    for j=1:c
        % e) Multiply each CDF by L-1
        % f) Round the value
        y(i,j)=round(my_h(my_pic(i,j)+1)*255);
    end
end

my_pic_eql_hist=zeros(1,256);
[r, c]=size(my_pic);
total_no_of_pixels=r*c;
n=0:255; 
for i=1:r
    for j=1:c
        my_pic_eql_hist(y(i,j)+1) = my_pic_eql_hist(y(i,j)+1)+1;
    end
end

subplot(3,2,6);
stem(n, my_pic_eql_hist);
title('After Histogram Equalization(My desired image)');

% Now match the histogram of original image with histogram of my
% desired image.



new_x=uint8(zeros(r,c));
new_x_hist=zeros(1,256);
n=0:255; 
for i=1:256
    
        inp=x_eql_hist(i);
        target_arr=my_pic_eql_hist;
        [new_val,~]=find_target_val(inp,target_arr);
        new_x_hist(i)=new_val;
    
end


figure(2);
subplot(1,2,1);
stem(n, new_x_hist);
title('New histogram of original image(After Matching)');

function [vv,key] = find_target_val(val,target)
    MAX=max(target(:));
    MIN=min(target(:));
    
    key = any(target==val) ;
    flag=0;
    if(key==0)
        new_value = val+1;
        while true
            if(new_value>MAX)
                break;
            end
            key = any(target==new_value) ;
            if( key==1)
                flag=1;
                break;
            end
            new_value=new_value+1;
        
        end
        
        if(key==0)
            new_value = val-1;
            while true
                 if(new_value<MIN)
                    break;
                end
                key = any(target==new_value) ;
                if( key==1)
                    flag=1;
                    break;
                end
                new_value=new_value-1;

            end
        end
         
    end
    if(flag==0)
        vv=val;
    else
        vv=new_value;
    end
    
    return ;
end


















