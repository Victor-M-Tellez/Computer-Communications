%binornd(..)
clear
close all
clc
NSize = 10000;
p1 = .7;
NBins = 10;   %NBINS independent trials. 

rndArray = binornd( NBins , p1 , NSize, 1);
histogram(rndArray, NBins);%---------------------------------------------Plot a histogram
title('Samples from Binomial Distribution', 'Color', [.27 .89 .76])

MeanData = mean(rndArray);% sample mean
VarData = var(rndArray);% sample variance

%Theoretical 
[mu, var] = binostat(NSize, p1);
param = binofit(rndArray, NBins);





