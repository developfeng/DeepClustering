% Auto-encoder Based Data Clustering
% Demo Code Version 1.0
% 2014.08.13, by Chunfeng Song and Yongzhen Huang

clear all; clc;
%%%% STEP 1.  Set the code params %%%%
forceRestart = false; %if you need to retrain the clustering nets
if forceRestart
    delete('./tmp/*');
end
addpath(genpath(pwd));
Max_epoch = 60;
R_data = 1;
R_cluster = 0.1;%This is default value for MNIST database
netStru = [1000 250 50 10];
%   If you set a netStru = [200 100 30 10], this will ...
%   make an 8 layer deep net with a structure of
%   [inputsDims-200-100-30-10-30-100-200-inputsDims]
withRBMinit = true;
fine_tunning = true;
cur_path = pwd;
VL_path = strcat(cur_path,'\util\vlfeat-0.9.16-bin\vlfeat-0.9.16\toolbox\vl_setup.m');%Set up VL_feat to boost the training;
run(VL_path);
data_path =  strcat(cur_path,'\data\data.mat');
save_path = strcat(cur_path,'\tmp\');
if ~exist(data_path, 'file')
	loadmnist;
    data_path = '.\data\mnistbatch.mat';
else
    load(data_path);
end
[numcases numdims numbatches]=size(batchdata);

%%%% STEP 2.  Pretrain with RBM or randweights %%%%
if withRBMinit
    pretrainnet;
else
    randweights;
end

%%%% STEP 3.  Fine-tunning, this step will cost about 5 hours(for mnist)%%%%
if fine_tunning
    finetuning;
end

%%%% STEP 4.  Clustering %%%%
runclustering;

%%%% STEP 5.  Show clustering results %%%%
showresults;
