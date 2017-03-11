img = imread('thinker_gray_noised.jpg');
H = fspecial('gaussian',[3 3] ,  0.3);
F = fspecial('gaussian',[9 9] , 1.0);
new_three = convolution(img ,H);
figure;
imshow(new_three);
new_nine = convolution(img , F);
figure;
imshow(new_nine);
