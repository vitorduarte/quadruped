~ Esse arquivo tem como objetivo descrever os conte�dos desse reposit�rio ~

#cria_pose_unica.m: 
	� o c�digo no matlab que funciona como fitness function para o app de otimiza��o do matlab (gamultobj). Ele recebe
	do aplicativo 5 vari�veis que s�o par�metros das poses criadas e retorna as fun��es de score (que podem ser modificadas
	de acordo com seu objetivo). Descri��es mais detalhadas est�o descritas no c�digo.

#cria_pose.m: 
	C�digo no matlab que funciona como fitness function para o app de otimiza��o do matlab (gamultobj). Ele recebe uma
	matriz 4x4, em que cada elemento � uma pose. As linhas representam uma pata e as colunas, os estados de cada pata 
	em um determinado instante de tempo. C�digo est� incompleto. A ideia � verificar se o algoritmo gen�tico aprende
	uma configura��o �tima de poses para o rob�, diferente da solu��o que se espera, que � implementada no c�digo
	anterior.

#inverse_kinematics.m:
	C�digo no matlab que implementa cinem�tica inversa de uma pata do rob�. Recebe como entrada o tool point, que � 
	a posi��o que se deseja colocar a ponta da pata do rob� e retorna os angulos de junta1 ("ombro" alto), junta2("ombro" 
	baixo) e junta3 (joelho).

#marchando_vrep.m: 
	C�digo no matlab que funciona como fitness function para o app de otimiza��o do matlab (gamultobj). Ele recebe uma
	matriz 480x12, em que as colunas s�o angulos em radianos para cada uma das 12 juntas e cada linha � o estado da
	disposi��o das patas do robo. C�digo incompleto. A ideia era verificar se o algoritmo gen�tico aprendia uma marcha
	apenas a partir de �ngulos em cada junta e de suas fitness junction.

#move_uma_junta.m:
	C�digo no matlab que serve para testar o funcionamento das juntas no vrep. Para ele funcionar deve-se iniciar o vrep
	primeiro e depois executar o c�digo no matlab.

#remAPi.m;remoteApi.dll: remoteApiProto.m
	Arquivos necess�rio para realizar a comunica��o do matlab com o vrep.

#Marchas_Pedro_Vitor:  
	Marchas geradas a partir dos treinamentos, em radianos e em .mat;

#Resultados_treinamento:
	#resultados dos treinamentos utilizando o gamultobj. S�o workspaces do matlab. Em optimresults existe informa��es
	de score, melhores individuos das popula��es e melhores individuos. 	