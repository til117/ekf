% function [mu,sigma,R,Q,Lambda_M] = init()
% This function initializes the parameters of the filter.
% Outputs:
%			mu(0):			3X1
%			sigma(0):		3X3
%			R:				3X3
%			Q:				2X2
function [mu,sigma,R,Q,Lambda_M] = init()
mu = [0;0;0]; % initial estimate of state
sigma = 1e-10*diag([1 1 1]); % initial covariance matrix
delta_m = 1; % default: 0.999
Lambda_M = chi2inv(delta_m,2);
% Fill In This Part
% Parameter setting/tuning - Depends on problem (section 3.3 in Lab1 EKF)
% Data set 1
% R = (1)^2 * eye(3);
% Q = (0.3)^2 * eye(2);
% Data set 2
% R = (0.01)^2 * eye(3);
% Q = (0.2)^2 * eye(2);
% Data set 3
R = (1)^2 * eye(3);
Q = (0.1)^2 * eye(2);
end