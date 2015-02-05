% Load MNIST digit dataset and convert into the format for clustering code.
data_path =  strcat(cur_path,'\data\mnistdata.mat');
batch_path =  strcat(cur_path,'\data\mnistbatch.mat');
if ~exist(batch_path, 'file')
    converter;
    makebatches;
    save(batch_path,'batchdata','batchtargets');
    [clusterdata,clustertargets]=batch2data(batchdata,batchtargets);
    save(data_path, 'clusterdata', 'clustertargets');
else
    load(batch_path);
    load(data_path);
end
