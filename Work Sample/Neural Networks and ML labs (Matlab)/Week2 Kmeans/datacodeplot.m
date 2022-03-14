function datacodeplot(data,c0)
%
% PLOT DATA
figure
scatter(data(:,1),data(:,2),'+')
hold on
%% 

ylabel('Y axis'),xlabel('X axis'),title('K means'),
xlim([0 1]),xlim([0 1])
%xline(0,'k'),yline(0,'k'),
%% 

%plot the initial code vectors
scatter(c0(:,1),c0(:,2),'*','red')
grid on


end

