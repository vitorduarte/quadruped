function score = cria_pose_unica(parametros)


    %junta é o vetor de handler da pata  

    %[20 0 0] uma possível pose ; [20 -1 0] (pata levantada ao meio Transição trás-frente)
    %[T 0 0] pose do meio
    %[T*sin((pi/2) - (pi/6)) 0 -T*cos((pi/2) - (pi/6))] ;pose pra csolocar a
    %pata a frente
    %[T*sin((pi/2) - (pi/6)) 0 T*cos((pi/2) - (pi/6))] %pose    para colocar a
    %pata atras
    
    A = [1 1 1 -1 -1 -1 -1 -1 -1 1 1 1];
    I = [1 -1 -1 1 -1 -1 1 -1 -1 1 -1 -1];
    %walking_angle = 0; %angulo que vetor força faz com eixo x no plano y z do vrep
    time_count = 0;
    cont_timer = 0;
    T = 22.144;
    j=1;
    k=1;
    
    l =1;
    p=1;
    %defasagem = 1; %quanto menor esse número maior vai ser a defasagem.
    %0.01 é o menor número possível. -> defasagem de 180º
    %1+, defa
    t = 0;
    %parametros de alteração das poses
    angle_back = parametros(1); %angulo da passada para trás-> algoritmo genetico pode aprender isso
    angle_front = parametros(2);%angulo da passada para frente -> ''   ''  ''  ''  ''
    x_p = parametros(3); %posição x da ponta da pata na pose de transição trás -> frente 
    y_p = parametros(4); %posição y da ponta da pata na pose de transição trás -> frente
    z_p = parametros(5); %posição z da ponta da pata na pose de transição trás -> frente
    defasagem = parametros(6);
    
    
    
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
        %score = inf;
        score(1) = inf;
        score(2) = inf;
        score(3) = inf;
        return;
    end
    %padraocaminhada = [4 1 2 3;2 3 4 1; 4 1 2 3; 2 3 4 1]; %[pata1; pata2; pata3; pata4] no sentido inverso, pata3 e pata4 estao na frente -> algoritmo genetico pode aprender isso 
    padraocaminhada = [3 4 1 2; 1 2 3 4;3 4 1 2;1 2 3 4];% -> marcha começando de um ponto
    %diferente
    %[4 1 2 3; 2 3 4 1; 2 3 4 1; 4 1 2 3] -> marcha com os dois pés do
    %mesmo lado do robo se movendo ao mesmo tempo.
    
    angle_matrix = [vposes(padraocaminhada(1,1),:) vposes(padraocaminhada(2,1),:) vposes(padraocaminhada(3,1),:) vposes(padraocaminhada(4,1),:); vposes(padraocaminhada(1,2),:) vposes(padraocaminhada(2,2),:) vposes(padraocaminhada(3,2),:) vposes(padraocaminhada(4,2),:) ; vposes(padraocaminhada(1,3),:) vposes(padraocaminhada(2,3),:) vposes(padraocaminhada(3,3),:) vposes(padraocaminhada(4,3),:); vposes(padraocaminhada(1,4),:) vposes(padraocaminhada(2,4),:) vposes(padraocaminhada(3,4),:) vposes(padraocaminhada(4,4),:)];
    %angle matrix é uma matriz 4x12, em que as linhas são as poses do robo e
    %as colunas, os angulos de cada junta. O que importa mesmo é
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
        a = tic;
        for m = 1:3 %execução do ciclo k vezes
            for i = 1:4 %ciclo composto de quatro poses por pata
                joints_angles_normal = angle_matrix(i,:).*A.*I; %M*A*I; A = arrumar patas espelhadas e I é inversor de sentido
                for j=1:6  
                    [~]=vrep.simxSetJointTargetPosition(clientID,junta(j+6),joints_angles_normal(j+6),vrep.simx_opmode_streaming); %mandando o sinal para as patas
                end
                tic;
                while (max(abs(present_pos(7:length(present_pos))-joints_angles_normal(7:length(joints_angles_normal)))) >= defasagem) && (t < 4)
                    vrep.simxSynchronousTrigger(clientID);%trigger para executar a etapa do programa -> movimento das 12 
                    for j=1:6
                        [~,present_pos(j+6)]=vrep.simxGetJointPosition(clientID, junta(j+6), vrep.simx_opmode_buffer);
                        %diff = abs(present_pos-joints_angles_normal(i));
                        %[~,mede_pos(l,j+6)] = vrep.simxGetJointPosition(clientID, junta(j+6), vrep.simx_opmode_buffer);
                        cont_timer = cont_timer + toc(a);
                        %timestamp(l) = cont_timer;
                        %linha para checar a diferença da posição atual com
                        %a desejada
                    end
                    l = l+1;
                    
                    [~,py(k)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_buffer);
                    [~,pz(k)]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_buffer);
                    [~,px(k)]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_buffer);
                    [~,x(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
                    [~,y(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
                    [~,z(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
                    k = k+1;
                    t = toc;
                    time_count = time_count + toc(a);
                end
                %pause(1)
                t = 0;
                for j=1:6  
                    [~]=vrep.simxSetJointTargetPosition(clientID,junta(j),joints_angles_normal(j),vrep.simx_opmode_streaming); %mandando o sinal para as patas
                end
                while (max(abs(present_pos-joints_angles_normal))>0.01) && (t < 4)
                    vrep.simxSynchronousTrigger(clientID);%trigger para executar a etapa do programa -> movimento das 12 
                    for j=1:12
                        [~,present_pos(j)]=vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                        %diff = abs(present_pos-joints_angles_normal(i));
                        [~,mede_pos(l,j)] = vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                        cont_timer = cont_timer + toc(a);
                        timestamp(l) = cont_timer;
                        %linha para checar a diferença da posição atual com
                        %a desejada
                    end
                    l = l+1;
                    
                    [~,py(k)]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_buffer);
                    [~,pz(k)]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_buffer);
                    [~,px(k)]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_buffer);
                    [~,x(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
                    [~,y(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
                    [~,z(k)]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
                    k = k+1;
                    t = toc;
                    time_count = time_count + toc(a);
                end
                
            end
        end
        Timevrep = vrep.simxGetLastCmdTime(clientID);
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
        disp('Disconnected');
    end 
    vrep.delete();
    disp('Finished');
    
    
    
    %for i = 1:12
    %    for j=2:length(mede_pos(:,1))-1
    %        next_value = mede_pos(j+1,i);
    %        prev_value = mede_pos(j-1,i);
    %        vel(j-1,i) = (next_value - prev_value)/(timestamp(j+1) - timestamp(j-1));
    %    end
    %end
   %D = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1500);
    
    %px_f = filter(D,px);
    %py_f = filter(D,py);
    %pz_f = filter(D,pz);
    
    %x_f = filter(D,x);
    %y_f = filter(D,y);
    %z_f = filter(D,z);
    
    %roll = rad2deg(atan2(x, -z));
    %pitch = rad2deg(atan2((-y), sqrt(power(x, 2) + power(-z, 2))));
    
    %roll_filtered = filter(D,roll);
    %pitch_filtered = filter(D, pitch);
    
    %timestamp = timestamp/1000;
    %dealing with filter delay
    %delay = round(mean(grpdelay(D)));

   % roll_filt_fix = roll_filtered(1+delay:end);
    %roll = roll(1:end-delay);

   % pitch_filt_fix = pitch_filtered(1+delay:end);
    %pitch = pitch(1:end-delay);
    
    %px_filt_fix = px_f(1+delay:end);
    %py_filt_fix = py_f(1+delay:end);
    %pz_filt_fix = pz_f(1+delay:end);
    
    

    %timestamp_filt_fix = timestamp(1:end-delay);
  
   % figure(1)
   % for i=1:12
   %     subplot(4,3,i)
   %     plot(timestamp,mede_pos(:,i));
   %     title(['Motor ' num2str(i)])
        %plot(timestamp(length(timestamp)-1),vel(:,2));
   %     xlabel('Tempo (s)');
   %     ylabel('Posição (rad)');
   % end
   
    
   % figure(2)
   % subplot(3,2,1)
   % plot(timestamp_filt_fix,px_filt_fix);
   % title('Posição em x vs Tempo');
   % xlabel('Tempo (s)');
   % ylabel('Posição (m)');
    
   % subplot(3,2,2)
   % plot(timestamp_filt_fix,roll_filt_fix);
    %hold on
    %plot(timestamp, roll);
   % title('Ângulo de rolagem x vs Tempo');
   % xlabel('Tempo (s)');
   % ylabel('Ângulo (graus)');
    
   % subplot(3,2,3)
   % plot(timestamp_filt_fix,py_filt_fix);
   % title('Posição em y vs Tempo');
   % xlabel('Tempo (s)');
   % ylabel('Posição (m)');
    
   % subplot(3,2,4)
   % plot(timestamp_filt_fix,pitch_filt_fix);
   % title('Ângulo de arfagem vs Tempo');
   % xlabel('Tempo (s)');
   % ylabel('Ângulo (graus)'); 
    
   % subplot(3,2,5)
   % plot(timestamp_filt_fix,pz_filt_fix);
   % title('Posição em z vs Tempo');
   % xlabel('Tempo (s)');
   % ylabel('Posição (m)');
   % 
    
   
    
    
    %dlmwrite('vel.txt',vel, 'delimiter', ' ','newline', 'pc');
    %mede_pos
    
    %fitness functions
    %
    %py_f
    tempo_normal = Timevrep/1000;
    score(1) = abs(tempo_normal/(py(length(py)) - py(2))); %minimizando o inverso da velocidade;
    score(2) = (max(pz(pz~=0)) - min(pz(pz~=0)));
    %tentando minimzar binariamente. 2nd run svai tentar minimizar a diferença em si
    score(3) = abs((max(px(px~=0)) - min(px(px~=0))));
    %score = angle_matrix.*[A;A;A;A].*[I;I;I;I];
    %marcha = (score*180/pi)*1023/300;
    %marcha = marcha - rem(marcha,1);
    %dlmwrite('marcha_comp.txt',marcha, 'delimiter', ' ','newline', 'pc');
    %[A;A;A;A]
    %pz
    
end