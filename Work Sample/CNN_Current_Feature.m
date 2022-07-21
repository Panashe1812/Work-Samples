clear all
close all

%%
%folder where spectrograms images are stored
imageFolder='Spectrograms';
%%
imds = imageDatastore(imageFolder, 'LabelSource', 'foldernames', 'IncludeSubfolders',true);
%%
[trainingSet, testSet] = splitEachLabel(imds, 0.7, 'randomize');
%%
net = alexnet
%net=googlenet
% net= resnet50;
% net = resnet101

%%
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');

%%

layers = net.Layers
layers(23) = fullyConnectedLayer(11)
layers(25) = classificationLayer

%%

opts = trainingOptions('sgdm',...
    'InitialLearnRate', 0.001,...
    'MaxEpochs', 30,...
    'MiniBatchSize', 64,...
    'Plots','training-progress');
%%
net = trainNetwork(augmentedTrainingSet, layers, opts);
%%

predictedLabels = classify(net, augmentedTestSet);

testLabels=testSet.Labels;
accuracy = mean((predictedLabels == testSet.Labels))*100

confMat1 = confusionchart(testLabels, predictedLabels);
%%
confMat=confusionmat(testLabels, predictedLabels);