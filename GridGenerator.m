function[A,TrueHeight,TrueWidth,GridDimension] = GridGenerator...
    (GridType,GridParameter,EC)
% This function is used to generate a grid from a matrix. The input
% parameters are:
% - GridType: The type of grid to be generated
% - GridParameter: The control variable assosciated with that grid
% - EC: The value for empty cells in the grid
% -	GridType:
%     -   'one-dimensional'
%         A grid with only a single row of free cells
%         GridParameter: Width - This value determines the length of the 
%         grid.
% 
%     -   'square'
%         An X by X square grid, the barrier takes up 3 cells in both width
%         and height so the operational size of the grid is effectively 
%         (X-3)by (X-3)
%         GridParameter: X - This value determines the size of the grid.
%         
%     -   'narrow-gap'
%         A 40 by 40 square grid with barrier across the centre with a gap
%         in the centre
%         GridParameter: GapSize - This value determines the size of the 
%         gap i.e 1 gives a 1 column size gap in the barrier, 2 gives a 2 
%         columnsize gap etc.
%         
%     -   'island'
%         A 40 by 40 square grid with a central square island barrier
%         GridParameter: GapSize - This value determines the gap between 
%         theisland barrier and the outer walls, i.e. a GapSize of 1 gives 
%         1 cell gap.

% This function's output variables are: 
%     -   A: The grid matrix
%     -   TrueHeight: The visible height of the grid
%     -   TrueWidth: The visible width of the grid
%     -   GridDimension: The dimension of the grid, i.e. 1 dimension or 2
%         dimensions

    switch GridType
        case'one-dimensional'
            %Set Grid Dimension
            Height = 3;
            Width = GridParameter;
            TrueHeight = Height-1;
            TrueWidth = Width-1;
            %Create Matrix of zeros
            A = zeros(Height,Width);
            %Set Matrix to a matrix of twos (empty cells)
            A(:,:) = EC;
            %Set border
            A(1,1:Width) = 0;
            A(Height,1:Width) = 0;
            A(1:Height,1) = 0;
            A(1:Height,TrueWidth:Width) = 0;
            %Set spot to ensure that the coverage painter works correctly 
            A(Height,Width)=EC;
            GridDimension = 1;      
        case 'square'
            %Set Grid Dimension
            Height = GridParameter;
            Width = GridParameter;
            TrueHeight = Height-1;
            TrueWidth = Width-1;
            %Create Matrix of zeros
            A = zeros(Height,Width);
            %Set Matrix to a matrix of twos (empty cells)
            A(:,:) = EC;
            %Set border
            A(1,1:Width) = 0;
            A(TrueHeight:Height,1:Width) = 0;
            A(1:Height,1) = 0;
            A(1:Height,TrueWidth:Width) = 0;
            %Set spot to ensure that the coverage painter works correctly 
            A(Height,Width)=EC; 
            GridDimension = 2;        
        case 'narrow-gap'
            %Set Grid Dimensions
            GapSize = GridParameter;
            Height = 40;
            Width = 40;
            TrueHeight = Height-1;
            TrueWidth = Width-1;
            %Create Matrix of zeros
            A = zeros(Height,Width);
            %Set Matrix to a matrix of twos (empty cells)
            A(:,:) = EC;
            %Set border
            A(1,1:Width) = 0;
            A(TrueHeight:Height,1:Width) = 0;
            A(1:Height,1) = 0;
            A(1:Height,TrueWidth:Width) = 0;
            %Create barriers
            mid = round(TrueHeight/2);
            %Find minimum and maximum of X and Y for cross barrier
            Xmin = mid - 1;
            Ymin = 1;
            Xmax = mid + 1;
            Ymax = TrueHeight;
            %Populate barrier cells
            for i = Xmin:1:Xmax
               for j = Ymin:1:Ymax
                   if A(i,j) == EC
                       A(i,j) = 0;
                   else
                   end
               end
            end
            %Find minimum and maximum of X and Y gap in cross barrier
            Xmin = mid - 3;
            Ymin = mid - (floor(GapSize/2)-1);
            Xmax = mid + 3;
            Ymax = mid + ceil(GapSize/2);
            %Empty cells in the gap
            for i = Xmin:1:Xmax
               for j = Ymin:1:Ymax
                   if A(i,j) == 0
                       A(i,j) = EC;
                   else
                   end
               end
            end
            %Set spot to ensure that the coverage painter works correctly 
            A(Height,Width)=EC;
            GridDimension = 2;           
        case 'island'
            %Set Grid Dimensions
            GapSize = GridParameter;
            Height = 40;
            Width = 40;
            TrueHeight = Height-1;
            TrueWidth = Width-1;
            %Create Matrix of zeros
            A = zeros(Height,Width);
            %Set Matrix to a matrix of twos (empty cells)
            A(:,:) = EC;
            %Set border
            A(1,1:Width) = 0;
            A(TrueHeight:Height,1:Width) = 0;
            A(1:Height,1) = 0;
            A(1:Height,TrueWidth:Width) = 0;
            %Find minimum and maximum of X and Y for centre barrier
            Xmin = 2 + GapSize;
            Ymin = 2 + GapSize;
            Xmax = TrueWidth - 1 - GapSize;
            Ymax = TrueHeight - 1 - GapSize;
            %Populate barrier cells
            A(Xmin:Xmax,Ymin:Ymax) = 0;
            %Set spot to ensure that the coverage painter works correctly 
            A(Height,Width)=EC; 
            GridDimension = 2;        
    end
end
            