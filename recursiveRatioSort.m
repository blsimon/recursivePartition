% Function to perform a recursive partitioning of a data matrix,
% A, associated with a graph until partitions are reduced to a
% user-specified maximum size, n. Initialization of all other
% parameters is handled in recursiveRatio.m

function [sizepartition1,sizepartition2,partitions,i,index,...
    constant] = recursiveRatioSort(A,n,partitions,i,temp,...
    index,constant,j)

j = j+1;

[p,g1,g2] = fiedlerRatioSort(A);
[index] = updateVector(p,index,constant,j);
sizepartition1 = size(g1,1);
sizepartition2 = size(g2,1);
if sizepartition1 > n && sizepartition2 > n
    boolean1 = 0;
    boolean2 = 0;
    
    [i,partitions,temp] = boolean(partitions,boolean1,...
        boolean2,i,sizepartition1,sizepartition2,temp,n);
    
    [sizepartition1,sizepartition2,partitions,i,index,...
        constant] = recursiveRatioSort(g1,n,partitions,...
        i,temp,index,constant,j);
    
    [constant] = find(index(:,j+1)==0,1,'first');
    constant = constant-1;
    
    [sizepartition1,sizepartition2,partitions,i,index,...
        constant] = recursiveRatioSort(g2,n,partitions,...
        i,temp,index,constant,j);
    
elseif sizepartition1 > n
    boolean1 = 0;
    boolean2 = 1;
    
    [i,partitions,temp] = boolean(partitions,boolean1,...
        boolean2,i,sizepartition1,sizepartition2,temp,n);
    
    [sizepartition1,sizepartition2,partitions,i,index,...
        constant] = recursiveRatioSort(g1,n,partitions,...
        i,temp,index,constant,j);
    
    [i,partitions,temp] = boolean(partitions,boolean1,...
        boolean2,i,sizepartition1,sizepartition2,temp,n);
    
elseif sizepartition2 > n;
    boolean1 = 1;
    boolean2 = 0;
    constant = constant + sizepartition1;
    
    [i,partitions,temp] = boolean(partitions,boolean1,...
        boolean2,i,sizepartition1,sizepartition2,temp,n);
    
    [sizepartition1,sizepartition2,partitions,i,index,...
        constant] = recursiveRatioSort(g2,n,partitions,...
        i,temp,index,constant,j);
else
    boolean1 = 1;
    boolean2 = 1;
    
    [i,partitions,temp] = boolean(partitions,boolean1,...
        boolean2,i,sizepartition1,sizepartition2,temp,n);
    
   % boolean1 = 0;
    %boolean2 = 0;
end