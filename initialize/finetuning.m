% if need additional fine tuning, this code is sourced from the code shared by Geoff Hinton and Ruslan Salakhutdinov.

% Version 1.000
%
% Code provided by Geoff Hinton and Ruslan Salakhutdinov
%
% Permission is granted for anyone to copy, use, modify, or distribute this
% program and accompanying programs and documents for any purpose, provided
% this copyright notice is retained and prominently displayed, along with
% a note saying that the original programs are available from our
% web page.
% The programs and documents are distributed without any warranty, express or
% implied.  As the programs were written for research purposes only, they have
% not been tested to the degree that would be advisable in any important
% application.  All use of these programs is entirely at the user's own risk.

% We slightly edit this version here to fit our code.
batch_path =  strcat(cur_path,'\data\mnistbatch.mat');
weiths_path=strcat(save_path, 'fine_weights.mat');
maxepoch=200;
epochnow = 1;
if exist(weiths_path, 'file')
    load(weiths_path);
    if epochnow ==maxepoch
        return;
    end
end
load(batch_path);
[numcases numdims numbatches]=size(batchdata);

fprintf(1,'\nFine-tuning deep autoencoder by minimizing cross entropy error. \n');
fprintf(1,'60 batches of 1000 cases each. \n');
%%%%%%%%%% END OF PREINITIALIZATIO OF WEIGHTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l1=size(w1,1)-1;
l2=size(w2,1)-1;
l3=size(w3,1)-1;
l4=size(w4,1)-1;
l5=size(w5,1)-1;
l6=size(w6,1)-1;
l7=size(w7,1)-1;
l8=size(w8,1)-1;
l9=l1;
for epoch = epochnow:maxepoch
    tt=0;
    for batch = 1:numbatches/10
        fprintf(1,'Fine-tuning epoch %d batch %d\r',epoch,batch);
        %%%%%%%%%%% COMBINE 10 MINIBATCHES INTO 1 LARGER MINIBATCH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tt=tt+1;
        data=[];
        for kk=1:10
            data=[data;batchdata(:,:,(tt-1)*10+kk)];
        end
        max_iter=3;
        VV = [w1(:)' w2(:)' w3(:)' w4(:)' w5(:)' w6(:)' w7(:)' w8(:)']';
        Dim = [l1; l2; l3; l4; l5; l6; l7; l8; l9];
        [X, fX] = minimize(VV,'CG_DATA',max_iter,Dim,data);
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
    epochnow=epoch+1;
    save(weiths_path, 'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8','epochnow');
end




