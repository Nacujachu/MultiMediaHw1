function ret = bilinear(img , scale)
[a,b,c] = size(img);
whos img
A = a*scale;
B = b*scale;
ret = uint8(zeros(A , B , 3));
pixel = uint8(zeros(3,1));
for i = 1 : A
    for j = 1 : B
        x = i/scale;
        y = j/scale;
        m = floor(x);
        n = floor(y);
        Fx = x - floor(x);
        Fy = y - floor(y);
        Cx = floor(x)+1 - x ;
        Cy = floor(y)+1 - y;
        
        if m == 0
            m = 1;
        end
        if m == a
            m = m-1;
        end
        if n == 0
            n = 1;
        end
        if n == b
            n = n-1;
        end
        pixel(:) = (1-Fx)*(1-Fy).*img(m,n,:) + (1-Cx)*(1-Fy).*img(m+1,n,:) + (1-Fx)*(1-Cy).*img(m,n+1,:) + (1-Cx)*(1-Cy).*img(m+1,n+1,:);
        ret(i,j,:) = pixel;
    end
end
