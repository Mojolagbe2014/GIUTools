function plotGaussF(handles)
%   Plot gaussian function using gauss()
%
%          Author: Mojolagbe Jamiu


%% set parameters
x0 = 1; 

% get width from the slider
a = handles.widthSlider.Value;

xmin = -5;
xmax = +5;
Nx = 300;


% 1: plot function, 2: plot derivative, 3: plot both
% get the plot type from the button field
buttonStr = handles.plotButtonGroup.SelectedObject.String; 

% get option to turn grid on/off from checkbox
doGrid = handles.gridCheckBox.Value;


%% tabulate function
x = linspace(xmin, xmax, Nx);
[g, dgdx]= gauss(x, x0, a);


%% plot result
switch buttonStr
    case 'Function'  % plot function
            plot(handles.plotAxes, x, g);
            ylabel(handles.plotAxes, 'g(x)');
            
    case 'Derivative'  % plot derivative
            plot(handles.plotAxes, x, dgdx);
            ylabel(handles.plotAxes, 'dg/dx');
            
    case 'Both'  % plot both
            plot(handles.plotAxes, x, g, x, dgdx);
            legend(handles.plotAxes, 'g(x)', 'dg/dx');
end

handles.plotAxes.XTick = [xmin:xmax];

xlabel(handles.plotAxes, 'x');
title(handles.plotAxes, 'Gaussian');

if doGrid
    grid(handles.plotAxes, 'on');
else
    grid(handles.plotAxes, 'off');
end