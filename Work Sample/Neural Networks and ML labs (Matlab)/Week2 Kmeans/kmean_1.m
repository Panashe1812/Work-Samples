%K-mean
data_1 = data;
disp(data_1);
disp(sum(ismissing(data_1)));
c = data_1-mean(data_1)/std(data_1);
disp(c);

idx = kmeans(data_1,2);
gscatter(data_1(:,1),data_1(:,2),idx);