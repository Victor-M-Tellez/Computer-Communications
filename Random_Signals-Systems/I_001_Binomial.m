clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window
%**************************************************************************
% Program name:     Binomial.m
% Author:           Victor Tellez
% Date Created:     March 01, 2017
% Last Update:      March 05, 2017
%
%**************************************************************************
p = .7;          % probability of success for each trial 0 ? p ? 1
NTrials = 10;    % the number of trials
NSize = 10000;   % The number of random numbers from the binomial 
                 % distribution with parameters NTrials and P that we want


% R = binornd(N,P,[m,n])generates an m-by-n array containing random numbers 
% from the binomial distribution with parameters N and P. 
rndArray = binornd( NTrials , p ,[ NSize, 1]);
histogram(rndArray, NTrials, 'FaceColor','g');%Plot a histogram
title('\fontsize{20}  Samples from Binomial Distribution', 'Color', [0 0 0])

%Experimental
%returns the mean of the elements of A along the first array dimension whose size does not equal 1
MeanData = mean(rndArray);% sample mean
%returns the variance of the elements of A along the first array dimension whose size does not equal 1.
VarData = var(rndArray);% sample variance

%Theoretical 
% [M,V] = binostat(N,P) returns the mean of and variance for the binomial distribution 
[M, V] = binostat(NSize, p);% sample mean & variance

%Binomial parameter estimates
% phat = binofit(x,n) returns a maximum likelihood estimate of the 
% probability of success in a given binomial trial based on
%       x==rndArray -->> the number of successes; observed in
%       n==NTrials  -->> independent trials. 
param = binofit(rndArray, NTrials);
