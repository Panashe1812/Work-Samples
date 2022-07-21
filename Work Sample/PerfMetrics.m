

function [Precision,Recall,f1_score] = Perfomance(confMat)
%   THIS FUNCTION CALCULATES THE PRECISION, RECALL AND F1 SCORE
%   GIVEN THE CONFUSION MATRIX AS INPUT
%   OUTPUT IS Precision, Recall and f1 score


%precision
Precision=0;
Recall = 0;
f1_score=0;

for i =1:size(confMat,1)
    
    precision(i)=confMat(i,i)/sum(confMat(i,:));
    Precision = Precision + precision(i);
    
end

% divide total precision by the total number of classes
Precision= (Precision/length(confMat))*100

%recall
for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(:,i));
    Recall=Recall+ recall(i);
end

%macro average F1 score
Recall= (Recall/length(confMat))*100
%

f1_score = (2 * Precision * Recall) / (Precision + Recall) 

end 