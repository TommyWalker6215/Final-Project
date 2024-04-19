% this function is called by individualArmRound2
% this function moves the arm to a specified transformation matrix

function traj_result = moveTo3(mat_R_T_M,ops)
    ur5e = loadrobot("universalUR5e",DataFormat="row");
    mat_traj = mat_R_T_M;
    [mat_joint_traj,rob_joint_names] = convertPoseTraj2JointTraj4(ur5e,mat_traj,ops('toolFlag'));
    pick_traj_act_client = rosactionclient('/pos_joint_traj_controller/follow_joint_trajectory',...
                                           'control_msgs/FollowJointTrajectory', ...
                                           'DataFormat', 'struct');
    % Create action goal message from client
    traj_goal = rosmessage(pick_traj_act_client); 
    % Convert to trajectory_msgs/FollowJointTrajectory
    disp('Converting to JointTrajectory format...');
    traj_goal = convert2ROSPointVec4(mat_joint_traj,rob_joint_names,ops('traj_steps'),ops('traj_duration'),traj_goal); % Consider passing in ops directly
    % Finally send ros trajectory with traj_steps
    disp('Sending traj to action server...')
    if waitForServer(pick_traj_act_client)
        disp('Connected to action server. Sending goal...')
        [traj_result,state,status] = sendGoalAndWait(pick_traj_act_client,traj_goal);
    else
        % Re-attempt
        disp('First try failed... Trying again...');
        [traj_result,state,status] = sendGoalAndWait(pick_traj_act_client,traj_goal);
    end 

    traj_result = traj_result.ErrorCode;

end

