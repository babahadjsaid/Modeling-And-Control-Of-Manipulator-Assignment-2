function iTj_q = DirectGeometry(qi, iTj, linkType)
% DirectGeometry Function 
% inputs: 
% q : current link position;
% biTri is the constant transformation between the base of the link <i>
% and its end-effector; 
% jointType :0 for revolute, 1 for prismatic

% output :
% biTei : transformation between the base of the joint <i> and its end-effector taking 
% into account the actual rotation/traslation of the joint
Ki = [0 0 1];
if linkType == 0 % rotational
    iTj_q = [iTj(1:3,1:3)*rotz(qi*(180/pi)) iTj(1:3,4);0 0 0 1];
elseif linkType == 1 % prismatic
    iTj_q = [iTj(1:3,1:3) iTj(1:3,4)+Ki*qi;0 0 0 1];
end

end