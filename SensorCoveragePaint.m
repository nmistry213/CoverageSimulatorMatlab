function [AC] = SensorCoveragePaint(X,Y,AC,K,CovNo,EC,TrueWidth,TrueHeight)
%This function detected the surrounding cells of a selected cell, with
%varying sensor types and sizes. X and Y are the row and column coordinates of the robot,
%A is grid matrix, K is the Sensor Size/Type, N is the noise factor, EC is
%the empty cell value.
   
    %SensorEast Paint

    for j = (Y+1):1:(Y+K)
        for i = (X-(K-1)):1:(X+(K-1))
            n = SensorGridAdjustor(j,TrueWidth);
            m = SensorGridAdjustor(i,TrueHeight);
            if AC(m,n) == EC
                AC(m,n) = CovNo;
            else

            end
        end
    end

    %SensorNorth Paint

    for j = (Y-(K-1)):1:(Y+(K-1))
       for i = (X+1):1:(X+K)
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if AC(m,n) == EC
                AC(m,n) = CovNo;
           else

           end
       end
    end

    %SensorWest Paint

    for j = (Y-K):1:(Y-1)
       for i = (X-(K-1)):1:(X+(K-1))
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if AC(m,n) == EC
               AC(m,n) = CovNo;
           else
           end
       end
    end

    %SensorSouth Paint

    for j = (Y-(K-1)):1:(Y+(K-1))
       for i = (X-K):1:(X-1)
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if AC(m,n) == EC
               AC(m,n) = CovNo;
           else
           end
       end
    end
end
   
   

   
