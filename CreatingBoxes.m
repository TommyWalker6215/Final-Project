clc
clear
rosshutdown;
masterhostIP = "192.168.213.128";
rosinit(masterhostIP)

    disp('Going home...');
    goHome('qr');    % moves robot arm to a qr or qz start config
    disp('Resetting the world...');
    resetWorld;      % reset models through a gazebo service

disp('Getting goal...')
      for i = 24;
            if i == 24;
                collisionBoxCans([i])
            else
                disp('Something When Wrong')
            end
      end

 disp('Done')
