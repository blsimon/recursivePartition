% Method to calculate the Min Cut of a graph I: 
% MinCut(A,B) = Cut(A,B) 
% where MinCut is minimized. 
% Input is sortedI = I(p,p), the graph I sorted based on the
% sorted Fiedler vector

function [A,B] = minCut(sortedI)

numRows = size(sortedI,1);
cutVector = zeros(1,1);

breakpoint = floor(sqrt(numRows));
for i = 1:breakpoint
    cutVector(i) = 1000000;
end

for j = breakpoint:numRows-breakpoint % ensure nonempty partition
    cutAB = cut(sortedI,j,numRows);
    cutVector(j) = cutAB;
end

[ignore cutPoint] = min(cutVector);
A = sortedI(1:cutPoint,1:cutPoint);
B = sortedI(cutPoint+1:numRows,cutPoint+1:numRows);
