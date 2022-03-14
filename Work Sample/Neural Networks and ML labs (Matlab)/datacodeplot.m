function datacodeplot(data, codevectors)
% displaying code here

% configure kmeans to do one iteration per call
options = foptions;
options(14) = 1;
c = c0;
for i in 1:10
datacodeplot(d, c);
pause;
% call kmeans and store the new codevectors in cNew
% check whether cNew is different from c
c = cNew;

end