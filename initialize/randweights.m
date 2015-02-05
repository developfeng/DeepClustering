%rand weights to achieve a quick start of clustering
weiths_path=strcat(save_path, 'rand_weights.mat');
if exist(weiths_path, 'file')
    load rand_weights;
    return;
end

l1=numdims;
l2=netStru(1);
l3=netStru(2);
l4=netStru(3);
l5=netStru(4);

bound = 4*sqrt(6/(l1+l2));
w1 = -bound + 2*bound*rand(l1, l2);
w8 = w1';
bound = 4*sqrt(6/(l2+l3));
w2 = -bound + 2*bound*rand(l2, l3);
w7 = w2';
bound = 4*sqrt(6/(l3+l4));
w3 = -bound + 2*bound*rand(l3, l4);
w6 = w3';
bound = 4*sqrt(6/(l4+l5));
w4 = -bound + 2*bound*rand(l4, l5);
w5 = w4';

s = rand(1,size(w1,2));
w1 = [w1;s];
s = rand(1,size(w2,2));
w2 = [w2;s];
s = rand(1,size(w3,2));
w3 = [w3;s];
s = rand(1,size(w4,2));
w4 = [w4;s];

s = rand(1,size(w5,2));
w5 = [w5;s];
s = rand(1,size(w6,2));
w6 = [w6;s];
s = rand(1,size(w7,2));
w7 = [w7;s];
s = rand(1,size(w8,2));
w8 = [w8;s];

save(weiths_path, 'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8');