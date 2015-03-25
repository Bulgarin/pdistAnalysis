%This is a function to calculate mean(pdist(coords w/ >=3 visits))/mean(all possible coords)
%It takes a vector of subject names as input and outputs results in the same order


function [pdistAnalysisCell] = pdistAverage(nameVector)
	
	pdistAnalysisCell = {}
	pdistAnalysisCell{1,1} = 'subject'
	pdistAnalysisCell{2,1} = 'visits2'
	pdistAnalysisCell{3,1} = 'visits3'
	pdistAnalysisCell{4,1} = 'combined'

	for s = 1:length(nameVector)

		evalString = strcat('/home/cnslab/realtime/summaryData/siftScatterData', nameVector(s))
		eval(evalString)

		pdistAnalysisCell{1, x+1} = nameVector(x)
