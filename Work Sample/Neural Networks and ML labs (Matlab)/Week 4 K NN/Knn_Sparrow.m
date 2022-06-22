%% LOAD DATA
tr_in = load('sparrows.dat');
tr_targets = load('sparrows_labels.dat');

%% ONE HOT ENCODE THE LABELS
tr_targets = [tr_targets,~tr_targets]

%% 
%net = knn(nin, nout, k, tr_in, tr_targets)

net = knn(5, 2, 1, tr_in, tr_targets)

%% 
p1 = tr_in(1,:)
%p2 = [1,0]

[y1, L1] = knnfwd(net, p1)

%% CONFUSION MATRIC



