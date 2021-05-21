function[SensorSize]=SensorSizeSwitch(SensorSize,SensorType,SensorStart,SwitchType,NoDirectionCounter,NoObstacleCounter)
    %Define Switch Limits
    NDirectionCL = 5;% Limit for No Direction Counter
    NObstacleCL = 2; % Limit for No Obstacle Counter
    switch SwitchType
        case 'probabilistic'
            if NoDirectionCounter > 0 || NoObstacleCounter > 0
                probablisticNumber = rand;
                if probablisticNumber < (1/NDirectionCL) && SensorSize > 1  
                    if SensorType == 1
                        SensorSize = 1;
                    elseif SensorType == 2
                        SensorSize = SensorSize - 1; %Reduce sensor size
                    else
                    end
                elseif probablisticNumber > (1-(1/NObstacleCL)) && SensorSize < 6
                    if SensorType == 1
                        SensorSize = SensorStart;
                    elseif SensorType == 2
                        SensorSize = SensorSize + 1; %Increase sensor size    
                    else
                    end
                else
                end
            else
            end
        case 'deterministic'
            if NoDirectionCounter > NDirectionCL && SensorSize > 1  
                if SensorType == 1
                    SensorSize = 1;
                elseif SensorType == 2
                    SensorSize = SensorSize - 1; %Reduce sensor size
                else
                end
            else
            end
            if NoObstacleCounter > NObstacleCL
                if SensorType == 1
                    SensorSize = SensorStart;
                elseif SensorType == 2
                    SensorSize = SensorSize + 1; %Increase sensor size
                else
                end
            else
            end
            
        case 'off'
            %Do Nothing
    end
end
