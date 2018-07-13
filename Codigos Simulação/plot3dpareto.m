function pareto = plot3dpareto(fval)


scatter3(fval(:,1), fval(:,2), fval(:,3), 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [1 0 0]);
title({'Frente Pareto-Ótimo 3D';'Espaço sem restrição'});
xlabel = ('Velocidade');
ylabel = ('Diferença em z');
zlabel = ('Diferença em x');

end

