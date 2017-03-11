function yiq = RGB2YIQ(rgb)
mat = [.229 .587 .114 ; .595716 -.274453 -.321263 ; .211456 -.522591 .311135];
[a,b,c] = size(rgb);
rgb = double(rgb);
d = rgb(25,36,:)
size(d)
d = reshape(d , [3 1])
yiq = zeros(a,b,c);

for i = 1 : a
    for j = 1 : b
       d = rgb(i,j,:);
       d = reshape(d,[1 3 ]);
       d = d * mat;
       yiq(i,j,:) = d;
    end
end