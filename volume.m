% Method to calculate the volume of a set A within a preprocessed graph I. 
% Vol A is defined as the sum of the degrees of all nodes i within the set
% A, where degree is defined as the sum of the similarities between all 
% nodes i and j within the graph I.

function vol = volume(A)

vol = 0;
numRows = size(A,1);

for i = 1:numRows
    vol = vol + degree(A,i);
end

