%% Modelling and Control of Manipulator assignment 2: Manipulator Geometry and Direct kinematic
clc;
clear;
close all;
addpath('include');

input("Question 1.1)press Enter to continue!!");
geom_model = BuildTree();
disp("The obtained geometric model is:");
disp(geom_model);

% Useful initizializations
numberOfLinks = 7;                  % number of manipulator's links.
linkType = [0 0 0 0 0 0 0];         % boolean that specifies two possible link types: Rotational, Prismatic.
bri= zeros(3,numberOfLinks);        % Basic vector of i-th link w.r.t. base
bTi = zeros(4,4,numberOfLinks);     % Trasformation matrix i-th link w.r.t. base
iTj = zeros(4,4,1);
% Initial joint configuration 
q = [1.3,1.3,1.3,1.3,1.3,1.3,1.3];

% Q1.1 and Q1.2
input("Question 1.2)press Enter to continue!!");
biTei = GetDirectGeometry(q,geom_model,linkType);
disp("for following configuration q=");
disp(q);
disp("we got the following matrices:");
disp(biTei);
%Q1.3
input("Question 1.3)press Enter to continue!!");
for i =1:numberOfLinks
    bTi(:,:,i)= GetTransformationWrtBase(biTei,i); 
end

disp("The matrices projected into the base are:");
disp(bTi);
b = 0;
% To test the function it is working i just went throught all the possible combination of i and j 
% and calculated iTj and store them in an array.
for i= 2:numberOfLinks
    for j=i+1:numberOfLinks
        iTj(:,:,b+j-i) = GetFrameWrtFrame(i,j,bTi);
        keyboard
    end
    b = b + (numberOfLinks-i-1);
end

% Looping through the links to get the vectors with respect to base.
for i = 1:numberOfLinks
    bri(:,i) = GetBasicVectorWrtBase(bTi,i);
end
disp('joint positions are:');
disp(bri);
% Q1.4
disp("Question 1.4)");
qi = q;
qf = [2,2,2,2,2,2,2];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,0);


qi = [1.3, 0, 1.3, 1.7, 1.3, 0.8, 1.3];
qf = [2, 0, 1.3, 1.7, 1.3, 0.8, 1.3];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,0);

qi = [1.3, 0.1, 0.1, 1, 0.2, 0.3, 1.3];
qf = [2, 2, 2, 2, 2, 2, 2];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,0);

%1.5
disp("Question 1.5)");
qi = linkType;%it is a vector with 7 zeros so i use it as qi here
qf = [0 0 0 pi/2 0 0 0];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,1);

qi = linkType;
qf = [0 0 0 0 0 pi/2 0];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,1);

qi = qf;
qf = [0 0 0 0 pi/2 pi/2 0];
disp('qi=');
disp(qi);
disp('qf=');
disp(qf);
input("press Enter to continue!!");
MoveAlljoints(geom_model,qi,qf,linkType,0,1);


