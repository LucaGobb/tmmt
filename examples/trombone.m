% A matlab script used to compute the theoretical input impedance
% of a trombone (as defined in a separate geometry file)
% using the TMM approach.
%
% by Luca Gobbato, Politecnico di Milano, 2021
% original toolkit: Gary P. Scavone, McGill University, 2021.

clear; clf;
lossy = true; % turn on/off losses
endType = 1;   % 0 = closed, 1 = unflanged, 2 = flanged, 3 = ideally open

% Evaluation frequencies
fmax = 1200;         % maximum evaluation frequency (Hz)
N = fmax;             % number of frequencies for evaluation (even)
finc = fmax / (N-1);
f = eps:finc:fmax;
omega = 2*pi*f.';

% Include path to needed scripts
addpath( '../', '../geometries/' );
load('tromboneBore.mat');

% Physical constants
T = 20;   % temperature (C)
[c, rho, CST] = physicalSettings( T );
k = omega / c;
if ~lossy
  CST = 0;
end

% Get  geometry data
figure(1)
% drawBore 'keefeFlute'; % todo
plot(sampledCurve(:,1),sampledCurve(:,2));
boreData = 1e-3* sampledCurve';
holeData = zeros(6, 0); % no hole present in the trombone
title('Tenor trombone bore profile');

pause()
figure(2)
drawBore( [], [], boreData, holeData )

if isempty( boreData )
  return;
end

pause()
%%
% Do TMM calculations and plot
figure(3)
plotTypes = [1 2];
Zin = tmm( boreData, holeData, rho, c, k, CST, endType );
rzplot( f, Zin, plotTypes, true, false, [], 'b-', [], true); % with time-domain smoothing
% xlim([0 100]);
subplot(numel(plotTypes), 1, 1)
title('Input Impedance of a tenor trombone.')
ylim([-40 40])