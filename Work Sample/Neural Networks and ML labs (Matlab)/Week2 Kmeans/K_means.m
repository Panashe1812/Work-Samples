%% import data

d = load('data.mat')
d=d.data;
c0 = rand(2);   % generate random numbers
%% set training options

options = foptions();
options(14) = 1;
c=c0;

cNew = 0;

%% 

% while cNew ~= c 
for i=1:10 
    datacodeplot(d, c);
    
    
    pause;
    
    disp("datacodeplot function running"); 
    
    cNew = kmeans(c,d,options)
    if cNew == c
        disp("K-means has converged")
        break
    end
    c = cNew
 end

%%



