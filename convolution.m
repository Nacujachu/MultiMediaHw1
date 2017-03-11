function ret = convolution(img , mask)
[a,b] = size(img);
[c,d] = size(mask);
ret = img;
OnMask(img , mask , 50 , 50 , c);
for i = 1 : a
    for j = 1 : b
        ret = OnMask( ret , mask , i ,j , c);
    end
end
end


function ret = OnMask(img , mask , x , y , Size)
[m , n] = size(img);

ret = img;
start = -ceil((Size/2))+1;
End = floor(Size/2);
sum = 0;
add = ceil(Size/2);
for i = start  : End
    for j = start  : End
        if x <= add || y <= add || x >= m-add || y >= n-add
            data = 0;
        else
            data = img(x+i , y+j);
        end
        sum = sum + data.*mask(i+add,j+add);
    end
end
ret(x,y) = sum;
ret = ret;
end