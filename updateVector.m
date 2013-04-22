% Function to update the universal ordering vector of the
% nodes at each level of recursion.
% constant is the constant to add to the elements of
% vector p in order to update the vector index properly.
% constant is related to the size of the partition

function [index] = updateVector(p,index,constant,j)
sizep = size(p,1);
constp = p + constant;
for k = 1:sizep;
    index(constant+k,j) = index(constp(k),j-1);
end
ind = find(index(1:constant,:)==0);
amt = numel(ind);
for k = 0:amt;
    [row,col] = find(index(1:constant,:)==0,1,'first');
    index(row,col) = index(row,col-1);
end