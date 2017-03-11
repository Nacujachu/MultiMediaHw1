img = imread('img_LR.png');
bil = bilinear(img,4);
figure;
imshow(bil);
figure;
nn = NN(img);
imshow(nn);
