function [Coverage, AC] = CoverageCalculator(A,EC,CovNo,NumofCells,RobotArray,NoRs)
%This function detected the surrounding cells of a selected cell, with
%varying sensor types and sizes. X and Y are the coordinates of the robot,
%A is grid matrix, K is the Sensor Size/Type, N is the noise factor, EC is
%the empty cell value.
    

    AC = A;
    %Grid Limits
    TrueWidth = length(AC)-1;
    TrueHeight = height(AC)-1;
    
    for r = 1:1:NoRs
        X = RobotArray(r,1);
        Y = RobotArray(r,2);
        K = RobotArray(r,5); %Sensor Size
        AC = SensorCoveragePaint(X,Y,AC,K,CovNo,EC,TrueWidth,TrueHeight);
    end
    [NumofEmptyCells,EmptyCellArray]= CellFinder(TrueWidth,TrueHeight,AC,EC);
    Coverage = (NumofCells-NumofEmptyCells)/NumofCells;
    

   
end