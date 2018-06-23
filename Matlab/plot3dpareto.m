function pareto = plot3dpareto(fval)


scatter3(fval(:,1), fval(:,2), fval(:,3), 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [1 0 0]);
title({'Frente Pareto-�timo 3D';'Espa�o sem restri��o'});
xlabel = ('Velocidade');
ylabel = ('Diferen�a em z');
zlabel = ('Diferen�a em x');

end

