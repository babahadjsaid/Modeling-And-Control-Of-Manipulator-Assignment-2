function [iTj]=GetFrameWrtFrame(linkNumber_i, linkNumber_j,biTei)
%%% GetFrameWrtFrame function 
% inputs : 
% linkNumber_i : number of ith link 
% linkNumber_j: number of jth link 
% biTei vector of matrices containing the transformation matrices from link i to link i +1 for the current q.
% The size of biTri is equal to (4,4,numberOfLinks)
% outputs:
% iTj : transformationMatrix in between link i and link j for the
% configuration described in biTei


Ri = biTei(1:3,1:3,linkNumber_i);
% calculate the inverse of Ri
Ti_inv = [Ri' -Ri'*biTei(1:3,4,linkNumber_i);0 0 0 1];
iTj = Ti_inv * biTei(:,:,linkNumber_j) ;
end