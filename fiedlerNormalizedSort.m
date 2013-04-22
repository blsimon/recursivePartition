% Use this function to partition graph data into two parts based upon the
% sorted Fiedler vector
% p is a vector of the sorted indices of the graph matrix into partitions
% I is an adjacency matrix for the graph to be partitioned
% Use spy(I(p,p)); to see partition
% A and B are the optimal subsets of the graph I based on Normalized Cut

function [p,A,B] = fiedlerNormalizedSort(I)
L = laplacian(I);
v = fiedler(L);

[ignore p] = sort(v);
sortedI = I(p,p);
[A B] = nCut(sortedI);
