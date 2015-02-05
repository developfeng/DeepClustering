function [clusterdata,clustertargets]=batch2data(batchdata,batchtargets)
%this function can convert batch-like data(3 dims) into data-like(2 dims) one.
[numcases numdims numbatches]=size(batchdata);
numcluster = size(batchtargets,2);
clusterdata = zeros(numcases*numbatches,numdims);
clustertargets = zeros(numcases*numbatches,numcluster);
for i = 1:numbatches
    clusterdata((i-1)*numcases+1:i*numcases,:) = batchdata(:,:,i);
    clustertargets((i-1)*numcases+1:i*numcases,:) = batchtargets(:,:,i);
end
