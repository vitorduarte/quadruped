function createfigure(X1, Y1, Vertices1, Faces1, CData1, Vertices2, CData2, Vertices3, CData3, Vertices4, CData4, data1, yvector1, X2, Y2, xvector1, yvector2, data2, Y3)
%CREATEFIGURE(X1, Y1, VERTICES1, FACES1, CDATA1, VERTICES2, CDATA2, VERTICES3, CDATA3, VERTICES4, CDATA4, DATA1, YVECTOR1, X2, Y2, XVECTOR1, YVECTOR2, DATA2, Y3)
%  X1:  vector of x data
%  Y1:  vector of y data
%  VERTICES1:  patch vertices
%  FACES1:  patch faces
%  CDATA1:  patch cdata
%  VERTICES2:  patch vertices
%  CDATA2:  patch cdata
%  VERTICES3:  patch vertices
%  CDATA3:  patch cdata
%  VERTICES4:  patch vertices
%  CDATA4:  patch cdata
%  DATA1:  histogram data
%  YVECTOR1:  bar yvector
%  X2:  vector of x data
%  Y2:  vector of y data
%  XVECTOR1:  bar xvector
%  YVECTOR2:  bar yvector
%  DATA2:  histogram data
%  Y3:  vector of y data

%  Auto-generated by MATLAB on 27-May-2018 18:03:37

% Create figure
figure1 = figure('NumberTitle','off','Name','Genetic Algorithm');

% Create subplot
subplot1 = subplot(3,3,1,'Parent',figure1,'Tag','gaplotdistance');
hold(subplot1,'on');

% Create plot
plot(X1,Y1,'Parent',subplot1,'Tag','gaplotdistance','Marker','.',...
    'LineStyle','none');

% Create xlabel
xlabel('Generation','Interpreter','none');

% Create title
title('Average Distance Between Individuals','Interpreter','none');

% Create ylabel
ylabel('Avergae Distance');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot1,[1 1000]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot1,[0 1]);
% Create subplot
subplot2 = subplot(3,3,2,'Parent',figure1,'Tag','gaplotgenealogy');

% Create xlabel
xlabel('Genealogy will be displayed at the end of the run',...
    'Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot2,[0 1]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot2,[0 1]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot2,[0 1]);
% Create subplot
subplot3 = subplot(3,3,3,'Parent',figure1,'Tag','gaplotscorediversity');

% Create patch
patch('Parent',subplot3,'DisplayName','fun1 [0.0949045  0.205417]',...
    'Vertices',Vertices1,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData1);

% Create patch
patch('Parent',subplot3,'DisplayName','fun2 [1  2.5]','Vertices',Vertices2,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData2);

% Create patch
patch('Parent',subplot3,'DisplayName','fun3 [0  8]','Vertices',Vertices3,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData3);

% Create patch
patch('Parent',subplot3,'DisplayName','fun4 [0.0123457  0.0210526]',...
    'Vertices',Vertices4,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData4);

% Create xlabel
xlabel('Score (range)');

% Create title
title('Score Histogram','Interpreter','none');

% Create ylabel
ylabel('Number of individuals');

box(subplot3,'on');
% Create legend
legend(subplot3,'show');

% Create subplot
subplot4 = subplot(3,3,4,'Parent',figure1,'Tag','gaplotselection');
hold(subplot4,'on');

% Create histogram
histogram(data1,'Parent',subplot4,'BinMethod','integers');

% Create xlabel
xlabel('Individual','Interpreter','none');

% Create title
title('Selection Function','Interpreter','none');

% Create ylabel
ylabel('Number of children','Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot4,[0 16]);
% Set the remaining axes properties
set(subplot4,'XTick',[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]);
% Create subplot
subplot5 = subplot(3,3,5,'Parent',figure1,'Tag','gaplotstopping');
hold(subplot5,'on');

% Create bar
bar(yvector1,'Tag','gaplotstopping','Parent',subplot5);

% Create xlabel
xlabel('% of criteria met','Interpreter','none');

% Create title
title('Stopping Criteria','Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot5,[0 100]);
% Set the remaining axes properties
set(subplot5,'CLim',[1 2],'YTick',[1 2],'YTickLabel',{'Generation','Time'});
% Create subplot
subplot6 = subplot(3,3,6,'Parent',figure1,'Tag','gaplotpareto');
hold(subplot6,'on');

% Create plot
plot(X2,Y2,'Parent',subplot6,'Tag','gaplotPareto1','Marker','pentagram',...
    'LineStyle','none',...
    'Color',[1 0 1]);

% Create xlabel
xlabel('Objective 1','Interpreter','none');

% Create title
title('Pareto front','Interpreter','none');

% Create ylabel
ylabel('Objective 2','Interpreter','none');

grid(subplot6,'on');
% Create subplot
subplot7 = subplot(3,3,7,'Parent',figure1,'Tag','gaplotparetodistance');
hold(subplot7,'on');

% Create bar
bar(xvector1,yvector2,'Tag','gaplotparetodistance1','Parent',subplot7,...
    'FaceColor',[1 0 1],...
    'EdgeColor','none');

% Create xlabel
xlabel('Individuals');

% Create title
title('Distance of individuals','Interpreter','none');

% Create ylabel
ylabel('Distance');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot7,[0 16]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot7,[0 1]);
% Set the remaining axes properties
set(subplot7,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);
% Create subplot
subplot8 = subplot(3,3,8,'Parent',figure1,'Tag','gaplotrankhist');
hold(subplot8,'on');

% Create histogram
histogram(data2,'Parent',subplot8,'BinMethod','integers');

% Create xlabel
xlabel('Rank','Interpreter','none');

% Create title
title('Rank histogram','Interpreter','none');

% Create ylabel
ylabel('Number of individuals','Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot8,[0 6]);
% Set the remaining axes properties
set(subplot8,'XTick',[0 1 2 3 4 5 6]);
% Create subplot
subplot9 = subplot(3,3,9,'Parent',figure1,'Tag','gaplotspread');
hold(subplot9,'on');

% Create plot
plot(X1,Y3,'Parent',subplot9,'Tag','gaplotavgdistance','Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);

% Create xlabel
xlabel('Generation','Interpreter','none');

% Create title
title('Average Spread: 0','Interpreter','none');

% Create ylabel
ylabel('Average Spread','Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot9,[0 1000]);
