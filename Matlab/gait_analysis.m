function gait_analysis(folder_num)    
    % Get folder info
    main_folder = 'Log marchas_07-06';
    gait_folder_list = ["medidas_marcha_fim_treinamento_falho", "medidas_marcha_inicio_treinamento_falho", ...
                        "medidas_marcha_inicio_treinamento_real", "medidas_marcha_meio_treinamento_falho", ...
                        "medidas_marcha_otima1_treinamento_real", "medidas_marcha_otima2_treinamento_real"];
    gait_folder_title = ["Marcha ao final do treinamento incompleto", "Marcha no inicio do treinamento incompleto", ...
                         "Marcha no inicio do treinamento completo", "Marcha no meio do treinamento falho", ...
                         "Marcha otimizada 1", "Marcha otimizada 2"];
    
    gait_folder = gait_folder_list(folder_num)
    gait_title = gait_folder_title(folder_num)
    
    % Get data
    sensor_data = get_sensor_data(main_folder, gait_folder);
    motor_data = get_motor_data(main_folder, gait_folder);

    timestamp = sensor_data(:,1);
    x_acc = sensor_data(:,2);
    y_acc = sensor_data(:,3);
    z_acc = sensor_data(:,4);

    % Get roll and pitch
    roll = rad2deg(atan2(y_acc, z_acc));
    pitch = rad2deg(atan2((-x_acc), sqrt(power(y_acc, 2) + power(z_acc, 2))));

    % Filter roll and pitch
    lp_filter = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 500);
    roll_filtered = filter(lp_filter,roll);
    pitch_filtered = filter(lp_filter, pitch);

    % Fix time delay of roll and pitch
    delay = round(mean(grpdelay(lp_filter)));

    roll_filt_fix = roll_filtered(1+delay:end);
    roll = roll(1:end-delay);

    pitch_filt_fix = pitch_filtered(1+delay:end);
    pitch = pitch(1:end-delay);

    timestamp_filt_fix = timestamp(1:end-delay);

    % Plot roll and pitch
    figure(1)
    subplot(2,1,1);
    plot(timestamp_filt_fix, roll_filt_fix);
    grid on;
    %hold on
    %plot(timestamp_filt_fix, roll);
    title({'Gráfico do valor estimado do ângulo de rolagem'});
    xlabel('Tempo (s)');
    ylabel('Ângulo (graus)');
    subplot(2,1,2);
    plot(timestamp_filt_fix, pitch_filt_fix);
    grid on;
    %hold on
    %plot(timestamp_filt_fix, pitch);
    title({'Gráfico do valor estimado do ângulo de arfagem'});
    xlabel('Tempo (s)');
    ylabel('Ângulo (graus)');

    % Plot motor position
    figure(2)
    for i=1:12
        subplot(4,3,i);
        plot(timestamp, motor_data(:,i));
        title(['Motor' num2str(i)]);
        xlabel('Tempo(s)');
        ylabel('Posição(pwm)'); 
    end
    
