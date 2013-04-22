% Function to produce the corresponding Laplacian matrix, L,
% from the adjacency matrix, A, of an undirected graph.
% L is the laplacian matrix given by L = D - A where D is
% the diagonal matrix of the degree of each node ie the 
% sum of each row or column of A

function L = laplacian(A)

D = diag(sum(A));
L = D - A;