clear all
close all
load('results.mat');

ver_sem_filtro = 0;

size = (tempo_size - 1);
eval(['tsim' '=' 'tempo_0_' num2str(size) '(' num2str(size) ')' ';']);
eval(['tempo' '=' 'tempo_0_' num2str(size) ';']);

if (ver_sem_filtro == 1)
size = (pitch_angle_sf_size-1);
eval(['pitch_angle_sf' '=' 'pitch_angle_sf_0_' num2str(size) ';']);
eval(['roll_angle_sf' '=' 'roll_angle_sf_0_' num2str(size) ';']);
if (tempo_size ~= pitch_angle_sf_size)
    t = (0:length(pitch_angle_sf)-1)*tsim/(length(pitch_angle_sf)-1);
else
    t = tempo;
end
plot(t,pitch_angle_sf);
hold on
plot(t,roll_angle_sf);
title('Angulos sem Filtro x Tempo');
xlabel('Tempo (s)');
ylabel('Angulo (grau)');
legend('Arfagem','Rolagem')
figure
else
end

size = (pitch_angle_size-1);
eval(['pitch_angle' '=' 'pitch_angle_0_' num2str(size) ';']);
eval(['roll_angle' '=' 'roll_angle_0_' num2str(size) ';']);

if (tempo_size ~= pitch_angle_size)
    t = (0:length(pitch_angle)-1)*tsim/(length(pitch_angle)-1);
else
    t = tempo;
end

for i=1:12
if i == 1 || i == 4 || i == 7 || i == 10
eval(['size' '=' 'p_motor' num2str(i) '_size -1;']);
eval(['p_motor' '=' 'p_motor' num2str(i) '_0_' num2str(size) ';']);

if (tempo_size ~= p_motor1_size)
    t = (0:length(p_motor)-1)*tsim/(length(p_motor)-1);
else
    t = tempo;
end

a=plot(t,p_motor);
set(a,'Color','yellow');
hold on
end
end

if (tempo_size ~= roll_angle_size)
    t = (0:length(roll_angle)-1)*tsim/(length(roll_angle)-1);
else
    t = tempo;
end


b=plot(t,-roll_angle);
set(b,'Color','red');
title('Posicao dos Motores Roll x Tempo');
xlabel('Tempo (s)');
ylabel('Angulo (grau)');

figure

for i=1:12
if i == 2 || i == 3 || i == 5 || i == 6 || i == 8 || i == 9 || i == 11 || i == 12
size = (p_motor1_size-1);
eval(['size' '=' 'num2str(p_motor' num2str(i) '_size -1);']);
eval(['p_motor' '=' 'p_motor' num2str(i) '_0_' num2str(size) ';']);

if (tempo_size ~= p_motor2_size)
    t = (0:length(p_motor)-1)*tsim/(length(p_motor)-1);
else
    t = tempo;
end

a=plot(t,p_motor);
set(a,'Color','yellow');
hold on
end
end

if (tempo_size ~= pitch_angle_size)
    t = (0:length(pitch_angle)-1)*tsim/(length(pitch_angle)-1);
else
    t = tempo;
end

b=plot(t,-pitch_angle);
set(b,'Color','red');
title('Posicao dos Motores Pitch x Tempo');
xlabel('Tempo (s)');
ylabel('Angulo (graus)');

size = num2str(T_size-1);
eval(['T' '=' 'T_0_' num2str(size) ';']);
media_tempo = mean(T)