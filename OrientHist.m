function hist = OrientHistGen(MIN_COH,MIN_ENERGY)
% Generates the orientation histogram on user selected image.
% Can set minimum coherency/energy as values from 0 to 1.
% Output histogram is a vector of distribution of orientations from -90 to
% 89 degrees.
% MIJ plugin must be installed and ImageJ must be started from MATLAB


% Perform Orientation Analysis on specified image
MIJ.run('Open...');
MIJ.run('OrientationJ Analysis', 'log=0.0 tensor=1.0 gradient=0 energy=on orientation=on coherency=on harris-index=on s-distribution=on hue=Gradient-X sat=Gradient-X bri=Gradient-X ');

% Import Energy/Coherency/Orientation Images to matrices
energy = MIJ.getImage('Energy-1');
coherency = MIJ.getImage('Coherency-1');
orientation = MIJ.getImage('Orientation-1');

% Close the above windows
MIJ.selectWindow('Energy-1');
MIJ.run('Close');
MIJ.selectWindow('Coherency-1');
MIJ.run('Close');
MIJ.selectWindow('Orientation-1');
MIJ.run('Close');

% Round orientation to integer values of degrees
orientation = round(orientation);

% Ignore pixels that don't meet the energy/coherency requirements
coherency(energy < .02) = 0;
coherency(energy < MIN_ENERGY) = 0;
coherency(coherency < MIN_COH) = 0;

hist = zeros(180,1);

% Calculate Histogram
for ii = -90:1:89
    hist(ii+91) = sum(sum(coherency(orientation == ii)));
end

end
