%Callibration Step
%

%N: length of object in pixels
%Z: distance of rod from camera
%L:length of rod in mm





%the following code draws lines on the provided picture
%and outputs the picture
%this allows the user to see how long the object is
%by counting how many intervals long the object is

%in this code the interval size is every 5 pixels
%
%
Lpic  = imread('GrayR.jpg');
interval = 5;
[x,y,z] = size(Lpic);
picRed=uint8(zeros(x,y,z));
for i=1 : x
    for j=1 : y  
        
        if(mod(i,interval)==0)
            picRed(i,j)= 1;
        
        else
            
            picRed(i,j,1)= Lpic(i,j,1);
        end
        
        
   
    end
end
imwrite(picRed,'redR.jpg','jpg')

























%the distance between the sticky notes  is 87 pixels long
   N=87;
   Z=1905;
   L=300;
%
f=((N*Z)/L); 
fprintf('the focul length is %i\n', f);





























