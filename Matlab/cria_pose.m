function z = cria_pose(junta, pose)

%junta é o vetor de handler da pata  

%pos é a pose que se deseja mover a pata
% pos = 1, 2 ,3 ou 4

%[20 0 0] uma possível pose ; [20 -1 0] (pata levantada ao meio Transição trás-frente)
%[T 0 0] pose do meio
%[T*sin((pi/2) - (pi/6)) 0 -T*cos((pi/2) - (pi/6))] ;pose pra colocar a
%pata a frente

%[T*sin((pi/2) - (pi/6)) 0 T*cos((pi/2) - (pi/6))] %pose para colocar a
%pata atras
T = 22.144 %tamanho da perna do robo no V-rep em metros
%esse código quer movimentar apenas uma junta.
vrep=remApi('remoteApi');
vetor_poses = zeros(4,3);
p1 = [T 0 0];
p2 = [T*sin((pi/2) - (pi/6)) 0 T*cos((pi/2) - (pi/6))];
p3 = [20 -3 0];
p4 = [T*sin((pi/2) - (pi/6)) 0 -T*cos((pi/2) - (pi/6))]
vetor_end_points = [p1; p2; p3; p4]
for i=1:4
    vetor_poses(i,:) = inverse_kinematics(vetor_end_points(i,:)) 
end
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
%clientID;
%joints_angles = inverse_kinematics([T*sin((pi/2) - (pi/6)) 0 T*cos((pi/2) - (pi/6))]) %inverse_kinematics(x_c, y_c, z_c) -> points of interest
%pos_rad = pos
k=0;
if (clientID>-1)
   disp('Connected');
    
        %Handles
        %for i=1:12
         %   [returnCode, junta(i)]=vrep.simxGetObjectHandle(clientID,strcat('Jmotor',int2str(i)),vrep.simx_opmode_blocking);
        %end
        
        joints_angles = vetor_end_points(pose,:);
        vrep.simxSynchronous(clientID,true);
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        while true
                vrep.simxSynchronousTrigger(clientID);
                for i =1:3
                    while k <= 10
                        k = k+1
                        vrep.simxSynchronousTrigger(clientID);
                        [~]=vrep.simxSetJointTargetPosition(clientID,junta(i),joints_angles(i),vrep.simx_opmode_streaming);
                    end
                    k = 0;

                end
                
               %[~] = vrep.simxPauseCommunication(clientID,0);
            end
        end
           
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
        disp('Disconnected');
end
    
    vrep.delete();
    disp('Finished');