function [Sensor_Detection,Z] = SensorDetection1(Y,A,K,N,EC)
%This function detected the surrounding cells of a selected cell, with
%varying sensor types and sizes. X and Y are the coordinates of the robot,
%A is grid matrix, K is the Sensor Size/Type, N is the noise factor, EC is
%the empty cell value.
    %Initialise Variables
    SensorEast = false;
    SensorWest = false;
    Sensor_Detection = false;
    Z = [];
    X = 2;

    %Grid Limits
    TrueWidth = length(A)-1;
    
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

   for i = (Y+1):1:(Y+K)
       m = SensorGridAdjustor(i,TrueWidth);
       if A(X,m) < EC
           if RandNoise < NoiseLimit
               SensorEast = true;
               break;
           else
               %false negative noise
           end
       else
           if RandNoise > NoiseLimit
               %false positive noise
               SensorEast = true;
               break;
           else
           end
       end
   end


   %SensorWest Check
   %Generate Random Noise for West Sensor
   RandNoise = rand;

   for i = (Y-K):1:(Y-1)
       m = SensorGridAdjustor(i,TrueWidth);
       if A(X,m) < EC
           if RandNoise < NoiseLimit
               SensorWest = true;
               break;
           else
               %false negative noise
           end
       else
           if RandNoise > NoiseLimit
               %false positive noise
               SensorWest = true;
               break;
           else
           end
       end
   end

   
   % Contact Sensor check to ensure robot does not move into obstacle due
   % to a noise in sensor
   CSEast = A(X,(Y+1));
   CSWest = A(X,(Y-1));
   CSArray = [CSEast,CSWest];
   for i = 1:1:2
       if CSArray(i) < EC
           if i == 1
               SensorEast = true;
           elseif i == 2
               SensorWest = true;             
           else
           end
       else
       end
   end
   
   
   % if any sensor is triggered, set condition variable to true, else set
   % to false 
   if  SensorEast == true || SensorWest == true
       Sensor_Detection = true;
   else
       Sensor_Detection = false;
   end   
   %Create array of sensor states
   SensorArray = [SensorEast,SensorWest];
   %Create array of directions without obstacles where 1 = east & 2 = west
   for i = 1:1:2
       if SensorArray(i) == false
           Z(length(Z)+1) = i;
       else
       end
   end

end