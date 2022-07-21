clear all

%%imageFolder='C:\Users\pc16abc\OneDrive - University of Hertfordshire\Plaid\FYP';
imds = imageDatastore(imageFolder, 'LabelSource', 'foldernames',...
       'IncludeSubfolders',true);

tbl = countEachLabel(imds)

net= resnet50();
%%
% ############ PREPARE TEST AND TRAINING SETS ####################

[trainingSet, testSet] = splitEachLabel(imds, 0.7, 'randomize');
%%
%############## PRE-PROCESS IMAGE FOR CNN #########################

% Create augmentedImageDatastore from training and test sets to resize
% images in imds to the size required by the network.
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
%%
% ##### EXTRACT TRAINING FEATURES USING CNN #####

% Get the network weights for the second convolutional layer
w1 = net.Layers(2).Weights;

% Scale and resize the weights for visualization
w1 = mat2gray(w1);
w1 = imresize(w1,5); 
%%
featureLayer = 'fc1000';
trainingFeatures = activations(net, augmentedTrainingSet, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');

% Get training labels from the trainingSet
trainingLabels = trainingSet.Labels;
%%
% Train multiclass SVM classifier using a fast linear solver, and set
% 'ObservationsIn' to 'columns' to match the arrangement used for training
% features.

%classifier = fitcecoc(trainingFeatures,...
     %trainingLabels, ...
    %'Learners', 'Linear',...
    %'Coding', 'onevsall',...
    %'ObservationsIn', 'columns');

template = templateSVM(...
    'KernelFunction','rbf',...
    'KernelScale','auto',...
    'BoxConstraint',100,...
    'Standardize',true);

classifier = fitcecoc(...
    trainingFeatures,...
     trainingLabels, ...
    'Learners',template,...
    'Coding','onevsall',...
    'ObservationsIn', 'columns');

% Extract test features using the CNN
testFeatures = activations(net, augmentedTestSet, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');

% Pass CNN image features to trained classifier
predictedLabels = predict(classifier, testFeatures, 'ObservationsIn', 'columns');

% Get the known labels
testLabels = testSet.Labels;
%%
% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);
confMat1 = confusionchart(testLabels, predictedLabels);
%%
% Convert confusion matrix into percentage form
confMat = bsxfun(@rdivide,confMat,sum(confMat,2))
%%
% Display the mean accuracy
accuracry = mean(diag(confMat))*100
%%
testImage = readimage(testSet,1);
testLabel = testSet.Labels(1)

% Create augmentedImageDatastore to automatically resize the image when
% image features are extracted using activations.
ds = augmentedImageDatastore(imageSize, testImage, 'ColorPreprocessing', 'gray2rgb');

% Extract image features using the CNN
imageFeatures = activations(net, ds, featureLayer, 'OutputAs', 'columns');

% Make a prediction using the classifier
predictedLabel = predict(classifier, imageFeatures, 'ObservationsIn', 'columns')

