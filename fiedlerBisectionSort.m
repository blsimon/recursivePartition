% Use this function to partition graph data into two parts based upon the
% sorted Fiedler vector
% p is a vector of the sorted indices of the graph matrix into partitions
% A is an adjacency matrix for the graph to be partitioned
% Use spy(A(p,p)); to see partition

function [p,p1,p2,g1,g2] = fiedlerBisectionSort(A)
L = laplacian(A);
[v,d] = fiedler(L);
[ignore p] = sort(v);
sizep = size(v,1);
sizepartition = ceil(sizep./2);
p1 = p(1:sizepartition);
p2 = p(sizepartition+1:size(v,1));
g1 = A(p1,p1);
g2 = A(p2,p2);