function [boreData, holeData] = sevenSegments( ~ )
% Air column, tonehole, and fingering data for a six cylinder structure
% with no side holes.


% Air column radii measurements
boreData = [1e-3*[0  100 200 300 400 500 600 700]; % positions (from input end)
            1e-3*[16  16  24  24  40  40  32  32]];% radii at corresponding points

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tonehole specifications
%
% holeData: Row 1 - positions (from input end)
%           Row 2 - tonehole radii
%           Row 3 - tonehole heights
%           Row 4 - tonehole states (1 = open, 0 = closed)
%           Row 5 - tonehole pad state (1 = pad exists, 0 = no pad
%                ** subsequent rows optional **
%           Row 6 - tonehole pad radii
%           Row 7 - tonehole pad heights (above hole)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

holeData = zeros(5, 0);
