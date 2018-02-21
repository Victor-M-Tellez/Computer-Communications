
picL  = imread('xmasL.jpg');
picR  = imread('xmasR.jpg');

picL = imresize(picL,[480,640]); 
picR = imresize(picR,[480,640]); 

[x,y,z] = size(picL);
[a,b,c] = size(picR);
grayL=uint8(zeros(x,y));
grayR=uint8(zeros(a,b));

%TURN THE IMAGE TO GRAYSCALE FROM RBG
for i=1 : x
    for j=1 : y  
        r= picL(i,j,1);
        bl= picL(i,j,2);
        g= picL(i,j,3);
        grayL(i,j)= uint8((.33*r+.33*bl+.34*g));
    end
end
for i=1 : a
    for j=1 : b  
        r= picR(i,j,1);
        bl= picR(i,j,2);
        g= picR(i,j,3);
        grayR(i,j)= uint8((.33*r+.33*bl+.34*g));
    end
end

imwrite(grayL,'GrayL.jpg','jpg')
imwrite(grayR,'GrayR.jpg','jpg')
%imwrite(grayL,'GrayLdiv.tif','tiff')
imwrite(grayR,'GrayRdiv.jpg','jpg')

%picLdiv  = imread('GrayLdiv.tif');
picRdiv  = imread('GrayRdiv.jpg');
intervalX=480/8;
intervalY=640/8;
for i=1 : a
    for j=1 : b  
        if(mod(j,intervalY)==0 ||mod(i,intervalX)==0 )
            picRdiv(i,j)= 0;
        end
       
   
    end
end


imwrite(picRdiv,'GrayRdiv.jpg','jpg')































































