function ret = med_conv(img , Size)
[a,b] = size(img);
ret = img;
for i = 1 : a
    for j = 1 : b
        ret = med_mask( ret , i ,j , Size);
    end
end
end


function ret =  med_mask(img , x , y , Size)

ret = img;
[m , n] = size(img);
start = -ceil((Size/2))+1;
End = floor(Size/2);
sum = 0;
add = ceil(Size/2);
Sz = Size*Size;
tmp = zeros(Sz , 1);
idx = 1;
for i = start  : End
    for j = start  : End
        if x + i <=0 || y+j<=0 || x+i>m || y+j>n
            data = 0;
        else
            data = img(x+i , y+j);
        end
        tmp(idx) = data;
        idx = idx + 1 ;
    end
end
med = median(tmp);
ret(x,y) = med;
end