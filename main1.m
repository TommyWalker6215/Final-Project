% =========================================================================
% This is the Mechatronics Final Project MAIN Code
% This is the MAIN matlab file that will be calling the
%       individual_arm_round.m function (which calls many functions itself)
% Make sure to initialize ROS before beginning the program
% RRT :)
% =========================================================================

    clc
    clear
    close all
    rosshutdown;
    masterhostIP = "192.168.213.128";
    rosinit(masterhostIP)
    oblivion = [1 0 0 -1; 0 1 0 -1; 0 0 1 -1; 0 0 0 1]
    
% opening print
disp('Hello User! Starting Robot...')
pause(1)

% loading environment
disp('Loading Environment...')
env = Generate_Env2();
%   taking all objects from the env cell array, and placing them into the new
%   environment cell array, effectively removing all non-collision-box 
%   objects
env_new = {};
for i = 1:numel(env)
    if ~isa(env{i}, 'double')
        env_new{end+1} = env{i};
    end
end
disp('Environment Complete.')
pause(1)

for i=[12:19]
    individualArmRound2(i, env_new)
    env_new{i}.Pose = oblivion
end

for i=[20:30]
    individualArmRound2(i, env_new)
    env_new{i}.Pose = oblivion
end

for i=[31:39]
    individualArmRound2(i, env_new)
    env_new{i}.Pose = oblivion
end

disp('All Done!')
pause(1)
disp('Good Luck Everyone!')