%normrnd(..)
clear
close all
clc
NSize = 10000;
sigma = 7;
mu    = 3;
NBins = 100;   %NBINS independent trials. 


% R = normrnd(mu,sigma,[m,n]) generates an m-by-n array of random numbers from 
% the normal distribution with mean parameter mu and standard deviation parameter sigma. 
rndArray = normrnd( mu , sigma , [NSize, 1]);
histogram(rndArray, NBins, 'FaceColor','y');% Plot a histogram
title('\fontsize{20} Samples from Normal Distribution', 'Color', [0 0 0])

%Experimental
%returns the mean of the elements of A along the first array dimension whose size does not equal 1
MeanData = mean(rndArray);% sample mean
%returns the variance of the elements of A along the first array dimension whose size does not equal 1.
VarData = var(rndArray);% sample variance

%Theoretical 
%[M,V] = normstat(mu,sigma) returns the mean of and variance for the normal 
% distribution using the corresponding mean mu and standard deviation sigma. 
[M, V] = normstat(mu,sigma);
%[muhat,sigmahat] = normfit(data) returns an estimate of the mean ? in 
% muhat, and an estimate of the standard deviation ? in sigmahat, of the
%normal distribution given the data in data.
[muhat,sigmahat]= normfit(rndArray);











