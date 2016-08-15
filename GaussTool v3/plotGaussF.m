function plotGaussF(handles)
%   Plot gaussian function using gauss()
%
%          Author: Mojolagbe Jamiu


%% set parameters
% center of gauss graph
x0 = handles.centerSlider.Value;

% get width from the slider
a = handles.widthSlider.Value;

xmin = -5;
xmax = +5;
Nx = 300;


% 1: plot function, 2: plot derivative, 3: plot both
% get the plot type from the popup field
iPlotChoice = handles.plotPopup.Value; 

% get option to turn grid on/off from checkbox
doGrid = handles.gridCheckBox.Value;


%% tabulate function
x = linspace(xmin, xmax, Nx);
[g, dgdx]= gauss(x, x0, a);


%% plot result
switch iPlotChoice
    case 1  % plot function
            plot(handles.plotAxes, x, g);
            ylabel(handles.plotAxes, 'g(x)');
            
    case 2  % plot derivative
            plot(handles.plotAxes, x, dgdx);
            ylabel(handles.plotAxes, 'dg/dx');
            
    case 3  % plot both
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

isScaleLocked = handles.lockScaleButton.Value;
if isScaleLocked
    axisScaling = getappdata(gcf, 'AxisScaling');
    axis(handles.plotAxes, axisScaling);
end
    