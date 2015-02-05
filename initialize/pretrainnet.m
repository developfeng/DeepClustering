%pretrain the nets with RBM
weiths_path=strcat(save_path, 'rbm_weights.mat');
if exist(weiths_path, 'file')
    load rbm_weights;
    return;
end
epochnow = 1;
maxepoch=10;%Set the max epoch for training RBM weights here
Layernum = length(netStru);
fprintf(1,'Pretraining a deep autoencoder. \n');

[numcases numdims numbatches]=size(batchdata);
for i = 1:Layernum    
    fprintf(1,'Pretraining Layer %d with RBM: %d-%d \n',i, numdims,netStru(i));
    restart=1;
    numhid=netStru(i);
    rbm;
    eval(['w',num2str(i), ' = ', '[vishid ;hidbiases ];']);
    vishid_T= vishid';
    eval(['w',num2str(Layernum*2 - i + 1), ' = ', '[vishid_T;visbiases ];']);
    batchdata=batchposhidprobs;
end

save(weiths_path, 'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8');

