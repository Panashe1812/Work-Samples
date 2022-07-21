%################ READ FILES

DATA_PATH='\Plaid\FYP\CSV Data\CSV';

meta1=jsondecode(fileread('meta1.json'));
meta2=jsondecode(fileread('meta2.json'));
MergedStruct = MergeStructs(meta1,meta2);

Labels= struct();
current=[];

for i=1:1793
    
     %READ DATA FROM CSV FILES
    str1='.csv';
    DataInstance = strcat(string(i),str1);
    
    if exist(DataInstance,'file')
        DataRead = readmatrix(DataInstance);
        current= DataRead(:,1);
        voltage=DataRead(:,2);
        Power=current.*voltage;

        Labels(i).id = MergedStruct(i).id;
        Labels(i).type = MergedStruct(i).meta.type;
        Duration = MergedStruct(i).meta.instances.length;  

        ApplianceType =  MergedStruct(i).meta.type;

        %PLOT SPECTROGRAMS AND SAVE THEM AS PNG 
        figure
        spectrogram(Power,'yaxis')

        i=i

        mkdir(ApplianceType);

        if ~exist(ApplianceType,'dir')
            mkdir(ApplianceType);
        end  

        str1='Instance';
        str2=num2str(i);
        filename = strcat(str1,str2);

        saveas(gcf,filename,'png');
        movefile(strcat(filename,'.png'),ApplianceType);
        close
    end 

end 