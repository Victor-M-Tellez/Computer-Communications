
for i = -4:4
    k = i+5;
    gaussian(k) = exp((-i*i)/(2*sigma*sigma));
    sum = sum + gaussian(k);
end
for i = -4:4
    k = i+5;
    gaussian(k) = gaussian(k)/sum;
end
 