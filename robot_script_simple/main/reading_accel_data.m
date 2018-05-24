clear all

%media robo parado

%mean_z = 10.2199
%mean_x = =0.0555
%mean_y = -0.5626

x_id = fopen('measurements/acceleration_x.txt', 'r');
y_id = fopen('measurements/acceleration_y.txt', 'r');
z_id = fopen('measurements/acceleration_z.txt', 'r');
t_id = fopen('measurements/timestamps.txt', 'r');

xaccel = fscanf(x_id, '%f');
yaccel = fscanf(y_id, '%f');
zaccel = fscanf(z_id, '%f');
timestamp = fscanf(t_id, '%f');
vel(1) = 0;
pos(1) =0;
cont = 0;
D = designfilt('lowpassfir', 'PassbandFrequency', 75, 'StopbandFrequency', 200, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', 1000);
Y = filter(D,zaccel)% - 9.874
mean_z = mean(zaccel);
mean_x = mean(xaccel);
mean_y = mean(yaccel);
%zaccel = zaccel%- 9.874;

for i=2:(length(zaccel)-1)
    valor_atual = zaccel(i);
    valor_prox = zaccel(i+1);
    periodo = timestamp(i+1) - timestamp(i);
    
    vel(i) =  vel(i-1) + (valor_prox+valor_atual)*periodo/2;

end
for i=2:(length(vel)-1)
    valor_atual = vel(i);
    valor_prox = vel(i+1);
    periodo = timestamp(i+1) - timestamp(i);
    
    pos(i) = pos(i-1) + (valor_prox+valor_atual)*periodo/2;

end
pos = 100*pos;


%plot(timestamp(1:length(timestamp)-1),vel)
%hold on
%plot(timestamp(1:length(timestamp)-2),pos)
%hold on
plot(timestamp(1:length(timestamp)), Y);
hold on
plot (timestamp, zaccel);
%hold on
%plot(timestamp,zaccel);
%hold on
%plot(Y(24:length(Y)));