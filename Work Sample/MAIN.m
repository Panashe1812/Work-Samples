
%default training

% enter 1 for option 1 or 2 for option 2
    
  % option 1 uses skips loading the data and uses already created
  % spectrogram imgaes 
  % option 2 loads the raw data and trains the network
    
  % ############## featureOption #######################
  % featureOption =1, trains the network using current features
  % featureOption =2, trains the network using Power features
  
  % ############## networkOption #######################
  %networkOption = 1, trains the network using CNN 
  %networkOption = 2, trains the network using SVM
  
  
  clear
  close all
  clc 
  
  getInput  
  TrainingOptions
  [Precision,Recall,f1_score] = Perfomance(confMat)
  