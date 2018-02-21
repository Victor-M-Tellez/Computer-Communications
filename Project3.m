pic2  = imread('pic2.jpg');
 
[x,y,z] = size(pic2);
pic2gray=uint8(zeros(x,y));
%h[k]  is the histogram array for k=0,1,2,…,255, 
h=zeros(1,255);
%then the discrete probability for brightness k is p[k]=h[k]/(M*N). 
p=zeros(1,255);
%c[k] is the sum of all p  from p[0] to p[k]
c=zeros(1,255);
%J[m,n] = 255*c{pic1[m,n]}
J=uint8(zeros(x,y));


%TURN THE IMAGE TO GRAYSCALE FROM RBG
for i=1 : x
    for j=1 : y  
        r= pic2(i,j,1);
        b= pic2(i,j,2);
        g= pic2(i,j,3);
        pic2gray(i,j)= uint8((.33*r+.33*b+.34*g));
        h(1,pic2gray(i,j))=h(1,pic2gray(i,j))+1;
    end
end
imwrite(pic2gray,'pic2Gray.tif','tiff')



%then the discrete probability for brightness k is p[k]=h[k]/(M*N). 
for a=1:255
     p(a)=h(a)/(x*y);
end




%c[k] is the sum of all p  from p[0] to p[k]
for ck=1:255
    for pk=1:255
        if(pk<=ck)
            c(ck)=c(ck)+p(pk);
        end
    end
end


%J is the HISTOGRAM EQUALIZED IMAGE
%J[m,n] = 255*c{pic1[m,n]}
for m=1 : x
    for n=1 : y  
        J(m,n)=255*c(pic2gray(m,n));
    end
end

imwrite(J,'pic2GrayOptimized.tif','tiff')

%PART1^^^^^^^^^^^^^^^^^^^^^^
%***************************************************************************************
%Compute the output for only the interior pixels which are more 
%than 2 pixels inside from the border. Set the other pixels to zero.  
%Use the following filters to test your program: LSIfilter1 ; LSIfilter2
fileID = fopen('LSIfilter1.txt','r');
filter1= fscanf(fileID,'%d %d %d %d %d')
fclose(fileID);
clear fileID;
fileID = fopen('LSIfilter2.txt','r');
filter2 = fscanf(fileID,'%f')
fclose(fileID);
clear fileID;
%For input image f[i,j] and filter g[k,l], 
%the output image in the intereior pixels is given by:
%H[i,j]=sum for all n{  sum for all m [ g(k,l)*f(  {i-(k-3)} , {j-(l-3)})   ]}
%Where nxm is the filter size. In the above equation, i,j=1,2,3, …, N, 
%where NxN is the size of the input image f and output image h.
%range 3 to N-2 for an NxN image ELSE 0
conv1=uint8(zeros(100,100));
conv2=uint8(zeros(100,100));
filtersize=5;


for i=3 : 98
    for j=3 : 98  
    conv1(i,j)= filter1(1)*J(i-2,j-1)+filter1(2)*J(i-1,j-1)+filter1(3)*J(i,j-1)+filter1(4)*J(i+1,j-1)+filter1(5)*J(i+2,j-1)+filter1(6)*J(i-2,j-2)+filter1(7)*J(i-1,j-2)+filter1(8)*J(i,j-2)+filter1(9)*J(i+1,j-2)+filter1(10)*J(i+2,j-2)+filter1(11)*J(i-2,j)+filter1(12)*J(i-1,j)+filter1(13)*J(i,j)+filter1(14)*J(i+1,j)+filter1(15)* J(i+2,j)+filter1(16)*J(i-2,j+1)+filter1(17)*J(i-1,j+1)+filter1(18)*J(i,j+1)+filter1(19)*J(i+1,j+1) +filter1(20)* J(i+2,j+1)+filter1(21)*J(i-2,j+2) + filter1(22)*J(i-1,j+2) +filter1(23)*J(i,j+2) +filter1(24)*J(i+1,j+2) +filter1(25)* J(i+2,j+2); 
    conv2(i,j)= filter2(1)*J(i-2,j-1)+filter2(2)*J(i-1,j-1)+filter2(3)*J(i,j-1)+filter2(4)*J(i+1,j-1)+filter2(5)*J(i+2,j-1)+filter2(6)*J(i-2,j-2)+filter2(7)*J(i-1,j-2)+filter2(8)*J(i,j-2)+filter2(9)*J(i+1,j-2)+filter2(10)*J(i+2,j-2)+filter2(11)*J(i-2,j)+filter2(12)*J(i-1,j)+filter2(13)*J(i,j)+filter2(14)*J(i+1,j)+filter2(15)* J(i+2,j)+filter2(16)*J(i-2,j+1)+filter2(17)*J(i-1,j+1)+filter2(18)*J(i,j+1)+filter2(19)*J(i+1,j+1) +filter2(20)* J(i+2,j+1)+filter2(21)*J(i-2,j+2) + filter2(22)*J(i-1,j+2) +filter2(23)*J(i,j+2) +filter2(24)*J(i+1,j+2) +filter2(25)* J(i+2,j+2); 

    end
end


for i=1 : 100
    for j=1 :100   
        if(i==1||i==2||j==1||j==2||i==99||i==100||j==99||j==100)
            conv2(i,j)= 0;
            conv1(i,j)= 0;
        end
    end
end

imwrite(conv1,'pic2filter1.tif','tiff')
imwrite(conv2,'pic2filter2.tif','tiff')

%PART2^^^^^^^^^^^^^^^^^^^^^^
%***************************************************************************************





d1=double(zeros(1,9)); %(1,i)
%d1=[1 8 28 56 70 56 28 8 1];
sigma=1;%#############################################################################
for i=1 : 9
    dobra=i*i;
    cats=sigma*sigma;
    cats2=dobra/(2*cats);
    d1(1,i)=double(exp(-cats2)); 
end
totalgauss=0;
for i=1 : 9
    totalgauss=totalgauss+d1(1,i);
end

for i=1 : 9
     d1(1,i)= d1(1,i)/totalgauss;
end
birds=0;
for i=1 : 9
    birds=birds+d1(1,i);
end


gausH=uint8(zeros(100,100));


for i=5 : 96
    for j=5 : 96  
         gausH(i,j)= d1(1)*pic2gray(i-4,j)+d1(2)*pic2gray(i-3,j)+d1(3)*pic2gray(i-2,j)+d1(4)*pic2gray(i-1,j)+d1(5)*pic2gray(i,j)+d1(6)*pic2gray(i+1,j)+d1(7)*pic2gray(i+2,j)+d1(8)*pic2gray(i+3,j)+d1(9)*pic2gray(i+4,j);
    end
end
d2=d1;
gausFinal=uint8(zeros(100,100));
for i=5 : 96
    for j=5 : 96  
         gausFinal(i,j)= d2(1)*gausH(i,j-4)+d2(2)*gausH(i,j-3)+d2(3)*gausH(i,j-2)+d2(4)*gausH(i,j-1)+d2(5)*gausH(i,j)+d2(6)*gausH(i,j+1)+d2(7)*gausH(i,j+2)+d2(8)*gausH(i,j+3)+d2(9)*gausH(i,j+4);
    end
end

imwrite(gausFinal,'pic2gaus.tif','tiff')



%If the image is f(i,j) in Matlab, assume that x-axis is along row index i and y-axis is along column index j.
%fx = f(i+1,j)-f(i,j) =  83 – 86 = -3
%fy = f(i,j+1) – f(i,j)= 116-86 = 20
gradMag=zeros(100,100);
gradDir=zeros(100,100);
grad=zeros(100,100,2);
fx=0;
fy=0;
%radient vector: (fx,fy) = (-3,20).
%Gradient magnitude = sqrt(  (-3)^2 + 20^2) =  20.22
%Gradient direction = atan(fy/fx) = atan(20/-3)= 1.42 rads = -81.5 degrees




for i=2 : 98
    for j=2 : 98  
        fx = gausFinal(i+1,j)-gausFinal(i,j);
        fy = gausFinal(i,j+1)-gausFinal(i,j);
        grad(i,j,1)=fx;
        grad(i,j,2)=fy;
        gradMag(i,j)=sqrt(double((fy*fy))+double((fx*fx)));
        gradDir(i,j)=atan(double(fy)/double(fx));
        
    end
end

threshMag=zeros(100,100);
for i=1 : 100
    for j=1 : 100  
       
        if((gradMag(i,j)>=10)&&(gradMag(i,j)<=16))
        threshMag(i,j)=gradMag(i,j);
        end      
    end
end




imwrite(threshMag,'pic2Thresh.tif','tiff')


























 
