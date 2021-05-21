function [Sensor_Detection,Z] = SensorDetection2(X,Y,A,K,N,EC)
%This function detected the surrounding cells of a selected cell, with
%varying sensor types and sizes. X and Y are the coordinates of the robot,
%A is grid matrix, K is the Sensor Size/Type, N is the noise factor, EC is
%the empty cell value.
    %Initialise Variables
    SensorNorth = false;
    SensorEast = false;
    SensorSouth = false;
    SensorWest = false;
    Sensor_Detection = false;
    Z = [];
    
    %Grid Limits
    TrueWidth = length(A)-1;
    TrueHeight = height(A)-1;
    
    %Scale Noise with the range of the sensor
    N = N*K;
    
    %Remove Noise for Contact Sensor (if K = 1, it uses contact sensor
    %only)
    if K == 1
        N = 0;
    else
    end
    %Set Noise Limit for Random Noise Generation
    NoiseLimit = 1-N;
    
    %SensorEast Check
    %Generate Random Noise for East Sensor
    RandNoise = rand;
    for j = (Y+1):1:(Y+K)
        for i = (X-(K-1)):1:(X+(K-1))
            n = SensorGridAdjustor(j,TrueWidth);
            m = SensorGridAdjustor(i,TrueHeight);
            if A(m,n) < EC
                if RandNoise < NoiseLimit
                    SensorEast = true;
                    break;
                else
                end
            else
                if RandNoise > NoiseLimit
                    SensorEast = true;
                    break;
                else
                end
            end
        end
    end
    
   %Sensor North Check
   %Generate Random Noise for North Sensor
   RandNoise = rand;
   for j = (Y-(K-1)):1:(Y+(K-1))
       for i = (X+1):1:(X+K)
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if A(m,n) < EC
               if RandNoise < NoiseLimit
                   SensorNorth = true;
                   break;
               else
               end
           else
               if RandNoise > NoiseLimit
                   SensorNorth = true;
                   break;
               else
               end
           end
       end
   end
   
   %SensorWest Check
   %Generate Random Noise for West Sensor
   RandNoise = rand;
   for j = (Y-K):1:(Y-1)
       for i = (X-(K-1)):1:(X+(K-1))
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if A(m,n) < EC
               if RandNoise < NoiseLimit
                   SensorWest = true;
                   break;
               else
               end
           else
               if RandNoise > NoiseLimit
                   SensorWest = true;
                   break;
               else
               end
           end
       end
   end
   
   %SensorSouth Check
   %Generate Random Noise for South Sensor
   RandNoise = rand;
   for j = (Y-(K-1)):1:(Y+(K-1))
       for i = (X-K):1:(X-1)
           n = SensorGridAdjustor(j,TrueWidth);
           m = SensorGridAdjustor(i,TrueHeight);
           if A(m,n) < EC
               if RandNoise < NoiseLimit
                   SensorSouth = true;
                   break;
               else
               end
           else
               if RandNoise > NoiseLimit
                   SensorSouth = true;
                   break;
               else
               end
           end
       end
   end
   
   % Contact Sensor check to ensure robot does not move into obstacle due
   % to a noise in sensor
   CSEast = A(X,(Y+1)); CSNorth = A((X+1),Y); 
   CSWest =  A(X,(Y-1)); CSSouth = A((X-1),Y);
   CSArray = [CSNorth, CSEast, CSSouth, CSWest];
   for i = 1:1:4
       if CSArray(i) < EC
           if i == 1
               SensorNorth = true;
           elseif i == 2
               SensorEast = true;
           elseif i == 3
               SensorSouth = true;
           elseif i == 4
               SensorWest = true;
           else
           end
       else
       end
   end
   
   
   % if any sensor is triggered, set condition variable to true, else set
   % to false 
   if SensorNorth == true || SensorEast == true || SensorSouth == true || SensorWest == true
       Sensor_Detection = true;
   else
       Sensor_Detection = false;
   end   
   %Create array of sensor states
   SensorArray = [SensorEast,SensorNorth, SensorWest, SensorSouth];
   %Create array of directions without obstacles where 1 = east, 2 = north,
   %3 = west and 4 = south
   for i = 1:1:4
       if SensorArray(i) == false
           Z(length(Z)+1) = i;
       else
       end
   end
   
end