% plotGauss.m
%   Plot gaussian function using gauss()
%
%          Author: Mojolagbe Jamiu


%% set parameters
x0 = 1;
a = 1;  % width
xmin = -5;
xmax = 5;
Nx = 300;


iPlotChoice = 1; % 1: plot function, 2: plot derivative, 3: plot both

%% tabulate function
x = linspace(xmin, xmax, Nx);
[g, dgdx]= gauss(x, x0, a);


%% plot result
switch iPlotChoice
    case 1  % plot function
            plot(x, g);
            ylabel('g(x)');
            
    case 2  % plot derivative
            plot(x, dgdx);
            ylabel('dg/dx');
            
    case 3  % plot both
            plot(x, g, x, dgdx);
            legend('g(x)', 'dg/dx');
end

grid on
xlabel('x');
title('Gaussian');