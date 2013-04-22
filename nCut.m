% Function to calculate the Normalized Cut of a graph I.
% From the Verma and Meila paper:
% NCut(A,B) = Cut(A,B){(1/Vol(A)) + (1/Vol(B))}
% where NCut(A,B) is minimized. 
% Input is sortedI = I(p,p), the graph I sorted based on the
% sorted Fiedler vector

% Note: Volume portion masked whenever Cut(sortedI,A,B) = 0, but
% it appears the first instance (if any) of 0 may provide the
% optimal cut because that is where the volumes are most
% comparable (among all subsets where Cut(sortedI,A,B) = 0).
% This function operates under the assumption that the first
% instance of 0 is the optimal cut among all 0s.

function [A,B] = nCut(sortedI)

numRows = size(sortedI,1);
cutVector = zeros(1,1);

breakpoint = floor(sqrt(numRows));
for i = 1:breakpoint
    cutVector(i) = 1000000;
end

for j = breakpoint:numRows-breakpoint % ensure nonempty partition
    A = sortedI(1:j,1:j);
    B = sortedI(j+1:numRows,j+1:numRows);
    cutVector(j) = cut(sortedI,j,numRows) *...
        ((1/volume(A)) + (1/volume(B)));
end

[ignore cutPoint] = min(cutVector);
A = sortedI(1:cutPoint,1:cutPoint);
B = sortedI(cutPoint+1:numRows,cutPoint+1:numRows);
