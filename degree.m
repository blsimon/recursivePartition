% Method to calculate the degree of a node i within a graph I. 
% Degree is defined as the sum of the similarities between node and all
% other nodes within the graph I.

function deg = degree(I, node)

deg = sum(I(node,:));
