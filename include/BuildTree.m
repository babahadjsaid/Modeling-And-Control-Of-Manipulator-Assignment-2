function [iTj] = BuildTree()
% This function should build the tree of frames for the chosen manipulator.
% Inputs: 'None'
% Outputs: The tree of frames.

% iTj is a 3-dimensional matlab matrix, suitable for defining tree of
% frames. iTj should represent the transformation matrix between the i-th and j-th
% frames. iTj(row,col,link_idx)
l1 = 175;
l2 = (60+213-175);
l3 = (431.5-326.5);
l41 = 326.5;
l42 = 145.5;
l5 = 35;
l6 = (420-35);
l7 = 153;
% from 0 to 1 identity no rotation 
iTj(:,:,1) = [eye(3) [0 0 l1]';0 0 0 1];

% from 1 to 2 90 degree in the -x axis
iTj(:,:,2) = [rotx(-90) [0 0 l2]';0 0 0 1]; 

%from 2 to 3 90 degree in the -y axis
iTj(:,:,3) =[roty(-90) [-l3 0 0]';0 0 0 1];

% from 3 to 4 90 degree in the +y axis 
iTj(:,:,4) = [roty(90) [0 -l42 l41]';0 0 0 1];

% from 4 to 5  +y axis 90 
iTj(:,:,5) = [roty(90) [l5 0 0]';0 0 0 1];

% from 5 to 6 +y 90 
iTj(:,:,6) = [roty(90) [0 0 l6]';0 0 0 1];

% from 6 to 7 -y 90
iTj(:,:,7) = [roty(-90) [-l7 0 0]';0 0 0 1];

end

