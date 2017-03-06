clear % Remove any exsiting variables in the workspace
close all % Close all figure windows
clc % Clear Command Window
%**************************************************************************
% Program name:     Beta.m
% Author:           Victor Tellez
% Date Created:     March 01, 2017
% Last Update:      March 05, 2017
%
%**************************************************************************

A = 700; 
B = 300;
NBins = 100;    %Number of Bins on histogram X_AXIS 
NSize = 10000;  % The number of random numbers from the binomial 
                % distribution with parameters NTrials and P that we want



% R = betarnd(A,B,[m,n]) generates an m-by-n array containing random 
% numbers from the beta distribution with parameters A and B.
rndArray = betarnd( A , B , [NSize, 1]);
histogram(rndArray, NBins, 'FaceColor','r');% Plot a histogram
title('\fontsize{20} Samples from Beta Distribution', 'Color', [0 0 0])


%Experimental
%returns the mean of the elements of A along the first array dimension whose size does not equal 1
MeanData = mean(rndArray);% sample mean
%returns the variance of the elements of A along the first array dimension whose size does not equal 1.
VarData = var(rndArray);% sample variance


%Theoretical 
%[M,V] = betastat(A,B), with A>0 and B>0
% returns the mean and variance for the beta distribution with parameters 
% specified by A and B. 
[M, V] = betastat(A, B);

%Beta parameter estimates
% phat = betafit(data) computes the maximum likelihood estimates of 
% the beta distribution parameters a and b from the data in the vector data 
% and returns a column vector containing the a and b estimates
param = betafit(rndArray);











