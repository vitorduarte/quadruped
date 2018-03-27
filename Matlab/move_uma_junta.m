clear all

%esse código quer movimentar apenas uma junta.
vrep=remApi('remoteApi');

vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
clientID
pos = [0 30 45 60 90];
pos_rad = (pos*pi)/180; 
%pos_rad = pos
k=1;
if (clientID>-1)
    disp('Connected');
    %vrep.simxSynchronous(clientID,true);
    %vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
    %Handles
    
    [returnCode, junta5]=vrep.simxGetObjectHandle(clientID,'Jmotor5',vrep.simx_opmode_blocking);
    %if(returnCode==0)
    %disp(strcat('Jmotor',int2str(i),' Connected')) 
     [~,present_pos]=vrep.simxGetJointPosition(clientID,junta5,vrep.simx_opmode_streaming)
     %present_pos = 0;
     %while(true)
      [~]=vrep.simxSetJointTargetPosition(clientID,junta5,pos_rad(1),vrep.simx_opmode_streaming);
      pause(2)
      [~]=vrep.simxSetJointTargetPosition(clientID,junta5,pos_rad(2),vrep.simx_opmode_streaming);
      pause(2)
      [~]=vrep.simxSetJointTargetPosition(clientID,junta5,pos_rad(3),vrep.simx_opmode_streaming);
      pause(2)
      [~]=vrep.simxSetJointTargetPosition(clientID,junta5,pos_rad(4),vrep.simx_opmode_streaming);
      pause(2)
      [~]=vrep.simxSetJointTargetPosition(clientID,junta5,pos_rad(5),vrep.simx_opmode_streaming);
      pause(2)
      [~,present_pos]=vrep.simxGetJointPosition(clientID,junta5,vrep.simx_opmode_buffer) 
     %[~]=vrep.simxSetJointTargetVelocity(clientID,junta6,0.1,vrep.simx_opmode_blocking);
       %k = k+1;
     %end
     %vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
     vrep.simxFinish(clientID);
     disp('Disconnected');
    end
    vrep.delete();
    disp('Finished');
