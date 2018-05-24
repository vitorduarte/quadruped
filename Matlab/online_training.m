function score = online_training(parametros)
    
    angle_back = parametros(1); %angulo da passada para tr�s-> algoritmo genetico pode aprender isso
    angle_front = parametros(2);%angulo da passada para frente -> ''   ''  ''  ''  ''
    x_p = parametros(3); %posi��o x da ponta da pata na pose de transi��o tr�s -> frente 
    y_p = parametros(4); %posi��o y da ponta da pata na pose de transi��o tr�s -> frente
    z_p = parametros(5); %posi��o z da ponta da pata na pose de transi��o tr�s -> frente
    
    
    parameters = [angle_back angle_front x_p y_p z_p];
    dlmwrite('parameters.txt',parameters, 'delimiter', ' ','newline', 'pc');
    
    
    dist = 'dist�ncia medida';
    temp = 'tempo';
    
    message1 = 'inverso da velocidade: ';
    distancia = input(dist);
    tempo = input(temp);
    score(1) = tempo/distancia;
    
    message2 = 'queda em z: '; %nota de 0 a 10  
    score(2) = input(message2);
    
    message3 = 'dist�ncia em x: ';
    score(3) = input(message3)
    
    score(4) = 1/distancia;
    
end