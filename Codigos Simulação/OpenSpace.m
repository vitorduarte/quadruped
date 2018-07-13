 %esse código espera servir de fitness function para a toolbox gamultobjec
%ou ga
%(Apps ->Optmization -> Solver: gamultobject). Espera-se que o robô
%simulado possa retornar os valores do acelerometro no eixo y do V-REP
%(velocidade para frente, que deve ser a maior possível, até algum valor determinado), no eixo x (velocidade lateral
% que deve ser próxima de zero) e do acelerometro em Z (que também deve ser
% próxima de zero).


function marcha_rad = marchando_vrep(joint_angles)
    
    cont_timer = 0;
    t =0;
    l=1;
    p=1;vrep
    k=1;
    time_count = 0;
    joint_angles = reshape(joint_angles,8,12);
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
        
        for i = 1:12
            [~,present_pos(i)]=vrep.simxGetJointPosition(clientID,junta(i),vrep.simx_opmode_streaming);
        end
        
        vrep.simxSynchronous(clientID,true);
        vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
        a = tic;
        for i = 1:8
            for j=1:12
                [~]=vrep.simxSetJointTargetPosition(clientID,junta(j),joint_angles(i,j),vrep.simx_opmode_streaming);
            end
            tic;
            while (max(abs(present_pos-joint_angles(i,j)))>0.01) && (t < 4)
                vrep.simxSynchronousTrigger(clientID);%trigger para executar a etapa do programa -> movimento das 12 
                for j=1:12
                    [~,present_pos(j)]=vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                    [~,mede_pos(l,j)] = vrep.simxGetJointPosition(clientID, junta(j), vrep.simx_opmode_buffer);
                    cont_timer = cont_timer + toc(a);
                    timestamp(l) = cont_timer;
                    %diff = abs(present_pos-joints_angles_normal(i));
                    %linha para checar a diferença da posição atual com
                    %a desejada
                end
                [~,xAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerX',vrep.simx_opmode_buffer);
                x(k)=xAccel;
                [~,yAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerY',vrep.simx_opmode_buffer);
                y(k)=yAccel;
                [~,zAccel]=vrep.simxGetFloatSignal(clientID,'accelerometerZ',vrep.simx_opmode_buffer);
                z(k)=zAccel;
            
                [~,ypos]=vrep.simxGetFloatSignal(clientID,'gpsY',vrep.simx_opmode_buffer);
                py(k) = ypos;
                [~,xpos]=vrep.simxGetFloatSignal(clientID,'gpsX',vrep.simx_opmode_buffer);
                px(k) = xpos;
                [~,zpos]=vrep.simxGetFloatSignal(clientID,'gpsZ',vrep.simx_opmode_buffer);
                pz(k) = zpos;
                k = k+1;
                l = l+1;
                t = toc;
                time_count=time_count + toc;
            end
            t = 0;
            
        end
        vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
        vrep.simxFinish(clientID);
        disp('Disconnected');
    end
    vrep.delete();
    disp('Finished');
    %length(px)
    %timestamp = timestamp/1000;
    %figure(1)
    %for i=1:12
    %    subplot(4,3,i)
    %    plot(timestamp,mede_pos(:,i));
    %    title(['Motor ' num2str(i)])
        %plot(timestamp(length(timestamp)-1),vel(:,2));
    %    xlabel('Tempo (s)');
    %    ylabel('Posição (rad)');
    %end
    
    D = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1500);
    
    px_f = filter(D,px);
    py_f = filter(D,py);
    pz_f = filter(D,pz);
    
    x_f = filter(D,x);
    y_f = filter(D,y);
    z_f = filter(D,z);
    
    delay = round(mean(grpdelay(D)));

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
    
    

    
    %subplot(3,2,6)
    %plot(timestamp,z_f);
    %title('Aceleração em z vs Tempo');
    %xlabel('Tempo (s)');
    %ylabel('Aceleração (m/s^2)');    
    %fitness functions
    %marcha_rad(1) = abs(timestamp_filt_fix(length(timestamp_filt_fix))/(py_filt_fix(length(py_filt_fix)) - py_filt_fix(2))); %minimizando o inverso da velocidade;
    %marcha_rad(2) = (max(pz_filt_fix(pz_filt_fix~=0)) - min(pz_filt_fix(pz_filt_fix~=0)));
    %tentando minimzar binariamente. 2nd run vai tentar minimizar a diferença em si
    %marcha_rad(3) = abs((max(px_filt_fix(px_filt_fix~=0)) - min(px_filt_fix(px_filt_fix~=0))));
end