function angles = cria_pos(poi) %poi = point of interest

%código para gerar poses a partir da cinématica inversa do modelo da pata

%pontos de interesse em relação ao frame da junta do ombro de cada pata.
%Prestar atenção aos maiores valores possíveis que podem ser atingidos de
%acordo com a modelagem que são: (0,T,0),(T,0,0),´(-T, 0 ,0) (Tcos(45), Tsen(45), 0),
%(-Tcos(45), Tsen(45), 0).Maior valor de Z possível max_Z =|L2+L3|.
%L2 e L3 são os tamanhos dos links (coxa e tíbia) entre as juntas,
%incluindo o tamanho das juntas. T é o tamanho da perna do robô.

%tamanho dos links já contando o diametro dos motores
L2 = 11.300; %centimetros 
L3 = 10.844; %centimetros


% end points; tool points; ponta do pé do robô
x_c = poi(1);
y_c = poi(2);
z_c = poi(3);

theta_1 = atan2(y_c,x_c); %angulo da primeira junta
a = (L2)*cos(theta_1) %valor da projeção de L2 no eixo xz dado angulo theta1
b = (L3)*cos(theta_1)%valor da projeção de L3 no eixo xz dado angulo theta1

%lei dos cossenos para encontrar theta_3
k = (-x_c^2 - z_c^2 + a^2 + b^2)/(2*a*b) ;

theta_3 = pi - acos(k);


%encontra theta_2 a partir de trigonometria

p = b*sin(theta_3)/(a + b*cos(theta_3));
theta_2 = atan2(z_c,x_c) - atan(p); %theta_2 angulo de L1 com L2


%passando para graus
theta_3_grad = theta_3*180/pi;
theta_2_grad = theta_2*180/pi;
theta_1_grad = theta_1*180/pi;

angles(1) = theta_1;
angles(2) = theta_2;
angles(3) = theta_3;
end