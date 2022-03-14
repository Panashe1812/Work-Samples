function [output] = datacodeplot(data,c0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% d -> data and c-> codevectors

% disp("datacodeplot function running");
% DATA
% d = [1,1;2,1;3,1;5,5;5,6;6,5;6,6];

% c0 = [2,2;3,2];

%% PLOT DATA
data =d
scatter(data(:,1),data(:,2),'O','filled')
hold on

ylabel('Y axis')
xlabel('X axis')
title('PCA analysis')
xline(0,'k')
yline(0,'k')

%plot the initial code vectors
scatter(c0(:,1),c0(:,2),'*','red')
grid on


end

