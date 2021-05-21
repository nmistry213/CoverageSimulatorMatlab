function [A] = RobotPopulator(NumRobots,A,config,EC,RC)
%This function populates a grid with robot cells, NumRobots is the
%number of robots to put in the cell, A is the grid matrix, config is the
%type of configuration and can be 'centre','corner' or 'random', EC is the
%empty cell value, RC is the robot cell value.
    %Calculate height and width of grid
    TrueHeight = height(A)-1;
    TrueWidth = length(A)-1;
    %Collect all free cell locations into array
    [NumFCA,FreeCellArray] = CellFinder(TrueWidth,TrueHeight,A,EC);

    %Adjust NumofRobots to within acceptable range relative to number of
    %free cells
    if NumRobots > (NumFCA/2)
        NumRobots = NumFCA/2;
        disp('Number of Robots Exceeds Maximum Number of Robots for Grid Size');
        disp('Number of Robots Reduced to Maximum for Grid Size');
    else
    end
    %Select robot start configuration
    switch config
        case 'centre'
           L = ceil(sqrt(NumRobots));
           %Initialise number of robots counter 
           NR = 0;
           %Find Centre 
           X = floor(height(A))/2;
           Y = floor(length(A))/2;
           %Find minimum and maximum of X and Y for Robot population
           Xmin = X - ceil(L/2);
           Ymin = Y - ceil(L/2);
           Xmax = X + ceil(L/2);
           Ymax = Y + ceil(L/2);
           %Populate center of grid with robots
           for i = Xmin:1:Xmax
               for j = Ymin:1:Ymax
                   if NR < NumRobots
                       if A(i,j) == EC
                           A(i,j) = RC;
                           NR = NR + 1;
                       else
                       end
                   else
                   end
               end
           end
           if NR < NumRobots
               W = 'Not all Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
           else
               W = 'All Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
           end
           disp(W);
           disp(D);

        case 'corner'
           L = ceil(sqrt(NumRobots));
           %Initialise array of corner selections where 1 = top left, 2 =
           %top right, 3 = bottom left and 4 = bottom right
           corners = [1 2 3 4];
           %Select random corner
           pos = randi(length(corners));
           selectCorner = corners(pos);
           %Find top left corner
           if selectCorner == 1
               disp('Top Left Corner Selected');
               Xc = 0;
               Yc = TrueWidth;
               
               for i = 1:1:NumFCA
                   X = FreeCellArray(i,1);
                   Y = FreeCellArray(i,2);
                   if X >= Xc & Y <= Yc
                       Xc = X;
                       Yc = Y;
                   else
                   end
               end
               Dx = ['X coordinate is ', num2str(Xc)];
               disp(Dx);
               Dy = ['Y coordinate is ', num2str(Yc)];
               disp(Dy);
               %Find minimum and maximum of X and Y for Robot population
               Xmin = Xc - L;
               Ymin = Yc;
               Xmax = Xc;
               Ymax = Yc + L;
               %Populate corner of grid with robots
               NR = 0;
               for i = Xmax:-1:Xmin
                   for j = Ymin:1:Ymax
                       if NR < NumRobots
                           if A(i,j) == EC
                               A(i,j) = RC;
                               NR = NR + 1;
                           else
                           end
                       else
                       end
                   end
               end
           %Find top right corner
           elseif selectCorner == 2
               disp('Top Right Corner Selected');
               Xc = 0;
               Yc = 0;
               for i = 1:1:NumFCA
                   X = FreeCellArray(i,1);
                   Y = FreeCellArray(i,2);
                   if X >= Xc & Y >= Yc
                       Xc = X;
                       Yc = Y;
                   else
                   end
               end
               Dx = ['X coordinate is ', num2str(Xc)];
               disp(Dx);
               Dy = ['Y coordinate is ', num2str(Yc)];
               disp(Dy);
               %Find minimum and maximum of X and Y for Robot population
               Xmin = Xc - L;
               Ymin = Yc - L;
               Xmax = Xc;
               Ymax = Yc;
               %Populate corner of grid with robots
               NR = 0;
               for i = Xmax:-1:Xmin
                   for j = Ymax:-1:Ymin
                       if NR < NumRobots
                           if A(i,j) == EC
                               A(i,j) = RC;
                               NR = NR + 1;
                           else
                           end
                       else
                       end
                   end
               end
           %Find bottom left corner
           elseif selectCorner == 3
               disp('Bottom Left Corner Selected');
               Xc = TrueHeight;
               Yc = TrueWidth;
               for i = 1:1:NumFCA
                   X = FreeCellArray(i,1);
                   Y = FreeCellArray(i,2);
                   if X <= Xc & Y <= Yc
                       Xc = X;
                       Yc = Y;
                   else
                   end
               end
               Dx = ['X coordinate is ', num2str(Xc)];
               disp(Dx);
               Dy = ['Y coordinate is ', num2str(Yc)];
               disp(Dy);
               %Find minimum and maximum of X and Y for Robot population
               Xmin = Xc;
               Ymin = Yc;
               Xmax = Xc + L;
               Ymax = Yc + L;
               %Populate corner of grid with robots
               NR = 0;
               for i = Xmin:1:Xmax
                   for j = Ymin:1:Ymax
                       if NR < NumRobots
                           if A(i,j) == EC
                               A(i,j) = RC;
                               NR = NR + 1;
                           else
                           end
                       else
                       end
                   end
               end
           %Find bottom right corner
           elseif selectCorner == 4
               disp('Bottom Right Corner Selected');
               Xc = TrueHeight;
               Yc = 0;
               for i = 1:1:NumFCA
                   X = FreeCellArray(i,1);
                   Y = FreeCellArray(i,2);
                   if X <= Xc & Y >= Yc 
                       Xc = X;
                       Yc = Y;
                   else
                   end
               end
               Dx = ['X coordinate is ', num2str(Xc)];
               disp(Dx);
               Dy = ['Y coordinate is ', num2str(Yc)];
               disp(Dy);
               %Find minimum and maximum of X and Y for Robot population
               Xmin = Xc;
               Ymin = Yc - L;
               Xmax = Xc + L;
               Ymax = Yc;
               %Populate corner of grid with robots
               NR = 0;
               for i = Xmin:1:Xmax
                   for j = Ymax:-1:Ymin
                       if NR < NumRobots
                           if A(i,j) == EC
                               A(i,j) = RC;
                               NR = NR + 1;
                           else
                           end
                       else
                       end
                   end
               end
               
           else
           end
           if NR < NumRobots
               W = 'Not all Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
           else
               W = 'All Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
           end
           disp(W);
           disp(D);
 
        case 'random'
            NR = 0;
            while NR < NumRobots
                pos = randi(length(FreeCellArray));
                X = FreeCellArray(pos,1);
                Y = FreeCellArray(pos,2);
                if A(X,Y) == EC
                    A(X,Y) = RC;
                    [NumFCA,FreeCellArray] = FreeCellFinder(TrueWidth,TrueHeight,A);
                    NR = NR + 1;
                else
                end
            end
            if NR < NumRobots
               W = 'Not all Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
            else
               W = 'All Robots Were Successfully Populated';
               D = ['Number of Robots Populated = ',num2str(NR)];
            end
            disp(W);
            disp(D);
            
    case 'left'
        NR = 0;
        Yc = TrueWidth;
        %Find the most left free cell and save the value the Y value
        for i = 1:1:NumFCA
            Y = FreeCellArray(i,2);
            if Y <= Yc 
                Yc = Y;
            else
            end
        end
        %Begin populating all cells in the free cell array that are empty
        %and have the most left Y value.
        while NR < NumRobots
            for i = 1:1:NumFCA
                Y = FreeCellArray(i,2);
                if Y == Yc
                    X = FreeCellArray(i,1);
                    if A(X,Y) == EC
                        A(X,Y) = RC;
                        %[NumFCA,FreeCellArray] = FreeCellFinder(TrueWidth,TrueHeight,A);
                        NR = NR + 1;
                    else
                    end
                else
                end  
            end
            %Move to the second most left column in the free cell array
            Yc = Yc + 1;
        end
            
        if NR < NumRobots
            W = 'Not all Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        else
            W = 'All Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        end
        disp(W);
        disp(D);
        
    case 'right'
        NR = 0;
        Yc = 0;
        %Find the most right free cell and save the value the Y value
        for i = 1:1:NumFCA
            Y = FreeCellArray(i,2);
            if Y >= Yc 
                Yc = Y;
            else
            end
        end
        %Begin populating all cells in the free cell array that are empty
        %and have the most right Y value.
        while NR < NumRobots
            for i = 1:1:NumFCA
                Y = FreeCellArray(i,2);
                if Y == Yc
                    X = FreeCellArray(i,1);
                    if A(X,Y) == EC
                        A(X,Y) = RC;
                        [NumFCA,FreeCellArray] = FreeCellFinder(TrueWidth,TrueHeight,A);
                        NR = NR + 1;
                    else
                    end
                else
                end  
            end
            %Move to the second most right column in the free cell array
            Yc = Yc - 1; 
        end
        if NR < NumRobots
            W = 'Not all Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        else
            W = 'All Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        end
        disp(W);
        disp(D);
    case 'top'
        NR = 0;
        Xc = 0;
        %Find the top free cell and save the value the X value
        for i = 1:1:NumFCA
            X = FreeCellArray(i,1);
            if X >= Xc 
                Xc = X;
            else
            end
        end
        %Begin populating all cells in the free cell array that are empty
        %and have the most right X value.
        while NR < NumRobots
            for i = 1:1:NumFCA
                X = FreeCellArray(i,1);
                if X == Xc
                    Y = FreeCellArray(i,2);
                    if A(X,Y) == EC
                        A(X,Y) = RC;
                        NR = NR + 1;
                    else
                    end
                else
                end  
            end
            %Move to the second top row in the free cell array
            Xc = Xc - 1; 
        end
        if NR < NumRobots
            W = 'Not all Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        else
            W = 'All Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        end
        disp(W);
        disp(D);
    case 'bottom'
        NR = 0;
        Xc = TrueHeight;
        %Find the top free cell and save the value the X value
        for i = 1:1:NumFCA
            X = FreeCellArray(i,1);
            if X <= Xc 
                Xc = X;
            else
            end
        end
        %Begin populating all cells in the free cell array that are empty
        %and have the most right X value.
        while NR < NumRobots
            for i = 1:1:NumFCA
                X = FreeCellArray(i,1);
                if X == Xc
                    Y = FreeCellArray(i,2);
                    if A(X,Y) == EC
                        A(X,Y) = RC;
                        NR = NR + 1;
                    else
                    end
                else
                end  
            end
            %Move to the second bottom row in the free cell array
            Xc = Xc + 1; 
        end
        if NR < NumRobots
            W = 'Not all Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        else
            W = 'All Robots Were Successfully Populated';
            D = ['Number of Robots Populated = ',num2str(NR)];
        end
        disp(W);
        disp(D);
                
           
    end

       
       
end