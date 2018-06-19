function data = get_sensor_data(main_folder, gait_folder)
    % Open 
    %dir = 'medidas/';
    dir = strcat(main_folder, '/');
    path = strcat(dir, gait_folder);

    x_id = fopen(strcat(path, '/acceleration_x.txt'), 'r');
    y_id = fopen(strcat(path, '/acceleration_y.txt'), 'r');
    z_id = fopen(strcat(path, '/acceleration_z.txt'), 'r');
    t_id = fopen(strcat(path, '/timestamps.txt'), 'r');
    s1_id = fopen(strcat(path, '/s1.txt'), 'r');
    s2_id = fopen(strcat(path, '/s2.txt'), 'r');
    s3_id = fopen(strcat(path, '/s3.txt'), 'r');
    s4_id = fopen(strcat(path, '/s4.txt'), 'r');
    
    xaccel = fscanf(x_id, '%f');
    yaccel = fscanf(y_id, '%f');
    zaccel = fscanf(z_id, '%f');
    timestamp = fscanf(t_id, '%f');
    s1 = fscanf(s1_id, '%f');
    s2 = fscanf(s2_id, '%f');
    s3 = fscanf(s3_id, '%f');
    s4 = fscanf(s4_id, '%f');
    
    data = [timestamp xaccel yaccel zaccel s1 s2 s3 s4];
end