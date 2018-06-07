pos_id = fopen('positions.txt', 'r');
t_id = fopen('timestamps.txt', 'r');

position = fscanf(pos_id, '%d');
timestamp = fscanf(t_id, '%f');
position = reshape(position,12, [])';

for i=1:12
    subplot(4,3,i);
    plot(timestamp, position(:,i));
    title(['Motor' num2str(i)])
    xlabel('Tempo(s)');
    ylabel('Posição(pwm)');
end