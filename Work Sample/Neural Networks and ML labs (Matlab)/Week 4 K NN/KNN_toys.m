x= [0 2 4 3];
y =[0 2 0 3];

tr_in = [x;y]';

tr_targets = [1 0 1 0 ; 0 1 0 1]';

%net = knn(nin, nout, k, tr_in, tr_targets)

net1 = knn(2,2,1, tr_in, tr_targets);
%net3 = knn(2, 2, 3, tr_in, tr_targets)
%% 

%p1 = [0,1]
%p2 = [1,0]

%% 
% predicted = []
% 
% for i= 1:length(x)
%     input = [x(i),y(i)]
%     [y1, Label] = knnfwd(net1,input)
%     predicted(i) = Label
%     
% end 
%% 
% 
 [y1, L1] = knnfwd(net1, p1)
% [y2, L2] = knnfwd(net1, p1)

% 