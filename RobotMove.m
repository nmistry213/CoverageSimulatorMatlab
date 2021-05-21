function [X,Y,A] = RobotMove(i,j,A,direction,EC,GridDimension)
%This function moves the robot according to the instructed direction and
%returns the new coordinates of the robot as well as an updated grid.
%i and j are the X,Y coordinates of the robot, A is the grid matrix,
%direction is the chosen direction for the robot to move, EC is the value
%of an empty cell.
 %One Dimensional Movement
    if GridDimension == 1
       if direction == 1 %Move East
           A(i,j+1) = A(i,j);
           X = i; Y = j+1;
           A(i,j) = EC;
       elseif direction == 2 %Move West
           A(i,j-1) = A(i,j);
           X = i; Y = j-1;
           A(i,j) = EC;
       elseif direction == 0
       end
 %Two Dimensional Movement
    elseif GridDimension == 2
       if direction == 1 %Move East
           A(i,j+1) = A(i,j);
           X = i; Y = j+1;
           A(i,j) = EC;
       elseif direction == 2 %Move North
           A(i+1,j) = A(i,j);
           X = i+1; Y = j;
           A(i,j) = EC;
       elseif direction == 3 %Move West
           A(i,j-1) = A(i,j);
           X = i; Y = j-1;
           A(i,j) = EC;
       elseif direction == 4 %Move South
           A(i-1,j) = A(i,j);
           X = i-1; Y = j;
           A(i,j) = EC;
       elseif direction == 0
       end
    end
%    figure;
%    pcolor(A)
%    colormap(gray(3))
           
       
       
end