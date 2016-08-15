% demoWaitBar.m
%   If part of a calculation takes a while  
%   inform the user the progress of the 
%   by using waitbar
%
%          Author: Mojolagbe Jamiu


Nt = 1000;
hwb = waitbar(0, 'Calculating ...', 'Name', 'Time Marching');
for it = 1:Nt
    % serious computation takes place here, simulated by 
    pause(0.005);
    waitbar(it/Nt, hwb);
end
close(hwb);