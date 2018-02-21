%Outline of algorithm:  Sum of Squared Differences (SSD):  
%Let the two images be R(M,N) and L(M,N)
%Computing Z(M/8,N/8) for 8x8 image tiles.

%Z= 787.4;
f=552.45 ;% find this in calibration step
b=150; %
%M=480;
%N=640;

R  = imread('GrayL.jpg');
L  = imread('GrayR.jpg');

[M,N] = size(L);
Z=zeros(M/8,N/8);
for m=1 :(M/8)     
     r = (m-1)*8;     % row index of pixels in R and L
     
	for n=1 : (N/8) 
           c = (n-1)*8; % column index of pixels in R
           for d=1 : (N-8)  %matching position
                    SSD(d) =0;  % computer SSD for 8x8 sub-image tiles
                    for p=1 : 8
                            for q=1 : 8
                                SSD(d) = SSD(d) +  ( R(r+p,c+q)- L(r+p,d+q-1) ).^2;
                            end
                    end
                % find dmin  corresponding to min SSD
                    if (d==1)  
                        minssd = SSD(1);
                        dmin =d;
                    end

                    if(SSD(d)<minssd)
                            minssd = SSD(d);
                            dmin = d;
                    end
           end % d for loop
        
           disp = c+1-dmin; % disparity
           Z(m,n) = ( f * b ) / disp;  % perspective projection equation
  
           xim = c+(8/2)-(N/2);  % convert column index c to x image coordinate. Center of tile is at (8/2,8/2).
           yim = (M/2)-(r+8/2);   % convert row index r to y image coordinate. Center of tile is at (8/2,8/2)

           X(m,n) = (Z(m,n) * xim)/f;  % perspective projection equation
           Y(m,n) = (Z(m,n) * yim)/f;    % perspective projection equation
end % n

end % m

