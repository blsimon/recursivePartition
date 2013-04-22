% Use this function for initial partitioning of graph data into two parts based upon the
% sorted Fiedler vector
% p is a vector of the sorted indices of the graph matrix into partitions
% A is an adjacency matrix for the graph to be partitioned
% Use spy(A(p,p)); to see partition

function [p,p1,p2,g1,g2,v] = fiedlerNormalizedNonrecursiveSort(A)
L = laplacian(A);
[v,d] = fiedler(L);

% calculate the standard deviation of the vector of eigenvalues for use in
% thresholding before partitioning
sdev = std(v);

% threshold based on values within 1 standard deviation of the vector
v = v(abs(v) > sdev)
[ignore p] = sort(v);
sizep = size(v,1);
diffs = diff(ignore);
cutPoint = find(diffs==max(diffs));
p1 = p(1:cutPoint);
p2 = p(cutPoint+1:size(v,1));
g1 = A(p1,p1);
g2 = A(p2,p2);