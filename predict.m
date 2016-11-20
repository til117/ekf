% function [mu_bar,sigma_bar] = predict(mu,sigma,u,R)
% This function should perform the prediction step.
% Inputs:
%           mu(t-1)           3X1   
%           sigma(t-1)        3X3
%           u(t)              3X1
%           R                 3X3
% Outputs:   
%           mu_bar(t)         3X1
%           sigma_bar(t)      3X3
function [mu_bar,sigma_bar] = predict(mu,sigma,u,R)
% FILL IN HERE
% Using Alg. 1 and eq. (5) from Lab1 EKF
mu_bar = mu + u;
G = [1 0 -u(2);0 1 u(1); 0 0 1];
sigma_bar = G*sigma*G' + R;
end