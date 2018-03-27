%esse código espera servir de fitness function para a toolbox gamultobjec
%ou ga
%(Apps ->Optmization -> Solver: gamultobject). Espera-se que o robô
%simulado possa retornar os valores do acelerometro no eixo y do V-REP
%(velocidade para frente, que deve ser a maior possível, até algum valor determinado), no eixo x (velocidade lateral
% que deve ser próxima de zero) e do acelerometro em Z (que também deve ser
% próxima de zero).


function marcha_rad = marchando_vrep(joint_angles)
    
    
    joint_angles = reshape(joint_angles,40,12);
    vrep=remApi('remoteApi');
    vrep.simxFinish(-1);
    %marcha_rad = zeros(125,12)
    clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
    clientID
   
    if (clientID>-1)
        disp('Connected');
    
        %Handles
        for i=1:12
            [returnCode, junta(i)]=vrep.simxGetObjectHandle(clientID,strcat('Jmotor',int2str(i)),vrep.simx_opmode_blocking);
        end
        
        %setting up the accelerometer
        [~,xAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_streaming);
        %x(j)=xAccel;
        [~,yAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_streaming);
        %y(j)=yAccel;
        [~,zAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_streaming);
        %z(j)=zAccel;
        
         
        %settting up the gps
        [~,xpos]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_streaming);
        %px(j)=xpos;
        [~,ypos]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_streaming);
        %py(j)=ypos;
        [~,zpos]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_streaming);
        %pz(j)=zpos;
        %j=j+1;
        
        vrep.simxSynchronous(clientID,true);
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        for i = 1:40
            for j=1:12
                vrep.simxSynchronousTrigger(clientID);
                [~]=vrep.simxSetJointTargetPosition(clientID,junta(j),joint_angles(i,j),vrep.simx_opmode_streaming);
                %pause(1)
            end
            [~,xAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
            x(i)=xAccel;
            [~,yAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
            y(i)=yAccel;
            [~,zAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
            z(i)=zAccel;
            [~,ypos]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_streaming);
            py(i) = ypos;
        end
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
        disp('Disconnected');
    end
    y
    marcha_rad(1) = sum(gradient(x));
    marcha_rad(2) = sum(gradient(y));
    marcha_rad(3) = sum(gradient(z));
    marcha_rad(4) = 1/sum(gradient(py));    
    vrep.delete();
    disp('Finished');
    %return marcha_rad
end
