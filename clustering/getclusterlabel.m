function CL = getclusterlabel(clusterdata,centro,w1,w2,w3,w4)
%get clustering label from feature through the encoder nets
targetout = netcomput(clusterdata,w1,w2,w3,w4);%get hidden layer value
value = vl_alldist(targetout',centro');      %here use the VL_Feat fun is used to compute distence
[~, CL] = min(value(:,1:10),[],2);
