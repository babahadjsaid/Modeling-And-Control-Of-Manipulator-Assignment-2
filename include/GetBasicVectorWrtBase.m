function [r]=GetBasicVectorWrtBase(biTei, linkNumber)
%%% GetBasicVectorWrtBase function 
% input :
% iTj trasnformation matrix in between i and j 
% output
% r : basic vector from i to j

% since we already calculated frame with respect to base we just have 
% to extract the vector which is just the last column of the transformation matrix.
r = biTei(1:3,end,linkNumber) ;

end