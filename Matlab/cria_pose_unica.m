function score = cria_pose_unica(parametros)



    %junta � o vetor de handler da pata  

    %[20 0 0] uma poss�vel pose ; [20 -1 0] (pata levantada ao meio Transi��o tr�s-frente)
    %[T 0 0] pose do meio
    %[T*sin((pi/2) - (pi/6)) 0 -T*cos((pi/2) - (pi/6))] ;pose pra colocar a
    %pata a frente
    %[T*sin((pi/2) - (pi/6)) 0 T*cos((pi/2) - (pi/6))] %pose para colocar a
    %pata atras
    
    walking_angle = -10; %angulo que vetor for�a faz com eixo x no plano y z do vrep
    time_count = 0;
    T = 22.144;
    j=1;
    k=1;
    %parametros de altera��o das poses
    angle_back = parametros(1); %angulo da passada para tr�s-> algoritmo genetico pode aprender isso
    angle_front = parametros(2);%angulo da passada para frente -> ''   ''  ''  ''  ''
    x_p = parametros(3); %posi��o x da ponta da pata na pose de transi��o tr�s -> frente 
    y_p = parametros(4); %posi��o y da ponta da pata na pose de transi��o tr�s -> frente
    z_p = parametros(5); %posi��o z da ponta da pata na pose de transi��o tr�s -> frente
    
    p1 = [T 0 0];
    p2 = [T*sin((pi/2) - (angle_back*pi/180)) 0 T*cos((pi/2)- (angle_back*pi/180))]; %pi/2 - o angulo que vc realmente quer que a perna suba
    p3 = [x_p y_p z_p]; %algoritmo genetico pode aprender isso aqui tmb -> pata levantada pra passada
    p4 = [T*sin((pi/2) - (angle_front*pi/180)) 0 -T*cos((pi/2) - (angle_front*pi/180))];
    vetor_end_points = [p1; p2; p3; p4];
    for i=1:4
        vposes(i,:) = inverse_kinematics(vetor_end_points(i,:)) ;
    end
    tf = isreal(vposes)
    if tf == 0
        score(1) = inf;
        score(2) = inf;
        return;
    end
    padraocaminhada = [4 1 2 3;2 3 4 1; 4 1 2 3; 2 3 4 1]; %[pata1; pata2; pata3; pata4] no sentido inverso, pata3 e pata4 estao na frente -> algoritmo genetico pode aprender isso 
    
    
    angle_matrix = [vposes(padraocaminhada(1,1),:) vposes(padraocaminhada(2,1),:) vposes(padraocaminhada(3,1),:) vposes(padraocaminhada(4,1),:); vposes(padraocaminhada(1,2),:) vposes(padraocaminhada(2,2),:) vposes(padraocaminhada(3,2),:) vposes(padraocaminhada(4,2),:) ; vposes(padraocaminhada(1,3),:) vposes(padraocaminhada(2,3),:) vposes(padraocaminhada(3,3),:) vposes(padraocaminhada(4,3),:); vposes(padraocaminhada(1,4),:) vposes(padraocaminhada(2,4),:) vposes(padraocaminhada(3,4),:) vposes(padraocaminhada(4,4),:)];
    %angle matrix � uma matriz 4x12, em que as linhas s�o as poses do robo e
    %as colunas, os angulos de cada junta. O que importa mesmo �
    %padraocaminhada  
    
    vrep=remApi('remoteApi');
    vrep.simxFinish(-1);
    clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);    
    
     if (clientID>-1)
        disp('Connected');
    
        %Handles
        for i=1:12
            [returnCode, junta(i)]=vrep.simxGetObjectHandle(clientID,strcat('Jmotor',int2str(i)),vrep.simx_opmode_blocking);
        end
        
        %dados do acelerometro
        [~,x(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_streaming);
        [~,y(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_streaming);
        [~,z(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_streaming);
        
    
        %dados do gps
        [~,px(j)]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_streaming);
        [~,py(j)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_streaming);
        [~,pz(j)]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_streaming);
        
        for i = 1:12
            [~,present_pos(i)]=vrep.simxGetJointPosition(clientID,junta(i),vrep.simx_opmode_streaming);
        end
        vrep.simxSynchronous(clientID,true);
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        %for k = 1:3 %execu��o do ciclo k vezes
            for i = 1:4 %ciclo composto de quatro poses por pata
                joints_angles_normal = angle_matrix(i,:).*[1 1 1 1 -1 -1 1 -1 -1 1 1 1].*[1 -1 -1 1 -1 -1 1 -1 -1 1 -1 -1]; %M*A*I; A = arrumar patas espelhadas e I � inversor de sentido
                for j=1:12  
                    [~]=vrep.simxSetJointTargetPosition(clientID,junta(j),joints_angles_normal(j),vrep.simx_opmode_streaming); %mandando o sinal para as patas
                end
                tic
                while (max(abs(present_pos-joints_angles_normal)>0.01)) && (toc < 3)
                    vrep.simxSynchronousTrigger(clientID);%trigger para executar a etapa do programa -> movimento das 12 
                    for j=1:12
                        [~,present_pos(j)]=vrep.simxGetJointPosition(clientID,junta(j),vrep.simx_opmode_buffer);
                        %diff = abs(present_pos-joints_angles_normal(i));
                        %linha para checar a diferen�a da posi��o atual com
                        %a desejada
                    end
                    [~,py(k)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_buffer);
                    [~,x(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
                    [~,y(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
                    [~,z(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
                    k = k+1;
                    toc;
                    time_count = time_count + toc;
                end
            end
        %end
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
        disp('Disconnected');
    end 
    vrep.delete();
    disp('Finished');
    
    %fitness functions
    score(1) = time_count/(py(length(py))); %minimizando o inverso da velocidade;
    score(2) = abs((walking_angle*pi/180) - atan2(z(length(z)), y(length(y)))); %visa minimizar referencia - angulo de guinada. Teoricamente impede a queda tmb
    
end