% Use this function to perform a recursive partitioning of a data matrix, A, associated
% with a graph until partitions are reduced to a user-specified size, n
% partitions is an mx1 (m = size(A,1)) column matrix of zeros which will be filled with
% the beginning location of each partition (initialize as partitions = zeros(2,1)
% and will expand to the necessary size vector), i is a counter to be
% initialized at 1, index is a vector to be initialized by index = zeros(sizep,1),
% index(1:sizep) = 1:sizep where sizep is the known size of the original
% graph, constant is an integer to be added to the elements of the vector p
% for updating index with the node ordering, constant is to be initialized
% at 0

function [sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveMinCutSort(A,n,partitions,i,temp,index,constant,j)
j = j+1;

[p,g1,g2] = fiedlerMinCutSort(A);

[index] = updateVector(p,index,constant,j);
p;
sizepartition1 = size(g1,1);
sizepartition2 = size(g2,1);
if sizepartition1 > n && sizepartition2 > n
    boolean1 = 0;
    boolean2 = 0;
    [i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
    [sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveMinCutSort(g1,n,partitions,i,temp,index,constant,j);
    %[i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
    [constant] = find(index(:,j+1)==0,1,'first');
    constant = constant-1;
   
    [sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveMinCutSort(g2,n,partitions,i,temp,index,constant,j);
   % [constant,j] = find(index==0,1,'first');
   % j=j+1;
elseif sizepartition1 > n
    boolean1 = 0;
    boolean2 = 1;
    [i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
    [sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveMinCutSort(g1,n,partitions,i,temp,index,constant,j);
    [i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
elseif sizepartition2 > n;
    boolean1 = 1;
    boolean2 = 0;
    constant = constant + sizepartition1;
    [i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
    [sizepartition1,sizepartition2,partitions,i,index,constant] = recursiveMinCutSort(g2,n,partitions,i,temp,index,constant,j);
else
    boolean1 = 1;
    boolean2 = 1;
    [i,partitions,temp] = boolean(partitions,boolean1,boolean2,i,sizepartition1,sizepartition2,temp,n);
   % boolean1 = 0;
    %boolean2 = 0;
end
