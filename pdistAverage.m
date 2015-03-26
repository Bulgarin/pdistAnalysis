%This is a function to calculate mean(pdist(coords w/ >=3 visits))/mean(all possible coords)
%It takes a cell array of subject names and the corresponding class of object to be analyzed as input
%The output is a cell array of matrices organized by subject


function [pdistAnalysisCell] = pdistAverage(nameVector, classVector)
	

	for s = 1:length(nameVector)

		pdistAnalysisCell{s} = singleCellAverage(nameVector{s}, classVector{s})
	end
end
