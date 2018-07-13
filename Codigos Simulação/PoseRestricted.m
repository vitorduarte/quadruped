%esse código espera servir de fitness function para a toolbox gamultobjec
%ou ga
%(Apps ->Optmization -> Solver: gamultobject). Espera-se que o robô
%simulado possa retornar os valores do acelerometro no eixo y do V-REP
%(velocidade para frente, que deve ser a maior possível, até algum valor determinado), no eixo x (velocidade lateral
% que deve ser próxima de zero) e do acelerometro em Z (que também deve ser
% próxima de zero).


function fitness = learning_poses(poses)
    
    
    A = [1 1 1 -1 -1 -1 -1 -1 -1 1 1 1];
    I = [1 -1 -1 1 -1 -1 1 -1 -1 1 -1 -1];
    poses = reshape(poses,4,4);
    poses = poses - rem(poses,1);
    vrep=remApi('remoteApi');
    vrep.simxFinish(-1);
    %marcha_rad = zeros(125,12)
    clientID=vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
    %clientID
    t = 0;
    j=1;
    T = 22.144;
    l = 1;
    k= 1;%tamanho da perna do robo no V-rep em metros
    %esse código quer movimentar apenas uma junta.
    %vrep=remApi('remoteApi');
    time_count = 0;
    vetor_poses = zeros(4,3);
    
    angle_back = 35.7570; %angulo da passada para trás-> algoritmo genetico pode aprender isso
    angle_front = 36.9817;%angulo da passada para frente -> ''   ''  ''  ''  ''
    x_p = 20.9077; %posição x da ponta da pata na pose de transição trás -> frente 
    y_p = -1.0230; %posição y da ponta da pata na pose de transição trás -> frente
    z_p = 2.3826; %posição z da ponta da pata na pose de transição trás -> frente
    
    p1 = [T 0 0];
    p2 = [T*sin((pi/2) - (angle_back*pi/180)) 0 T*cos((pi/2)- (angle_back*pi/180))]; %pi/2 - o angulo que vc realmente quer que a perna suba
    p3 = [x_p y_p z_p]; %algoritmo genetico pode aprender isso aqui tmb -> pata levantada pra passada
    p4 = [T*sin((pi/2) - (angle_front*pi/180)) 0 -T*cos((pi/2) - (angle_front*pi/180))];
    vetor_end_points = [p1; p2; p3; p4];
    for i=1:4
        vetor_poses(i,:) = inverse_kinematics(vetor_end_points(i,:)) ;
    end
    
    if (clientID>-1)
        disp('Connected');
    
        %Handles
        for i=1:12
            [returnCode, junta(i)]=vrep.simxGetObjectHandle(clientID,strcat('Jmotor',int2str(i)),vrep.simx_opmode_blocking);
        end
        
        %jHandler = [junta(1)  junta(2) junta(3) junta(4) junta(5) junta(6) junta(7)  junta(8) junta(9) junta(10)  junta(11) junta(12)];
        
        %setting up the accelerometer
        [~,x(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_streaming);
        %x(j)=xAccel;
        [~,y(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_streaming);
        %y(j)=yAccel;
        [~,z(j)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_streaming);
        %z(j)=zAccel;
        
         
        %settting up the gps
        [~,px(j)]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_streaming);
        %px(j)=xpos;
        [~,py(j)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_streaming);
        %py(j)=ypos;
        [~,pz(j)]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_streaming);
        %pz(j)=zpos;
        %j=j+1;
        for i = 1:12
            [~,present_pos(i)]=vrep.simxGetJointPosition(clientID,junta(i),vrep.simx_opmode_streaming);
        end
        vrep.simxSynchronous(clientID,true);
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        time_inic = tic;
        for leg_pose=1:4   
            joints_angles = [vetor_poses(poses(1,leg_pose),:), vetor_poses(poses(2,leg_pose),:), vetor_poses(poses(3,leg_pose),:), vetor_poses(poses(4,leg_pose),:)].*A.*I;
            for i =1:12
             [~]=vrep.simxSetJointTargetPosition(clientID,junta(i),joints_angles(i),vrep.simx_opmode_streaming);
            end
            tic;
            while (max(abs(present_pos-joints_angles))>0.01) && (t < 4)
                vrep.simxSynchronousTrigger(clientID);%trigger para executar a etapa do programa -> movimento das 12 
                for j=1:12
                    [~,present_pos(j)]=vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                    [~,mede_pos(l,j)] = vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                    time_count = (time_count + toc(time_inic));
                    timestamp(l) = time_count;
                end
                [~,py(k)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_buffer);
                [~,pz(k)]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_buffer);
                [~,px(k)]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_buffer);
                [~,x(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
                [~,y(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
                [~,z(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
                k = k+1;
                l = l+1;
                t = toc;
                
            end
            t = 0;
            %l=1;
        end 
    end
    vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
    vrep.simxFinish(clientID);
    disp('Disconnected');        


    vrep.delete();
    disp('Finished');
    %fitness(1) = abs(time_elapsed/(py(length(py)))); %visando maximizar a velocidade minimizando o inverso dela (tempo/espaço)
    %fitness(2) = max(abs(gradient(y)));  
    %fitness(3) = max(abs(gradient(x)));
    %fitness(4) = max(abs(gradient(pz)));
    %time_count;
    %fitness(1) = abs(time_count/(py(length(py)) - py(2))); %minimizando o inverso da velocidade;
    %fitness(2) = (max(pz(pz~=0)) - min(pz(pz~=0)));
    %tentando minimzar binariamente. 2nd run svai tentar minimizar a diferença em si
    %fitness(3) = abs((max(px(px~=0)) - min(px(px~=0))));
    timestamp=timestamp/1000;
    D = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1500);
    
    px_f = filter(D,px);
    py_f = filter(D,py);
    pz_f = filter(D,pz);
    
    x_f = filter(D,x);
    y_f = filter(D,y);
    z_f = filter(D,z);
    
    roll = rad2deg(atan2(x, -z));
    pitch = rad2deg(atan2((-y), sqrt(power(x, 2) + power(-z, 2))));
    
    roll_filtered = filter(D,roll);
    pitch_filtered = filter(D, pitch);
    
    timestamp = timestamp/1000;
    %dealing with filter delay
    delay = round(mean(grpdelay(D)));

    roll_filt_fix = roll_filtered(1+delay:end);
    %roll = roll(1:end-delay);

    pitch_filt_fix = pitch_filtered(1+delay:end);
    %pitch = pitch(1:end-delay);
    
    px_filt_fix = px_f(1+delay:end);
    py_filt_fix = py_f(1+delay:end);
    pz_filt_fix = pz_f(1+delay:end);
    
    

    timestamp_filt_fix = timestamp(1:end-delay);
  
    figure(1)
    for i=1:12
        subplot(4,3,i)
        plot(timestamp,mede_pos(:,i));
        title(['Motor ' num2str(i)])
        %plot(timestamp(length(timestamp)-1),vel(:,2));
        xlabel('Tempo (s)');
        ylabel('Posição (rad)');
    end
   
    
    figure(2)
    subplot(3,2,1)
    plot(timestamp_filt_fix,px_filt_fix);
    title('Posição em x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
    
    subplot(3,2,2)
    plot(timestamp_filt_fix,roll_filt_fix);
    %hold on
    %plot(timestamp, roll);
    title('Ângulo de rolagem x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Ângulo (graus)');
    
    subplot(3,2,3)
    plot(timestamp_filt_fix,py_filt_fix);
    title('Posição em y vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
    
    subplot(3,2,4)
    plot(timestamp_filt_fix,pitch_filt_fix);
    title('Ângulo de arfagem vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Ângulo (graus)'); 
    
    subplot(3,2,5)
    plot(timestamp_filt_fix,pz_filt_fix);
    title('Posição em z vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
end