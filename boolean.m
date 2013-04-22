% Function to update the vector indexing the start of partitions

function [i,partitions,temp] = boolean(partitions,boolean1,...
    boolean2,i,sizepartition1,sizepartition2,temp,n)

if i == 1;
    partitions(1) = 1;
end
if boolean1 == 1 && boolean2 == 1;
    i = i+1;
    partitions(i) = partitions(i-1) + sizepartition1;
    i = i+1;
    partitions(i) = partitions(i-1) + sizepartition2;
elseif boolean1 == 1; % && boolean2 == 0;
    i = i+1;
    partitions(i) = partitions(i-1) + sizepartition1;
elseif boolean2 == 1; % && boolean1 == 0;
    if sizepartition1 > n
        temp = sizepartition2;
    else
        if temp > 0
            i = i+1;
            partitions(i) = partitions(i-1) + temp;
            temp = 0;
        end
    end
end