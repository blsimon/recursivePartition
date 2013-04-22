% Overhead method with parameters limited to the essential information
% required from the user which appropriately assigns all other necessary
% parameters for method recursivesort

function [partitions,index] = recursiveNormalized(A,n)

sizeA = size(A,1);
partitions = zeros(2,1);
i = 1;
temp = 0;
index = zeros(sizeA,1);
index(1:sizeA) = 1:sizeA;
constant = 0;
j = 1;

[sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveNormalizedSort(A,n,partitions,i,temp,index,constant,j);

ind = find(index==0);
amt = numel(ind);
for(k = 0:amt);
    [row,col] = find(index==0,1,'first');
    index(row,col) = index(row,col-1);
end
num = numel(partitions);
if partitions(num) > sizeA;
    partitions = partitions(1:num-1);
end