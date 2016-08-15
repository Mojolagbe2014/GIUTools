function [g, dgdx]= gauss(x, x0, a)
%
% gauss     Normalize gaussian function
%           g = gauss(x, x0, a) returns the value
%       	of a normalized guassian evaluated at x
%       	centered at x0 with width a
%
%               Author: Mojolagbe Jamiu


%% simplify 
prefactor = 1/(a*sqrt(2*pi));

%% evaluate function
g = prefactor*exp( -(x - x0).^2 /(2*a^2));



%% evaluate derivative
dx = (1e-4)*a;
xp = x + dx/2;
xm = x - dx/2;

gp = prefactor*exp(-(xp-x0).^2 / (2*a^2));
gm = prefactor*exp(-(xm-x0).^2 / (2*a^2));

dgdx = (gp -gm)/dx;
