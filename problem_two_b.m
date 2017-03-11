img = imread('thinker_gray_noised.jpg');
new_three = med_conv(img ,3);
figure;
imshow(new_three);
new_nine = med_conv(img , 9);
figure;
imshow(new_nine);
