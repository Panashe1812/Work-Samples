data = [-2, 2; -4, -4; 4, 4; 2, -2; 0, 0];

%% 
scatter(data(:,1),data(:,2),'r','*')
ylabel('Y axis')
xlabel('X axis')
title('PCA analysis')
xline(0,'k')
yline(0,'k')
xlim([-5 5])
ylim([-5 5])

grid on
%% 

C =cov(data)

[V,D] = eig(C)

%sort(D, 'descend')

[d,ind] =sort(diag(D))

Ds = D(ind,ind)

Vs = V(:,ind)

%% 

%Use a scatterplot to verify the rotation of the original data.

dataRotated = data*Vs
hold on 
grid on
scatter(dataRotated(:,1),dataRotated(:,2),'b','o')

%% 
%Verify your work further by checking that the trace of the 
%covariance of the rotated data is the same as that
%of the covariance of the original data.

data_Rot_trace = trace(cov(dataRotated))
traceC=trace(C)


