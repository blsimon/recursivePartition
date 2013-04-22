% Preprocessing of the adjacency matrix A of a graph to produce
% a symmetric matrix, VSsims, of the cosine similarities of
% V, the right singular vector of A, and S, the singular values
% of A. VSsims is then thresholded into a sparse symmetric
% matrix, VSsims_t,  by eliminating those values of VSsims which
% are effectively 0. This implementation uses a threshold of 0.2

function [VS, VSsims_t] = preprocess2(A)

t = 0.2;
k = 30;

[num_terms,num_documents] = size(A);

[U,S,V] = svds(A,k);
VS = V*S;

for j = 1:num_documents
    VS(j,:) = VS(j,:) / norm(VS(j,:),2);
end
VSsims = VS*VS';
VSsims_thresh = VSsims > .2;
VSsims_new = VSsims.*VSsims_thresh;
VSsims_t = sparse(VSsims_new);