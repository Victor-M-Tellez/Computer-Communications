pic1  = imread('pic1.tif');
 
[m,n] = size(pic1);
pic2=zeros(m,n,3);
f = zeros(1,255);
l=2;
numbersFound = zeros(1,9);
 
for i=2: m-1
    for j=2:n-1
                    if (pic1(i,j)==255)
                                            a = pic1(i,j);
                                            b = pic1(i,j-1);
                                            c = pic1(i-1,j);      
 
 
                                        if((b==0)&&(c==0))%if b and c have no labels
                                                            pic1(i,j)=l;
                                                            l=l+1;
 
                                        elseif((b==0)&&(c>1))%if c has label but b does not
                                                            pic1(i,j)=c;
                                        elseif ((b>1)&&(c==0))%if b has label but c does not
                                            pic1(i,j)=b;
                                        elseif ((b>1)&&(c>1))%if both c and b have labels
                                            if(b==c)
                                                pic1(i,j)=b; 
                                            else
                                                while (f(b)>0)%f(b) = father of b
                                                    b=f(b);
                                                end
                                                while(f(c)>0)%f(c) = father of c
                                                    c=f(c);
                                                end
                                                if(b==c)% b and c have the same father
                                                    pic1(i,j)=b;
                                                elseif(b<c)
                                                    pic1(i,j)=b;
                                                    f(c)=b;
                                                else
                                                    pic1(i,j)=c;
                                                    f(b)=c;
                                                end
                                            end
                                        end 
                    end
    end
end
 
 
 
for i=1 : m
    for j=1 : n
        if(pic1(i,j)>0)
            k=pic1(i,j);
            while(f(k)>0)
                k=f(k);
                
            end
            pic1(i,j)=k;
            %pic1(i,j)=(k+20)*3;
        end
    end
end
 
vic=1;
for i=1 : m
    for j=1 : n
        if(pic1(i,j)~=0)
            ww=ismember(pic1(i,j),numbersFound);
         if(ww==false)
             numbersFound(vic)=pic1(i,j);
             vic= vic+1;
         end
        end
    end
end
tor=1;
for qq=1:9
red = rand; % random number in the 0 to 1.0 range
green = rand; % random number in the 0 to 1.0 range
blue = rand; % random number in the 0 to 1.0 range
 
    for i=1 : m
        for j=1 : n
            if(pic1(i,j)==numbersFound(qq))
                 pic1(i,j)= 255-(qq*15);
                 pic2(i,j,1)=red;
                 pic2(i,j,2)=green;
                 pic2(i,j,3)=blue;
               
            end
        end
    end
end
 
imwrite(pic1,'p2ese358GrayScalePart1.tif','tiff')
imwrite(pic2,'p2ese358RGBPart1.jpg','jpg')
