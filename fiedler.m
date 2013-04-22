% Function to generate the Fiedler value and corresponding 
% Fiedler vector (second smallest eigenvalue and eigenvector)
% for the given Laplacian matrix L. d is the Fiedler value, v
% is the sorted Fiedler vector

function [v d] = fiedler(L)

[V D] = eigs(L,2,'sa');
if D(2,2) < .5
    d = D(2,2);
    v = V(:,2);
else
    [V D] = eigs(L,size(L,1)-1,'sa');
    [row,col] = find(floor(D)>0,1,'first');
    d = D(row,row);
    v = V(:,row);
end
