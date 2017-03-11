function ret = NN(img)
[a,b,c] = size(img);
A = a*4;
B = b*4;
ret = uint8(zeros(A,B,3));
for i = 1 : A
    for j = 1 : B
        x = i/4;
        y = j/4;
        C = [floor(x) floor(y) ; ceil(x) floor(y);floor(x) ceil(y);ceil(x) ceil(y)];
        D = [x y];
        idx = find_nearst(C,D);
        m = C(idx,1);
        n = C(idx,2);
        if m == 0
            m = 1;
        end
        if n == 0
            n = 1;
        end
        
        ret(i,j,:) = img(m,n,:);
    end
end

end

function nearest = find_nearst(C , D)

mx = 9999999;
idx = 1;
for i = 1 : 4
    dist = (C(i,1) - D(1)).^2 + (C(i,2) - D(2)).^2;
    if(dist < mx)
        idx = i;
        mx = dist;
    end
end
nearest = idx;
end