function score = online_training(parametros)
    
    angle_back = parametros(1); %angulo da passada para tr�s-> algoritmo genetico pode aprender isso
    angle_front = parametros(2);%angulo da passada para frente -> ''   ''  ''  ''  ''
    x_p = parametros(3); %posi��o x da ponta da pata na pose de transi��o tr�s -> frente 
    y_p = parametros(4); %posi��o y da ponta da pata na pose de transi��o tr�s -> frente
    z_p = parametros(5); %posi��o z da ponta da pata na pose de transi��o tr�s -> frente
    
    
    parameters = [angle_back angle_front x_p y_p z_p]
    dlmwrite('parameters.txt',parameters, 'delimiter', ' ','newline', 'pc');
    
    
    dist = 'Dist�ncia medida: ';
    temp = 'Tempo: ';
    
    distancia = input(dist);
    tf = isfloat(distancia);
    TF = isempty(distancia);
    while (tf == 0) || (TF == 1)
        %score = inf;
        %print('Distancia espera um valor do tipo float.');
        distancia = input(dist);
        tf = isfloat(distancia);
        TF = isempty(distancia);
    end
    tempo = input(temp);
    tf = isfloat(tempo);
    TF = isempty(tempo);
    while (tf == 0) || (TF == 1)
        %score = inf;
        %print('Distancia espera um valor do tipo float.');
        tempo = input(temp);
        tf = isfloat(tempo);
        TF = isempty(tempo);
    end
    score(1) = tempo/distancia;
    
    message2 = 'Queda em z: '; %nota de 0 a 10  
    queda_z = input(message2);
    tf = isfloat(queda_z);
    TF = isempty(queda_z);
    while (tf == 0) || (TF == 1)
        %score = inf;
        %print('Distancia espera um valor do tipo float.');
        queda_z = input(message2);
        tf = isfloat(queda_z);
        TF = isempty(queda_z);        
    end
    score(2) = queda_z;
    message3 = 'Dist�ncia em x: ';
    dist_x = input(message3);
    
    tf = isfloat(dist_x);
    TF = isempty(dist_x);
    while (tf == 0) || (TF == 1)
        %score = inf;
        %print('Distancia espera um valor do tipo float.');
        dist_x = input(message3);
        tf = isfloat(dist_x);
        TF = isempty(dist_x);
    end
    
    score(3) = dist_x;
    %score(4) = 1/distancia;
    
end