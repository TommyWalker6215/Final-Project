function Mat_R_T_M = collisionBoxCans(ModelNumber)

        % Getting Pose 
        models = getModels;                                  % Extract gazebo model list
        model_name = models.ModelNames{ModelNumber};         % rCan3=26, yCan1=27,rBottle2=32...%model_name = models.ModelNames{i}  
    
        fprintf('Creating Collision Boxes model: %s \n',model_name);
        [mat_R_T_G, mat_R_T_M] = get_robot_object_pose_wrt_base_link(model_name);
canBox = collisionBox(0.07, 0.07, 0.12);
        %box = collisionBox(0.07, 0.07, 0.12);
        %box.Pose = mat_R_T_M;
        %box.convertToCollisionMesh;
        

end