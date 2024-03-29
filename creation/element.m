
% Element Creation (element, value)

% GraindId chopping (for test case)
choppedGrandId = GrainId

% Set the total number of elements
elementsNum = ((length(xGrid)-1)*(length(yGrid)-1)*(length(zGrid)-1))

% Create Matrix for elements data input
elementsMatrix = zeros(elementsNum,10)


% Set Orgin point (0,0,0) -> defined as node1 as created in nodesCreation
origin = nodesNum(1)

% Set the interval(how big the increment will be) of nodes for X,Y,Z
xIncrement = 1;
yIncrement = length(xGrid);
zIncrement = length(xGrid)*length(yGrid);

% Set the increment count of X,Y,Z for looping
xIncrementCount = length(xGrid)-1;
yIncrementCount = length(yGrid)-1;
zIncrementCount = length(zGrid)-1;

% Elements numbering in Matrix
elementsMatrix(:,2) = 1:elementsNum

% For data handling (can skip)
elementIdx = 1
k = elementIdx;
start =1;

%% For test case
% iVoxel(1,1,1) = 1
% iVoxel(2,1,1) = 2
% iVoxel(1,2,1) = 3
% iVoxel(2,2,1) = 4
% iVoxel(1,1,2) = 5
% iVoxel(2,1,2) = 6
% iVoxel(1,2,2) = 7
% iVoxel(2,2,2) = 8




% Input data(element / nodes number)

for z = 0:zIncrementCount-1
    zm = (z*zIncrement);
    for y = 0:yIncrementCount-1
        ym = (y*yIncrement);
        for x = 0:xIncrementCount-1
            origin = start + zm + ym + (x*xIncrement);
     
            %% Create 8 nodes by original order (arbitrarily defined by composer)            
            % elementsMatrix(k,2) = origin;
            % elementsMatrix(k,3) = origin + xIncrement;
            % elementsMatrix(k,4) = origin + yIncrement;
            % elementsMatrix(k,5) = origin + xIncrement + yIncrement;
            % elementsMatrix(k,6) = origin + zIncrement;
            % elementsMatrix(k,7) = origin + zIncrement + yIncrement;
            % elementsMatrix(k,8) = origin + zIncrement + xIncrement;
            % elementsMatrix(k,9) = origin + zIncrement + yIncrement + xIncrement;
            
           
            % rearrange the existing order as it shows in example inp file
            elementsMatrix(k,5) = origin;
            elementsMatrix(k,4) = origin + xIncrement;
            elementsMatrix(k,9) = origin + yIncrement;
            elementsMatrix(k,8) = origin + xIncrement + yIncrement;
            elementsMatrix(k,6) = origin + zIncrement;
            elementsMatrix(k,10) = origin + zIncrement + yIncrement;
            elementsMatrix(k,3) = origin + zIncrement + xIncrement;
            elementsMatrix(k,7) = origin + zIncrement + yIncrement + xIncrement;
            
            elementIdx = elementIdx+1;
            k = elementIdx;
            
        end
    end
end

% Convert 3D data into array
choppedGrandId(:)

% Input value data in matrix
elementsMatrix(:,1) = choppedGrandId(:)

% value / element / node
elementsMatrix

% element set
elementsMatrix(:,1:2)

% element
elements = elementsMatrix(:,2:end)

elements

elementsMatrixForSave = zeros(elementsNum*9,1);
elementsMatrixForSave(1:9) = elements(1,:);

for j = 1:elementsNum
    elemtentsMatrixForSave((j*9)+1:(j*9)+9) = elements(j,:);
end

elementsMatrixForSave





% Search certain row of designated value

inputValue = 13;
idx = find(elementsMatrix(:,1)==inputValue);

% Result of search
resultOfinputValue = elementsMatrix(idx,:)

% eleset from result
resultOfinputValue(:,1:2)
