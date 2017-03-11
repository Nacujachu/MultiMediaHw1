Img = imread('lalaland.png');
[a,b,c] = size(Img);

%Iimg = double(rgb2gray(Img));
n = 2;
new_img = zeros(a,b,c);
Iimg = im2double(Img);
Iimg_a = Iimg(:,:,1);
Iimg_b = Iimg(:,:,2);
Iimg_c = Iimg(:,:,3);
M = 8;
matrix = zeros(8,8);
new = zeros(a,b);
for p = 0 : 7
    for q = 0 : 7
        if p == 0 || q == 0
            matrix(p+1,q+1) = 1 / sqrt(8);
        else
            matrix(p+1,q+1) = sqrt(2/8) * cos( pi * (2*q+1)*p /16);
        end
    end
end
for i = 1 : 8 : 360
    for j = 1 : 8 : 640
        A = Iimg_a(i:i+7 , j:j+7 );
        B = Iimg_b(i:i+7 , j:j+7 );
        C = Iimg_c(i:i+7 , j:j+7 );
        K = DCT(A,matrix,n);
        T = DCT(B,matrix,n);
        S = DCT(C,matrix,n);
        new_img(i:i+7 , j:j+7,1) = K;
        new_img(i:i+7 , j:j+7,2) = T;
        new_img(i:i+7 , j:j+7,3) = S;
    end
end
imshow(new_img)
for i = 1:8:360
    for j=1:8:640
        A = new_img(i:i+7 , j:j+7,1);
        B = new_img(i:i+7 , j:j+7,2);
        C = new_img(i:i+7 , j:j+7,3);
        K = IDCT(A,matrix);
        S = IDCT(B,matrix);
        T = IDCT(C,matrix);
        rev_img(i:i+7 , j:j+7,1) = K;
        rev_img(i:i+7 , j:j+7,2) = S;
        rev_img(i:i+7 , j:j+7,3) = T;
    end
end
figure;
imshow(rev_img)
