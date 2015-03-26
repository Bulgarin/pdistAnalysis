%This is a function to calculate mean(pdist(coords w/ >=3 visits))/mean(all possible coords) for a single class of object
%This is a helper function to the pdistAverage function, used to return the cell array of one class of object 


function [pdistSingleCell] = singleCellAverage(name, classNum)

	pdistSingleCell = {}
	pdistSingleCell{1,1} = 'subject'
	pdistSingleCell{3,1} = 'visits2'
	pdistSingleCell{4,1} = 'visits3'
	pdistSingleCell{5,1} = 'combined'
	pdistSingleCell{2,1} = 'class'
	pdistSingleCell{2,2} = classNum



		evalString = strcat('load /home/cnslab/realtime/summaryData/siftScatterData', name)
		eval(evalString)

		pdistSingleCell{1, 2} = name

		visits2Pdist = 	pdist(mCoords{classNum}(find(visits2{classNum} >= 3))')
		pdistSingleCell{3, 2} = mean(visits2Pdist)/mean(pdist(mCoords{classNum}))

		visits3Pdist = pdist(mCoords{classNum}(find(visits3{classNum} >= 3))')
		pdistSingleCell{4, 2} = mean(visits3Pdist)/mean(pdist(mCoords{classNum}))
		
		comb = [mCoords{classNum}(find(visits3{classNum} >= 3))' ; mCoords{classNum}(find(visits2{classNum} >= 3))']

		pdistSingleCell{5,2} = mean(pdist(comb))/mean(pdist(mCoords{classNum}))


end
