function[k] = SensorGridAdjustor(i,GridLimit)
%This function adjusts grid coordinates to ensure they are within limits of
%the grid. GridLimit is the limit of the grid, i is the grid coordinate.
%This means that the robot can be up against the barrier without the sensor
%returning errors for cells outside the grid limits

    if i > GridLimit
        k = GridLimit;
    elseif i < 1
        k = 1;
    else
        k = i;
    end
end