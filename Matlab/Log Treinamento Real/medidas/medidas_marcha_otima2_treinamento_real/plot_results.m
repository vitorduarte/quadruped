clear all

%File's IDs
%acelerometer:
accelx_id = fopen('acceleration_x.txt', 'r');
accely_id = fopen('acceleration_y.txt', 'r');
accelz_id = fopen('acceleration_z.txt', 'r');
%force sensors:
s1_id = fopen('s1.txt', 'r');
s2_id = fopen('s2.txt', 'r');
s3_id = fopen('s3.txt', 'r');
s4_id = fopen('s4.txt', 'r');
%timestamp:
time_id = fopen('timestamps.txt','r');

%low-pass filter
D = designfilt('lowpassfir', 'PassbandFrequency', 100, 'StopbandFrequency', 200, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1000);

%Reading files
%acelerometers:
accelx = fscanf(accelx_id,'%f');
accely = fscanf(accely_id,'%f');
accelz = fscanf(accelz_id,'%f');
%force sensors:
s1 = fscanf(s1_id,'%f');
s2 = fscanf(s2_id,'%f');
s3 = fscanf(s3_id,'%f');
s4 = fscanf(s4_id,'%f');
%timestamps:
time = fscanf(time_id, '%f');

%filtering
accelx_filtered = filter(D,accelx);
accely_filtered = filter(D,accely);
accelz_filtered = filter(D,accelz);

%plot
%acelerometer:
subplot(2,1,1);
plot(time,accelx_filtered);
hold on
plot(time,accely_filtered);
hold on
plot(time, accelz_filtered);
legend('accelx','accely', 'accelz');
title({'Gráfico da variação do acelerômetro no tempo', 'Marcha ótima 2'});
xlabel('Tempo (s)');
ylabel('Acelerômetro (m/s^2)');
%force sensors:
subplot(2,1,2);
plot(time,s1);
hold on
plot(time,s2);
hold on
plot(time, s3);
hold on
plot(time,s4);
legend('s1','s2', 's3', 's4');
title({'Gráfico da variação dos sensores de força no tempo ', 'Marcha ótima 2'});
xlabel('Tempo (s)');
ylabel('Força no sensores (N)');


%close files
fclose(accelx_id);
fclose(accely_id);
fclose(accelz_id);
fclose(s1_id);
fclose(s2_id);
fclose(s3_id);
fclose(s4_id);
fclose(time_id);