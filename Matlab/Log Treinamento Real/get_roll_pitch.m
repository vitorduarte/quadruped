clear all 

data = get_data('medidas_marcha_otima2_treinamento_real');

timestamp = data(:,1)
x_acc = data(:,2)
y_acc = data(:,3)
z_acc = data(:,4)

roll = rad2deg(atan2(y_acc, z_acc))
pitch = rad2deg(atan2((-x_acc), sqrt(power(y_acc, 2) + power(z_acc, 2))))

lp_filter = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 180, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1000);
%grpdelay(lp_filter, 242, 1000)
%fvtool(lp_filter)
delay = mean(grpdelay(lp_filter));

roll_filtered = filter(lp_filter,roll)%e the power spectral density, a measurement of the energy at various frequencies, using the complex conjugate (CONJ). Form a frequency axis for the first 127 points and use it to plot the result. (The remainder of the points are symmetric.);% - 9.874
pitch_filtered = filter(lp_filter, pitch);

roll_filt_fix = roll_filtered(1+delay:end);
roll = roll(1:end-delay);
%roll_filt_fix(end+1:end+delay) = zeros(1,delay);
pitch_filt_fix = pitch_filtered(1+delay:end);
pitch = pitch(1:end-delay);
%pitch_filt_fix(end+1:end+delay) = zeros(1,delay);
timestamp = timestamp(1:end-delay);
%timestamp = timestamp(1:end-delay);
%roll(1:delay) = [0 0 0 0 0 0 0 0 0 0 0];

subplot(2,1,1);
plot(timestamp, roll_filt_fix);
grid on;
%hold on
%plot(timestamp, roll);
title({'Gráfico do valor estimado do ângulo de rolagem'});
xlabel('Tempo (s)');
ylabel('Ângulo (graus)');


subplot(2,1,2);
plot(timestamp, pitch_filt_fix);
grid on;
%hold on
%plot(timestamp, pitch);
title({'Gráfico do valor estimado do ângulo de arfagem'});
xlabel('Tempo (s)');
ylabel('Ângulo (graus)');
suptitle('Marcha otimizada 2');

