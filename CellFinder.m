function [NumCA,CellArray] = CellFinder(TrueWidth,TrueHeight,A,C)
%This function searches for specific cell values within the grid matrix and
%returns an array with the number of these cells as well as an array with
%the cell coordinates.
%TrueWidth is the Y limit of the grid, TrueHeight is the X limit of the
%grid,providing the coordinates of the grid to search. A is the grid matrix
%and C is the cell value being searched for.

    %Initialise Free cell counter and array
    CNo = 1;
    CellArray = [];
    %Collect all free cell locations into array
    for i = 1:1:TrueHeight
        for j = 1:1:TrueWidth
            if A(i,j)== C
                X = i; Y = j;
                CellArray(CNo,:) = [X,Y];
                CNo = CNo + 1;
            else
            end
        end
    end
    %Calculate number of free cells
    NumCA = CNo-1;
    


end