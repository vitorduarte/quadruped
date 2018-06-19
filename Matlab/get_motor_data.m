function position = get_motor_data(main_folder, gait_folder)
    % Open 
    %dir = 'medidas/';
    dir = strcat(main_folder, '/');
    path = strcat(dir, gait_folder);
    
    pos_id = fopen(strcat(path, '/positions.txt'), 'r');
    %t_id = fopen('timestamps.txt', 'r');

    position = fscanf(pos_id, '%d');
    position = reshape(position,12, [])';
end