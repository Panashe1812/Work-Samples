%################ READ FILES

DATA_PATH='\FYP\Final Year Project\PLAID DATASET';

meta1=jsondecode(fileread('meta1.json'));
meta2=jsondecode(fileread('meta2.json'));
MergedStruct = MergeStructs(meta1,meta2);


Labels= struct();

for i=1:1793
    
     
     %READ DATA FROM CSV FILES
    str1='.csv';
    
    DataInstance = strcat(string(i),str1);
    
    %some files have been deleted during preprocessing and instances will
    %be missing from the dataset.
       if exist(DataInstance)
        DataRead = readmatrix(DataInstance);
        current= DataRead(:,2);

        Labels(i).id = MergedStruct(i).id;
        Labels(i).type = MergedStruct(i).meta.type;
        %duration=MergedStruct(i).meta.instances.length;

        ApplianceType =  MergedStruct(i).meta.type;

        %PLOT SPECTROGRAMS AND SAVE THEM AS PNG 
        figure
        spectrogram(current,'yaxis')
%         figure
%         plot(current)
        
        %create a new directori if it doesnt exist
        if ~exist(ApplianceType,'dir')
            mkdir(ApplianceType);
        end  

        str1='Instance';
        str2=num2str(i);
        filename = strcat(str1,str2);
        
        %save image with appliance type name 
        saveas(gcf,filename,'png');
        movefile(strcat(filename,'.png'),ApplianceType);
        close all
        end 
end 