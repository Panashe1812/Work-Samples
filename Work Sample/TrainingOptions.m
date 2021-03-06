% MAIN FUNCTION  
  
    %used imgaes generated 
    if (processOption == num2str(1))
        str="Pass0";
        % feature 1 is current spectrograms
        if (featureOption == num2str(1))
            
            if (networkOption == num2str(1))
                
                CNN_Current_Feature;     % call current CNN workflow
            else
                if (networkOption==num2str(2))
                    SVM_Current;          %all power CNN workflow
                end 
            end 
        else 
            if (featureOption == num2str(2))       %POWER FEATURE
                if (networkOption == num2str(1))
                    CNN_Power_Features;  %train CNN with power features
                else 
                    if (networkOption == num2str(2))
                        SVM_Power;       %train CNN with power features
                    end 
                end 
            end 
        end 
                     
                    
    else 
        if (processOption == num2str(2))           %RUN THE WHOLE PROCESS
            if (featureOption == num2str(1))
            
             if (networkOption == num2str(1))
                    
                LoadData_v2             %load the raw data and convert to spectrograms
                CNN_Current_Feature     % call current CNN workflow
            else
                if (networkOption==num2str(1))
                    LoadData_v2          %load the raw data and generate current spectrograms
                    SVM_Current          %all power CNN workflow
                end 
             end 
             
        else 
            if (featureOption == num2str(2))       %POWER FEATURE
                if (networkOption == num2str(1))
                    
                    Real_Power_feature  %load the raw data and generate Pwr spectrograms
                    CNN_Power_Features  %train CNN with power features
                else 
                    if (networkOption == num2str(2))
                        Real_Power_feature  %load the raw data and generate Pwr spectrograms
                        SVM_Power           %train CNN with power features
                    end 
                end 
            end 
            end  
            
        end 
    end  