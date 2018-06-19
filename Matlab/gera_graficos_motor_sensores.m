    timestamp = timestamp/1000;
    figure(1)
    for i=1:12
        subplot(4,3,i)
        plot(timestamp,mede_pos(:,i));
        title(['Motor ' num2str(i)])
        %plot(timestamp(length(timestamp)-1),vel(:,2));
        xlabel('Tempo (s)');
        ylabel('Posição (rad)');
    end
    
    D = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 5000);
    
    px_f = filter(D,px);
    py_f = filter(D,py);
    pz_f = filter(D,pz);
    
    x_f = filter(D,x);
    y_f = filter(D,y);
    z_f = filter(D,z);
    
    figure(2)
    subplot(3,2,1)
    plot(timestamp,px_f);
    title('Posição em x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
    
    subplot(3,2,2)
    plot(timestamp,x_f);
    title('Aceleração em x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Aceleração (m/s^2)');
    
    subplot(3,2,3)
    plot(timestamp,py_f);
    title('Posição em y vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
    
    subplot(3,2,4)
    plot(timestamp,y_f);
    title('Aceleração em y vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Aceleração (m/s^2)'); 
    
    subplot(3,2,5)
    plot(timestamp,pz_f);
    title('Posição em z vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posição (m)');
    
    
    subplot(3,2,6)
    plot(timestamp,z_f);
    title('Aceleração em z vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Aceleração (m/s^2)');  