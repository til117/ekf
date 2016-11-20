% function [c,outlier, nu, S, H] = associate(mu_bar,sigma_bar,z_i,M,Lambda_m,Q)
% This function should perform the maximum likelihood association and outlier detection.
% Note that the bearing error lies in the interval [-pi,pi)
%           mu_bar(t)           3X1
%           sigma_bar(t)        3X3
%           Q                   2X2
%           z_i(t)              2X1
%           M                   2XN
%           Lambda_m            1X1
% Outputs: 
%           c(t)                1X1
%           outlier             1X1
%           nu^i(t)             2XN
%           S^i(t)              2X2XN
%           H^i(t)              2X3XN
function [c,outlier, nu, S, H] = associate(mu_bar,sigma_bar,z_i,M,Lambda_m,Q)
% FILL IN HERE
% Using Alg. 2 from Lab1 EKF
n = length(M);
nu = zeros(2,n);
S = zeros(2,2,n);
H = zeros(2,3,n);
psi = zeros(1,n);
D = zeros(1,n);
for j=1:n
   z_h = observation_model(mu_bar,M,j);
   H(:,:,j) = jacobian_observation_model(mu_bar,M,j,z_h,1);
   S(:,:,j) = H(:,:,j)*sigma_bar*H(:,:,j)' + Q;
   nu(:,j) = z_i-z_h;
   nu(2,j) = mod(nu(2,j)+pi,2*pi)-pi;
   D(j) = nu(:,j)'/S(:,:,j)*nu(:,j);
   psi(j) = sqrt(det(2*pi*S(:,:,j)))^(-1)*exp(-1/2*D(j));
end
[~, c] = max(psi);
outlier = D(c) > Lambda_m;
end