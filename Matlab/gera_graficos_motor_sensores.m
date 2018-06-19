    timestamp = timestamp/1000;
    figure(1)
    for i=1:12
        subplot(4,3,i)
        plot(timestamp,mede_pos(:,i));
        title(['Motor ' num2str(i)])
        %plot(timestamp(length(timestamp)-1),vel(:,2));
        xlabel('Tempo (s)');
        ylabel('Posi��o (rad)');
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
    title('Posi��o em x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posi��o (m)');
    
    subplot(3,2,2)
    plot(timestamp,x_f);
    title('Acelera��o em x vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Acelera��o (m/s^2)');
    
    subplot(3,2,3)
    plot(timestamp,py_f);
    title('Posi��o em y vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posi��o (m)');
    
    subplot(3,2,4)
    plot(timestamp,y_f);
    title('Acelera��o em y vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Acelera��o (m/s^2)'); 
    
    subplot(3,2,5)
    plot(timestamp,pz_f);
    title('Posi��o em z vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Posi��o (m)');
    
    
    subplot(3,2,6)
    plot(timestamp,z_f);
    title('Acelera��o em z vs Tempo');
    xlabel('Tempo (s)');
    ylabel('Acelera��o (m/s^2)');  