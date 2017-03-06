clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window
%**************************************************************************
% Program name:     Poisson.m
% Author:           Victor Tellez
% Date Created:     March 01, 2017
% Last Update:      March 05, 2017
%
%**************************************************************************
NSize = 10000;
lambda = 2;   
NBins = 10;   %NBINS independent trials. 



% R = poissrnd(lambda,[m,n]) generates a random number m-by-n array from 
% the Poisson distribution with mean parameter lambda. 
rndArray = poissrnd( lambda , [1, NSize]);
histogram(rndArray, NBins, 'FaceColor','m');% Plot a histogram
title('\fontsize{20} Samples from Poisson Distribution', 'Color', [0 0 0])

%Experimental
%returns the mean of the elements of A along the first array dimension whose size does not equal 1
MeanData = mean(rndArray);% sample mean
%returns the variance of the elements of A along the first array dimension whose size does not equal 1.
VarData = var(rndArray);% sample variance

%Theoretical 
% [M,V] = poisstat(lambda) also returns the mean M and variance V of 
% the Poisson distribution.
[M, V] = poisstat(lambda);

%maximum likelihood estimate 
% lambdahat = poissfit(data) returns the maximum likelihood estimate of 
% the parameter of the Poisson distribution, given the data data.
param = poissfit(rndArray);











