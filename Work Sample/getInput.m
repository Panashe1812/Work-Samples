%USER INPUT

 % ############# processOption ###########################
 
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
  
 
    prompt = {'Enter Training option: (e.g. 1 or 2',...
            'Choose feature to use for classifcation: e.g. 1 or 2',...
            'Choose network to train on: e.g. CNN=1 or SVM=2'};
        
    dlgtitle = 'Input';
    dims = [1 50];
    definput= {'1','2','1'};
    answer = inputdlg(prompt,dlgtitle,dims,definput);
        
    processOption =cell2mat(answer(1));
    featureOption =cell2mat(answer(2));
    networkOption =cell2mat(answer(1));
    
       
  
  
    