%This is a function to calculate mean(pdist(coords w/ >=3 visits))/mean(all possible coords) for a single class of object
%This is a helper function to the pdistAverage function, used to return the cell array of one class of object 


function [pdistSingleCell] = singleCellAverage(nameVector, classNum)

	pdistSingleCell = {}
	pdistSingleCell{1,1} = 'subject'
	pdistSingleCell{3,1} = 'visits2'
	pdistSingleCell{4,1} = 'visits3'
	pdistSingleCell{5,1} = 'combined'
	pdistSingleCell{2,1} = 'class'
	pdistSingleCell{2,2} = classNum

	for s = 1:length(nameVector)

		evalString = strcat('/home/cnslab/realtime/summaryData/siftScatterData', nameVector{s})
		eval(evalString)

		pdistSingleCell{1, 2} = nameVector{s}
		pdistSingleCell{3, 2} = mean(pdist(mCoords{classNum}find(visits2{classNum} >= 3)')) ...
		/mean(pdist(mCoords{classNum}))

		pdistSingleCell{4, 1} = mean(pdist(mCoords{classNum}find(visits3{classNum} >= 3)')) ...
		/mean(pdist(mCoords{classNum}))

		comb = mean(mean(pdist(mCoords{classNum}find(visits2{classNum} >= 3)')), ...
			mean(pdist(mCoords{classNum}find(visits3{classNum} >= 3)')))

		pdistSingleCell{5,2} = comb

	end

end
