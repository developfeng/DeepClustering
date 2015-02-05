%Run clustering now
cluster_staus_path=strcat(cur_path,'\tmp\cluster_status.mat');
if ~exist(cluster_staus_path, 'file')
    epochnow=1;
    [basis,centro,RL] = randinitial(clusterdata,clustertargets,w1,w2,w3,w4);
else
    load(cluster_staus_path);
end
% initialization
N = size(clusterdata,1);
l1=size(w1,1)-1;
l2=size(w2,1)-1;
l3=size(w3,1)-1;
l4=size(w4,1)-1;
l5=size(w5,1)-1;
l6=size(w6,1)-1;
l7=size(w7,1)-1;
l8=size(w8,1)-1;
l9=l1;

for epoch = epochnow:Max_epoch
    tt=0;
    for batch = 1:N/1000
        fprintf(1,'Clustering epoch %d batch %d\r',epoch,batch);
        % assign each epoch with 1000 batches %
        tt=tt+1;
        cur_data=[];
        cur_basis = [];
        cur_data = clusterdata((((tt-1)*1000+1):tt*1000),:);
        cur_basis = basis((((tt-1)*1000+1):tt*1000),:);        
        % Perform CG  with 3 linearsearch %
        max_iter=3;
        VV = [w1(:)' w2(:)' w3(:)' w4(:)' w5(:)' w6(:)' w7(:)' w8(:)']';
        Dim = [l1; l2; l3; l4; l5; l6; l7; l8; l9];
        [X, fX] = minimize(VV,'CG_CLUSTER',max_iter,Dim,cur_data,cur_basis,R_data,R_cluster);        
        % updata cluster weights %
        w1 = reshape(X(1:(l1+1)*l2),l1+1,l2);
        xxx = (l1+1)*l2;
        w2 = reshape(X(xxx+1:xxx+(l2+1)*l3),l2+1,l3);
        xxx = xxx+(l2+1)*l3;
        w3 = reshape(X(xxx+1:xxx+(l3+1)*l4),l3+1,l4);
        xxx = xxx+(l3+1)*l4;
        w4 = reshape(X(xxx+1:xxx+(l4+1)*l5),l4+1,l5);
        xxx = xxx+(l4+1)*l5;
        w5 = reshape(X(xxx+1:xxx+(l5+1)*l6),l5+1,l6);
        xxx = xxx+(l5+1)*l6;
        w6 = reshape(X(xxx+1:xxx+(l6+1)*l7),l6+1,l7);
        xxx = xxx+(l6+1)*l7;
        w7 = reshape(X(xxx+1:xxx+(l7+1)*l8),l7+1,l8);
        xxx = xxx+(l7+1)*l8;
        w8 = reshape(X(xxx+1:xxx+(l8+1)*l9),l8+1,l9);
    end
    epochnow = epoch+1;
    CL = getclusterlabel(clusterdata,centro,w1,w2,w3,w4);%get clustering label
    savetxtdata(epoch,RL,CL,cur_path);%computing NMI,Purity,Accuracy and then saved as '*.txt' file
    [basis,centro] = updategroup(clusterdata,CL,clustertargets,w1,w2,w3,w4);%updating clustering centre for next epoch
    save(cluster_staus_path,'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8', 'RL', 'CL', 'epochnow', 'basis', 'centro');
end



