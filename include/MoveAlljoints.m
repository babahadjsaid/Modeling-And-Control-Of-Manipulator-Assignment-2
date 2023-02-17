function iTj_C = MoveAlljoints(geom_model,qi,qf,linkType,WithFrames,TraceRot)
%myFun - Description
%
% the function gets the qi and qf and plots the movment from initial to final configuration 
% Syntax: iTj_C = myFun(geom_model,qi,qf,linkType,WithFrames,TraceRot)
%
numberOfSteps = 100;
dt = 0.1;
numberOfLinks = 7;
iTj_C = GetDirectGeometry(qi,geom_model,linkType);
increament = (qf-qi)/numberOfSteps;
l = line(0,0,0);
for j = 1:numberOfSteps
    % when the TraceRot is one we will delete the privious lines and keep the joints to 
    % draw the trajectory of each joint
    if TraceRot
        delete(l);
    end
    % apply the rotation to get the new transformation matrices
    iTj_C = GetDirectGeometry(increament,iTj_C,linkType);
    for i =1:numberOfLinks
        bTi(:,:,i)= GetTransformationWrtBase(iTj_C,i);
    end
    for i = 1:numberOfLinks
        bri(:,i) = GetBasicVectorWrtBase(bTi,i);
    end
    % plot the joints positions
    plot3(bri(1,:),bri(2,:),bri(3,:),'bo','LineWidth',3);
    hold on;
    % draw the lines between them
    l = line(bri(1,:),bri(2,:),bri(3,:),'LineWidth',3);
    % if WithFrames is true display the frames at each joint
    if WithFrames
        for index = 1:numberOfLinks
            axis = [bri(:,index) + bTi(1:3,1:3,index)*[100 0 0]',...
            bri(:,index) + bTi(1:3,1:3,index)*[0 100 0]',...
            bri(:,index) + bTi(1:3,1:3,index)*[0 0 100]'];
            line([bri(1,index),axis(1,1)],[bri(2,index),axis(2,1)],[bri(3,index),axis(3,1)],'Color','r','Marker','<','LineWidth',1.5);
            line([bri(1,index),axis(1,2)],[bri(2,index),axis(2,2)],[bri(3,index),axis(3,2)],'Color','g','Marker','<','LineWidth',1.5);
            line([bri(1,index),axis(1,3)],[bri(2,index),axis(2,3)],[bri(3,index),axis(3,3)],'Color','b','Marker','<','LineWidth',1.5);
        end
    end
    if TraceRot == 0
        hold off
    end
    pause(dt);
    
end
hold off
end