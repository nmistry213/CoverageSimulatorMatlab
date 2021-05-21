function[Coverage_Array,AMultiDim,ACMultiDim,SensorSizeArray,EC] = ...
    Coverage_Simulator(NumberofRobots,Config,SensorType,SensorStart,...
    Iterations_Required,Print_Step,SwitchType,GridType,GridParameter)
%Sensor Type = 1 for static, = 2 for flexible    
%% Initialise Variables
    EC = 3;%Empty cell value
    RC = 1;%Robot cell value
    CovNo = 2;%Coverage paint cell value
    Coverage_Array = [];
    Iteration = 1;
    noise = 0.02;
    Counter = 1;   
    %% Create Grid
    [A,TrueHeight,TrueWidth,GridDimension] = ...
        GridGenerator(GridType,GridParameter,EC);

    %% Calculate Number of Empty Cells in Workspace
    %NumofCells is used for Coverage Evaluation
    [NumofCells,CellArray]= CellFinder(TrueWidth,TrueHeight,A,EC); %#ok<ASGLU>
    
    %% Initialise Robot Modules Starting Point
    A = RobotPopulator(NumberofRobots,A,Config,EC,RC);
    %Loops through grid and adds robot cells to an array
    [NoRs,RobotArray]= CellFinder(TrueWidth,TrueHeight,A,RC);
    for i = 1:1:NoRs
        NoDirectionCounter = 0;
        NoObstacleCounter = 0;
        SensorSize = SensorStart; %Set initial sensor size
        RobotArray(i,3)= NoDirectionCounter;
        RobotArray(i,4)= NoObstacleCounter;
        RobotArray(i,5)= SensorSize;
        %A matrix of sensor sizes 
        SensorSizeArray(Counter,i)=SensorSize; %#ok<AGROW>
    end
    
    %% Save Start of Coverage Array
    [Coverage_Array(Iteration),AC] = ...
        CoverageCalculator(A,EC,CovNo,NumofCells,RobotArray,NoRs); 
    %% Save Starting Map and Coverage Map
    %Saves the Maps into multi-dimensional arrays
    AMultiDim(:,:,Counter)=A;
    ACMultiDim(:,:,Counter)=AC;
    Counter = Counter+1;
    
    %% Simulate Coverage Algorithm
    while Iteration < Iterations_Required
        %Loops through robot array using sensor detection and moving
        %accordingly, then updates array
        for i = 1:1:NoRs
            X = RobotArray(i,1);
            Y = RobotArray(i,2);
            NoDirectionCounter = RobotArray(i,3);
            NoObstacleCounter = RobotArray(i,4);
            SensorSize = RobotArray(i,5);
            if GridDimension  == 1
                [Sensor_Detection, Z] = ...
                    SensorDetection1(Y,A,SensorSize,noise,EC);
            elseif GridDimension == 2
                [Sensor_Detection, Z] = ...
                    SensorDetection2(X,Y,A,SensorSize,noise,EC);
            else
            end

            if Sensor_Detection == 1 %Sensors detect obstacle(s)
                NoObstacleCounter = 0; %Reset no obstacle counter
                T = isempty(Z);
                if T == 1 %condition if there are no directions (Z)
                    
                    NoDirectionCounter = NoDirectionCounter + 1;
                elseif T == 0
                    %Select random direction from direction array Z
                    pos = randi(length(Z));
                    direction = Z(pos);
                    [X,Y,A] = RobotMove(X,Y,A,direction,EC,GridDimension);
                    NoDirectionCounter = 0; %Reset no direction counter
                end
                %Assign new variables to the robot array
                RobotArray(i,1) = X;
                RobotArray(i,2) = Y;
            elseif Sensor_Detection == 0 %No obstacles condition
                NoObstacleCounter = NoObstacleCounter + 1;
                NoDirectionCounter = 0; %Reset no direction counter
            end
            %Sensor Size Switching
            SensorSize = SensorSizeSwitch(SensorSize,SensorType,...
                SensorStart,SwitchType,NoDirectionCounter,...
                NoObstacleCounter);
            %Update SensorSize Array for Histogram
            SensorSizeArray(Counter,i)=SensorSize; 
            %Update robot array
            RobotArray(i,3) = NoDirectionCounter;
            RobotArray(i,4) = NoObstacleCounter;
            RobotArray(i,5) = SensorSize;
        end
        %Counts number of loops through while loop
        Iteration = Iteration + 1; 
        [Coverage_Array(Iteration),AC] = ...
            CoverageCalculator(A,EC,CovNo,NumofCells,RobotArray,NoRs); 
        %Saves the Maps into multi-dimensional arrays
        AMultiDim(:,:,Counter)=A;
        ACMultiDim(:,:,Counter)=AC;
        Counter = Counter+1;
        %prints the map every iteration (should not be used for iterations
        %more than 100 or for unknown iterations)
        if Print_Step == 1 
        	figure;
           	pcolor(A)
            colormap(gray(EC+1))
        else
        end
    end    
end