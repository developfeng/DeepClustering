function out = netcomput(data,w1,w2,w3,w4)
%this function can get top(or hidden)layer value with autoencode network, with sigmoid function.
N =size(data,1);
data = [data ones(N,1)];
w1probs = 1./(1 + exp(-data*w1)); w1probs = [w1probs  ones(N,1)];
w2probs = 1./(1 + exp(-w1probs*w2)); w2probs = [w2probs ones(N,1)];
w3probs = 1./(1 + exp(-w2probs*w3)); w3probs = [w3probs  ones(N,1)];
out = 1./(1 + exp(-w3probs*w4));
end