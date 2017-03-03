
clear
close all
clc
NSize = 10000;
A=700;
B=300;
NBins = 50;   %NBINS independent trials. 


%betabinomrnd =binornd(NBins,betarnd(A,B,1,NSize));
rndArray = binornd(NBins,betarnd(A,B,1,NSize));
histogram(rndArray, NBins, 'FaceColor','b');% Plot a histogram
title('\fontsize{20} Samples from Beta-Binomial Distribution', 'Color', [0 0 0])


%Experimental
%returns the mean of the elements of A along the first array dimension whose size does not equal 1
MeanData = mean(rndArray);% sample mean
%returns the variance of the elements of A along the first array dimension whose size does not equal 1.
VarData = var(rndArray);% sample variance


%Theoretical 
%[mu, var] = binostat(NSize, p1);
%param = binofit(rndArray, NBins);











