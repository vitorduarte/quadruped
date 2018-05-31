function createfigure(X1, Y1, X2, YMatrix1, X3, YMatrix2, X4, YMatrix3, X5, X6, YMatrix4, X7, X8, YMatrix5, Y2, X9, X10, YMatrix6, X11, X12, YMatrix7, X13, X14, YMatrix8, X15, X16, YMatrix9, X17, X18, YMatrix10, X19, X20, YMatrix11, X21, X22, YMatrix12, X23, X24, YMatrix13, Y3, X25, X26, YMatrix14, X27, X28, YMatrix15, X29, X30, YMatrix16, X31, X32, YMatrix17, Y4, X33, X34, YMatrix18, X35, X36, YMatrix19, X37, X38, YMatrix20, X39, X40, YMatrix21, X41, X42, YMatrix22, X43, X44, YMatrix23, X45, X46, YMatrix24, X47, X48, YMatrix25, X49, X50, YMatrix26, X51, X52, YMatrix27, X53, X54, YMatrix28, X55, X56, YMatrix29, X57, X58, YMatrix30, X59, X60, YMatrix31, X61, X62, YMatrix32, X63, X64, YMatrix33, X65, X66, YMatrix34, X67, X68, YMatrix35, Y5, X69, X70, YMatrix36, X71, X72, YMatrix37, X73, X74, YMatrix38, X75, X76, YMatrix39, X77, X78, YMatrix40, X79, X80, YMatrix41, X81, X82, YMatrix42, X83, X84, YMatrix43, X85, X86, YMatrix44, X87, X88, YMatrix45, X89, X90, YMatrix46, X91, X92, YMatrix47, X93, X94, YMatrix48, X95, X96, YMatrix49, X97, X98, YMatrix50, X99, X100, YMatrix51, X101, X102, YMatrix52, X103, X104, YMatrix53, X105, X106, YMatrix54, X107, X108, YMatrix55, X109, X110, YMatrix56, X111, X112, YMatrix57, X113, X114, YMatrix58, X115, X116, YMatrix59, Y6, X117, X118, YMatrix60, X119, X120, YMatrix61, X121, X122, YMatrix62, X123, X124, YMatrix63, X125, X126, YMatrix64, X127, X128, YMatrix65, X129, X130, YMatrix66, X131, X132, YMatrix67, X133, X134, YMatrix68, X135, X136, YMatrix69, X137, X138, YMatrix70, X139, X140, YMatrix71, X141, X142, YMatrix72, X143, X144, YMatrix73, X145, X146, YMatrix74, X147, X148, YMatrix75, X149, X150, YMatrix76, X151, X152, YMatrix77, X153, X154, YMatrix78, X155, X156, YMatrix79, X157, X158, YMatrix80, X159, X160, YMatrix81, X161, X162, YMatrix82, X163, X164, YMatrix83, X165, X166, YMatrix84, X167, X168, YMatrix85, X169, X170, YMatrix86, X171, X172, YMatrix87, X173, X174, YMatrix88, X175, X176, YMatrix89, X177, X178, YMatrix90, X179, X180, YMatrix91, X181, X182, YMatrix92, X183, X184, YMatrix93, X185, X186, YMatrix94, X187, X188, YMatrix95, X189, X190, YMatrix96, X191, X192, YMatrix97, X193, X194, YMatrix98, X195, X196, YMatrix99, X197, X198, YMatrix100, X199, X200, YMatrix101, X201, Vertices1, Faces1, CData1, Vertices2, CData2, Vertices3, CData3, data1, yvector1, X202, Y7, yvector2, data2, Y8)
%CREATEFIGURE(X1, Y1, X2, YMATRIX1, X3, YMATRIX2, X4, YMATRIX3, X5, X6, YMATRIX4, X7, X8, YMATRIX5, Y2, X9, X10, YMATRIX6, X11, X12, YMATRIX7, X13, X14, YMATRIX8, X15, X16, YMATRIX9, X17, X18, YMATRIX10, X19, X20, YMATRIX11, X21, X22, YMATRIX12, X23, X24, YMATRIX13, Y3, X25, X26, YMATRIX14, X27, X28, YMATRIX15, X29, X30, YMATRIX16, X31, X32, YMATRIX17, Y4, X33, X34, YMATRIX18, X35, X36, YMATRIX19, X37, X38, YMATRIX20, X39, X40, YMATRIX21, X41, X42, YMATRIX22, X43, X44, YMATRIX23, X45, X46, YMATRIX24, X47, X48, YMATRIX25, X49, X50, YMATRIX26, X51, X52, YMATRIX27, X53, X54, YMATRIX28, X55, X56, YMATRIX29, X57, X58, YMATRIX30, X59, X60, YMATRIX31, X61, X62, YMATRIX32, X63, X64, YMATRIX33, X65, X66, YMATRIX34, X67, X68, YMATRIX35, Y5, X69, X70, YMATRIX36, X71, X72, YMATRIX37, X73, X74, YMATRIX38, X75, X76, YMATRIX39, X77, X78, YMATRIX40, X79, X80, YMATRIX41, X81, X82, YMATRIX42, X83, X84, YMATRIX43, X85, X86, YMATRIX44, X87, X88, YMATRIX45, X89, X90, YMATRIX46, X91, X92, YMATRIX47, X93, X94, YMATRIX48, X95, X96, YMATRIX49, X97, X98, YMATRIX50, X99, X100, YMATRIX51, X101, X102, YMATRIX52, X103, X104, YMATRIX53, X105, X106, YMATRIX54, X107, X108, YMATRIX55, X109, X110, YMATRIX56, X111, X112, YMATRIX57, X113, X114, YMATRIX58, X115, X116, YMATRIX59, Y6, X117, X118, YMATRIX60, X119, X120, YMATRIX61, X121, X122, YMATRIX62, X123, X124, YMATRIX63, X125, X126, YMATRIX64, X127, X128, YMATRIX65, X129, X130, YMATRIX66, X131, X132, YMATRIX67, X133, X134, YMATRIX68, X135, X136, YMATRIX69, X137, X138, YMATRIX70, X139, X140, YMATRIX71, X141, X142, YMATRIX72, X143, X144, YMATRIX73, X145, X146, YMATRIX74, X147, X148, YMATRIX75, X149, X150, YMATRIX76, X151, X152, YMATRIX77, X153, X154, YMATRIX78, X155, X156, YMATRIX79, X157, X158, YMATRIX80, X159, X160, YMATRIX81, X161, X162, YMATRIX82, X163, X164, YMATRIX83, X165, X166, YMATRIX84, X167, X168, YMATRIX85, X169, X170, YMATRIX86, X171, X172, YMATRIX87, X173, X174, YMATRIX88, X175, X176, YMATRIX89, X177, X178, YMATRIX90, X179, X180, YMATRIX91, X181, X182, YMATRIX92, X183, X184, YMATRIX93, X185, X186, YMATRIX94, X187, X188, YMATRIX95, X189, X190, YMATRIX96, X191, X192, YMATRIX97, X193, X194, YMATRIX98, X195, X196, YMATRIX99, X197, X198, YMATRIX100, X199, X200, YMATRIX101, X201, VERTICES1, FACES1, CDATA1, VERTICES2, CDATA2, VERTICES3, CDATA3, DATA1, YVECTOR1, X202, Y7, YVECTOR2, DATA2, Y8)
%  X1:  vector of x data
%  Y1:  vector of y data
%  X2:  vector of x data
%  YMATRIX1:  matrix of y data
%  X3:  vector of x data
%  YMATRIX2:  matrix of y data
%  X4:  vector of x data
%  YMATRIX3:  matrix of y data
%  X5:  vector of x data
%  X6:  vector of x data
%  YMATRIX4:  matrix of y data
%  X7:  vector of x data
%  X8:  vector of x data
%  YMATRIX5:  matrix of y data
%  Y2:  vector of y data
%  X9:  vector of x data
%  X10:  vector of x data
%  YMATRIX6:  matrix of y data
%  X11:  vector of x data
%  X12:  vector of x data
%  YMATRIX7:  matrix of y data
%  X13:  vector of x data
%  X14:  vector of x data
%  YMATRIX8:  matrix of y data
%  X15:  vector of x data
%  X16:  vector of x data
%  YMATRIX9:  matrix of y data
%  X17:  vector of x data
%  X18:  vector of x data
%  YMATRIX10:  matrix of y data
%  X19:  vector of x data
%  X20:  vector of x data
%  YMATRIX11:  matrix of y data
%  X21:  vector of x data
%  X22:  vector of x data
%  YMATRIX12:  matrix of y data
%  X23:  vector of x data
%  X24:  vector of x data
%  YMATRIX13:  matrix of y data
%  Y3:  vector of y data
%  X25:  vector of x data
%  X26:  vector of x data
%  YMATRIX14:  matrix of y data
%  X27:  vector of x data
%  X28:  vector of x data
%  YMATRIX15:  matrix of y data
%  X29:  vector of x data
%  X30:  vector of x data
%  YMATRIX16:  matrix of y data
%  X31:  vector of x data
%  X32:  vector of x data
%  YMATRIX17:  matrix of y data
%  Y4:  vector of y data
%  X33:  vector of x data
%  X34:  vector of x data
%  YMATRIX18:  matrix of y data
%  X35:  vector of x data
%  X36:  vector of x data
%  YMATRIX19:  matrix of y data
%  X37:  vector of x data
%  X38:  vector of x data
%  YMATRIX20:  matrix of y data
%  X39:  vector of x data
%  X40:  vector of x data
%  YMATRIX21:  matrix of y data
%  X41:  vector of x data
%  X42:  vector of x data
%  YMATRIX22:  matrix of y data
%  X43:  vector of x data
%  X44:  vector of x data
%  YMATRIX23:  matrix of y data
%  X45:  vector of x data
%  X46:  vector of x data
%  YMATRIX24:  matrix of y data
%  X47:  vector of x data
%  X48:  vector of x data
%  YMATRIX25:  matrix of y data
%  X49:  vector of x data
%  X50:  vector of x data
%  YMATRIX26:  matrix of y data
%  X51:  vector of x data
%  X52:  vector of x data
%  YMATRIX27:  matrix of y data
%  X53:  vector of x data
%  X54:  vector of x data
%  YMATRIX28:  matrix of y data
%  X55:  vector of x data
%  X56:  vector of x data
%  YMATRIX29:  matrix of y data
%  X57:  vector of x data
%  X58:  vector of x data
%  YMATRIX30:  matrix of y data
%  X59:  vector of x data
%  X60:  vector of x data
%  YMATRIX31:  matrix of y data
%  X61:  vector of x data
%  X62:  vector of x data
%  YMATRIX32:  matrix of y data
%  X63:  vector of x data
%  X64:  vector of x data
%  YMATRIX33:  matrix of y data
%  X65:  vector of x data
%  X66:  vector of x data
%  YMATRIX34:  matrix of y data
%  X67:  vector of x data
%  X68:  vector of x data
%  YMATRIX35:  matrix of y data
%  Y5:  vector of y data
%  X69:  vector of x data
%  X70:  vector of x data
%  YMATRIX36:  matrix of y data
%  X71:  vector of x data
%  X72:  vector of x data
%  YMATRIX37:  matrix of y data
%  X73:  vector of x data
%  X74:  vector of x data
%  YMATRIX38:  matrix of y data
%  X75:  vector of x data
%  X76:  vector of x data
%  YMATRIX39:  matrix of y data
%  X77:  vector of x data
%  X78:  vector of x data
%  YMATRIX40:  matrix of y data
%  X79:  vector of x data
%  X80:  vector of x data
%  YMATRIX41:  matrix of y data
%  X81:  vector of x data
%  X82:  vector of x data
%  YMATRIX42:  matrix of y data
%  X83:  vector of x data
%  X84:  vector of x data
%  YMATRIX43:  matrix of y data
%  X85:  vector of x data
%  X86:  vector of x data
%  YMATRIX44:  matrix of y data
%  X87:  vector of x data
%  X88:  vector of x data
%  YMATRIX45:  matrix of y data
%  X89:  vector of x data
%  X90:  vector of x data
%  YMATRIX46:  matrix of y data
%  X91:  vector of x data
%  X92:  vector of x data
%  YMATRIX47:  matrix of y data
%  X93:  vector of x data
%  X94:  vector of x data
%  YMATRIX48:  matrix of y data
%  X95:  vector of x data
%  X96:  vector of x data
%  YMATRIX49:  matrix of y data
%  X97:  vector of x data
%  X98:  vector of x data
%  YMATRIX50:  matrix of y data
%  X99:  vector of x data
%  X100:  vector of x data
%  YMATRIX51:  matrix of y data
%  X101:  vector of x data
%  X102:  vector of x data
%  YMATRIX52:  matrix of y data
%  X103:  vector of x data
%  X104:  vector of x data
%  YMATRIX53:  matrix of y data
%  X105:  vector of x data
%  X106:  vector of x data
%  YMATRIX54:  matrix of y data
%  X107:  vector of x data
%  X108:  vector of x data
%  YMATRIX55:  matrix of y data
%  X109:  vector of x data
%  X110:  vector of x data
%  YMATRIX56:  matrix of y data
%  X111:  vector of x data
%  X112:  vector of x data
%  YMATRIX57:  matrix of y data
%  X113:  vector of x data
%  X114:  vector of x data
%  YMATRIX58:  matrix of y data
%  X115:  vector of x data
%  X116:  vector of x data
%  YMATRIX59:  matrix of y data
%  Y6:  vector of y data
%  X117:  vector of x data
%  X118:  vector of x data
%  YMATRIX60:  matrix of y data
%  X119:  vector of x data
%  X120:  vector of x data
%  YMATRIX61:  matrix of y data
%  X121:  vector of x data
%  X122:  vector of x data
%  YMATRIX62:  matrix of y data
%  X123:  vector of x data
%  X124:  vector of x data
%  YMATRIX63:  matrix of y data
%  X125:  vector of x data
%  X126:  vector of x data
%  YMATRIX64:  matrix of y data
%  X127:  vector of x data
%  X128:  vector of x data
%  YMATRIX65:  matrix of y data
%  X129:  vector of x data
%  X130:  vector of x data
%  YMATRIX66:  matrix of y data
%  X131:  vector of x data
%  X132:  vector of x data
%  YMATRIX67:  matrix of y data
%  X133:  vector of x data
%  X134:  vector of x data
%  YMATRIX68:  matrix of y data
%  X135:  vector of x data
%  X136:  vector of x data
%  YMATRIX69:  matrix of y data
%  X137:  vector of x data
%  X138:  vector of x data
%  YMATRIX70:  matrix of y data
%  X139:  vector of x data
%  X140:  vector of x data
%  YMATRIX71:  matrix of y data
%  X141:  vector of x data
%  X142:  vector of x data
%  YMATRIX72:  matrix of y data
%  X143:  vector of x data
%  X144:  vector of x data
%  YMATRIX73:  matrix of y data
%  X145:  vector of x data
%  X146:  vector of x data
%  YMATRIX74:  matrix of y data
%  X147:  vector of x data
%  X148:  vector of x data
%  YMATRIX75:  matrix of y data
%  X149:  vector of x data
%  X150:  vector of x data
%  YMATRIX76:  matrix of y data
%  X151:  vector of x data
%  X152:  vector of x data
%  YMATRIX77:  matrix of y data
%  X153:  vector of x data
%  X154:  vector of x data
%  YMATRIX78:  matrix of y data
%  X155:  vector of x data
%  X156:  vector of x data
%  YMATRIX79:  matrix of y data
%  X157:  vector of x data
%  X158:  vector of x data
%  YMATRIX80:  matrix of y data
%  X159:  vector of x data
%  X160:  vector of x data
%  YMATRIX81:  matrix of y data
%  X161:  vector of x data
%  X162:  vector of x data
%  YMATRIX82:  matrix of y data
%  X163:  vector of x data
%  X164:  vector of x data
%  YMATRIX83:  matrix of y data
%  X165:  vector of x data
%  X166:  vector of x data
%  YMATRIX84:  matrix of y data
%  X167:  vector of x data
%  X168:  vector of x data
%  YMATRIX85:  matrix of y data
%  X169:  vector of x data
%  X170:  vector of x data
%  YMATRIX86:  matrix of y data
%  X171:  vector of x data
%  X172:  vector of x data
%  YMATRIX87:  matrix of y data
%  X173:  vector of x data
%  X174:  vector of x data
%  YMATRIX88:  matrix of y data
%  X175:  vector of x data
%  X176:  vector of x data
%  YMATRIX89:  matrix of y data
%  X177:  vector of x data
%  X178:  vector of x data
%  YMATRIX90:  matrix of y data
%  X179:  vector of x data
%  X180:  vector of x data
%  YMATRIX91:  matrix of y data
%  X181:  vector of x data
%  X182:  vector of x data
%  YMATRIX92:  matrix of y data
%  X183:  vector of x data
%  X184:  vector of x data
%  YMATRIX93:  matrix of y data
%  X185:  vector of x data
%  X186:  vector of x data
%  YMATRIX94:  matrix of y data
%  X187:  vector of x data
%  X188:  vector of x data
%  YMATRIX95:  matrix of y data
%  X189:  vector of x data
%  X190:  vector of x data
%  YMATRIX96:  matrix of y data
%  X191:  vector of x data
%  X192:  vector of x data
%  YMATRIX97:  matrix of y data
%  X193:  vector of x data
%  X194:  vector of x data
%  YMATRIX98:  matrix of y data
%  X195:  vector of x data
%  X196:  vector of x data
%  YMATRIX99:  matrix of y data
%  X197:  vector of x data
%  X198:  vector of x data
%  YMATRIX100:  matrix of y data
%  X199:  vector of x data
%  X200:  vector of x data
%  YMATRIX101:  matrix of y data
%  X201:  vector of x data
%  VERTICES1:  patch vertices
%  FACES1:  patch faces
%  CDATA1:  patch cdata
%  VERTICES2:  patch vertices
%  CDATA2:  patch cdata
%  VERTICES3:  patch vertices
%  CDATA3:  patch cdata
%  DATA1:  histogram data
%  YVECTOR1:  bar yvector
%  X202:  vector of x data
%  Y7:  vector of y data
%  YVECTOR2:  bar yvector
%  DATA2:  histogram data
%  Y8:  vector of y data

%  Auto-generated by MATLAB on 31-May-2018 15:31:45

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
% xlim(subplot1,[78.8799810976172 95.9351899053542]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot1,[0.315621079080567 1.31305668609256]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot1,[0 1]);
% Create subplot
subplot2 = subplot(3,3,2,'Parent',figure1,'Tag','gaplotgenealogy');
hold(subplot2,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X2,YMatrix1,'Parent',subplot2,'Color',[0 0 1]);
set(plot1(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot2 = plot(X3,YMatrix2,'Parent',subplot2,'Marker','.','LineStyle','none',...
    'Color',[0 0 1]);
set(plot2(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot3 = plot(X4,YMatrix3,'Parent',subplot2,'Color',[0 0 1]);
set(plot3(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot4 = plot(X5,YMatrix2,'Parent',subplot2,'Marker','.','LineStyle','none',...
    'Color',[0 0 1]);
set(plot4(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot5 = plot(X6,YMatrix4,'Parent',subplot2,'Color',[0 0 1]);
set(plot5(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot6 = plot(X7,YMatrix2,'Parent',subplot2,'Marker','.','LineStyle','none',...
    'Color',[0 0 1]);
set(plot6(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot7 = plot(X8,YMatrix5,'Parent',subplot2,'Color',[0 0 1]);
set(plot7(8),'Color',[1 0 0]);

% Create plot
plot(X8,Y2,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot8 = plot(X9,YMatrix2,'Parent',subplot2,'Marker','.','LineStyle','none',...
    'Color',[0 0 1]);
set(plot8(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot9 = plot(X10,YMatrix6,'Parent',subplot2,'Color',[0 0 1]);
set(plot9(8),'Color',[1 0 0]);

% Create plot
plot(X10,Y2,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot10 = plot(X11,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot10(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot11 = plot(X12,YMatrix7,'Parent',subplot2,'Color',[0 0 1]);
set(plot11(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot12 = plot(X13,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot12(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot13 = plot(X14,YMatrix8,'Parent',subplot2,'Color',[0 0 1]);
set(plot13(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot14 = plot(X15,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot14(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot15 = plot(X16,YMatrix9,'Parent',subplot2,'Color',[0 0 1]);
set(plot15(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot16 = plot(X17,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot16(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot17 = plot(X18,YMatrix10,'Parent',subplot2,'Color',[0 0 1]);
set(plot17(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot18 = plot(X19,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot18(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot19 = plot(X20,YMatrix11,'Parent',subplot2,'Color',[0 0 1]);
set(plot19(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot20 = plot(X21,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot20(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot21 = plot(X22,YMatrix12,'Parent',subplot2,'Color',[0 0 1]);
set(plot21(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot22 = plot(X23,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot22(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot23 = plot(X24,YMatrix13,'Parent',subplot2,'Color',[0 0 1]);
set(plot23(8),'Color',[1 0 0]);

% Create plot
plot(X24,Y3,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot24 = plot(X25,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot24(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot25 = plot(X26,YMatrix14,'Parent',subplot2,'Color',[0 0 1]);
set(plot25(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot26 = plot(X27,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot26(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot27 = plot(X28,YMatrix15,'Parent',subplot2,'Color',[0 0 1]);
set(plot27(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot28 = plot(X29,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot28(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot29 = plot(X30,YMatrix16,'Parent',subplot2,'Color',[0 0 1]);
set(plot29(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot30 = plot(X31,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot30(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot31 = plot(X32,YMatrix17,'Parent',subplot2,'Color',[0 0 1]);
set(plot31(8),'Color',[1 0 0]);

% Create plot
plot(X32,Y4,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot32 = plot(X33,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot32(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot33 = plot(X34,YMatrix18,'Parent',subplot2,'Color',[0 0 1]);
set(plot33(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot34 = plot(X35,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot34(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot35 = plot(X36,YMatrix19,'Parent',subplot2,'Color',[0 0 1]);
set(plot35(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot36 = plot(X37,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot36(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot37 = plot(X38,YMatrix20,'Parent',subplot2,'Color',[0 0 1]);
set(plot37(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot38 = plot(X39,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot38(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot39 = plot(X40,YMatrix21,'Parent',subplot2,'Color',[0 0 1]);
set(plot39(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot40 = plot(X41,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot40(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot41 = plot(X42,YMatrix22,'Parent',subplot2,'Color',[0 0 1]);
set(plot41(8),'Color',[1 0 0]);

% Create plot
plot(X42,Y4,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot42 = plot(X43,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot42(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot43 = plot(X44,YMatrix23,'Parent',subplot2,'Color',[0 0 1]);
set(plot43(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot44 = plot(X45,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot44(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot45 = plot(X46,YMatrix24,'Parent',subplot2,'Color',[0 0 1]);
set(plot45(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot46 = plot(X47,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot46(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot47 = plot(X48,YMatrix25,'Parent',subplot2,'Color',[0 0 1]);
set(plot47(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot48 = plot(X49,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot48(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot49 = plot(X50,YMatrix26,'Parent',subplot2,'Color',[0 0 1]);
set(plot49(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot50 = plot(X51,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot50(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot51 = plot(X52,YMatrix27,'Parent',subplot2,'Color',[0 0 1]);
set(plot51(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot52 = plot(X53,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot52(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot53 = plot(X54,YMatrix28,'Parent',subplot2,'Color',[0 0 1]);
set(plot53(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot54 = plot(X55,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot54(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot55 = plot(X56,YMatrix29,'Parent',subplot2,'Color',[0 0 1]);
set(plot55(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot56 = plot(X57,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot56(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot57 = plot(X58,YMatrix30,'Parent',subplot2,'Color',[0 0 1]);
set(plot57(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot58 = plot(X59,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot58(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot59 = plot(X60,YMatrix31,'Parent',subplot2,'Color',[0 0 1]);
set(plot59(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot60 = plot(X61,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot60(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot61 = plot(X62,YMatrix32,'Parent',subplot2,'Color',[0 0 1]);
set(plot61(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot62 = plot(X63,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot62(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot63 = plot(X64,YMatrix33,'Parent',subplot2,'Color',[0 0 1]);
set(plot63(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot64 = plot(X65,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot64(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot65 = plot(X66,YMatrix34,'Parent',subplot2,'Color',[0 0 1]);
set(plot65(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot66 = plot(X67,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot66(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot67 = plot(X68,YMatrix35,'Parent',subplot2,'Color',[0 0 1]);
set(plot67(8),'Color',[1 0 0]);

% Create plot
plot(X68,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot68 = plot(X69,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot68(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot69 = plot(X70,YMatrix36,'Parent',subplot2,'Color',[0 0 1]);
set(plot69(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot70 = plot(X71,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot70(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot71 = plot(X72,YMatrix37,'Parent',subplot2,'Color',[0 0 1]);
set(plot71(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot72 = plot(X73,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot72(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot73 = plot(X74,YMatrix38,'Parent',subplot2,'Color',[0 0 1]);
set(plot73(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot74 = plot(X75,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot74(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot75 = plot(X76,YMatrix39,'Parent',subplot2,'Color',[0 0 1]);
set(plot75(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot76 = plot(X77,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot76(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot77 = plot(X78,YMatrix40,'Parent',subplot2,'Color',[0 0 1]);
set(plot77(8),'Color',[1 0 0]);

% Create plot
plot(X78,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot78 = plot(X79,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot78(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot79 = plot(X80,YMatrix41,'Parent',subplot2,'Color',[0 0 1]);
set(plot79(8),'Color',[1 0 0]);

% Create plot
plot(X80,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot80 = plot(X81,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot80(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot81 = plot(X82,YMatrix42,'Parent',subplot2,'Color',[0 0 1]);
set(plot81(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot82 = plot(X83,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot82(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot83 = plot(X84,YMatrix43,'Parent',subplot2,'Color',[0 0 1]);
set(plot83(8),'Color',[1 0 0]);

% Create plot
plot(X84,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot84 = plot(X85,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot84(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot85 = plot(X86,YMatrix44,'Parent',subplot2,'Color',[0 0 1]);
set(plot85(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot86 = plot(X87,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot86(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot87 = plot(X88,YMatrix45,'Parent',subplot2,'Color',[0 0 1]);
set(plot87(8),'Color',[1 0 0]);

% Create plot
plot(X88,Y2,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot88 = plot(X89,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot88(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot89 = plot(X90,YMatrix46,'Parent',subplot2,'Color',[0 0 1]);
set(plot89(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot90 = plot(X91,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot90(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot91 = plot(X92,YMatrix47,'Parent',subplot2,'Color',[0 0 1]);
set(plot91(8),'Color',[1 0 0]);

% Create plot
plot(X92,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot92 = plot(X93,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot92(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot93 = plot(X94,YMatrix48,'Parent',subplot2,'Color',[0 0 1]);
set(plot93(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot94 = plot(X95,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot94(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot95 = plot(X96,YMatrix49,'Parent',subplot2,'Color',[0 0 1]);
set(plot95(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot96 = plot(X97,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot96(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot97 = plot(X98,YMatrix50,'Parent',subplot2,'Color',[0 0 1]);
set(plot97(8),'Color',[1 0 0]);

% Create plot
plot(X98,Y2,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot98 = plot(X99,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot98(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot99 = plot(X100,YMatrix51,'Parent',subplot2,'Color',[0 0 1]);
set(plot99(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot100 = plot(X101,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot100(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot101 = plot(X102,YMatrix52,'Parent',subplot2,'Color',[0 0 1]);
set(plot101(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot102 = plot(X103,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot102(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot103 = plot(X104,YMatrix53,'Parent',subplot2,'Color',[0 0 1]);
set(plot103(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot104 = plot(X105,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot104(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot105 = plot(X106,YMatrix54,'Parent',subplot2,'Color',[0 0 1]);
set(plot105(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot106 = plot(X107,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot106(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot107 = plot(X108,YMatrix55,'Parent',subplot2,'Color',[0 0 1]);
set(plot107(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot108 = plot(X109,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot108(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot109 = plot(X110,YMatrix56,'Parent',subplot2,'Color',[0 0 1]);
set(plot109(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot110 = plot(X111,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot110(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot111 = plot(X112,YMatrix57,'Parent',subplot2,'Color',[0 0 1]);
set(plot111(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot112 = plot(X113,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot112(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot113 = plot(X114,YMatrix58,'Parent',subplot2,'Color',[0 0 1]);
set(plot113(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot114 = plot(X115,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot114(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot115 = plot(X116,YMatrix59,'Parent',subplot2,'Color',[0 0 1]);
set(plot115(8),'Color',[1 0 0]);

% Create plot
plot(X116,Y6,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot116 = plot(X117,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot116(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot117 = plot(X118,YMatrix60,'Parent',subplot2,'Color',[0 0 1]);
set(plot117(8),'Color',[1 0 0]);

% Create plot
plot(X118,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot118 = plot(X119,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot118(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot119 = plot(X120,YMatrix61,'Parent',subplot2,'Color',[0 0 1]);
set(plot119(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot120 = plot(X121,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot120(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot121 = plot(X122,YMatrix62,'Parent',subplot2,'Color',[0 0 1]);
set(plot121(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot122 = plot(X123,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot122(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot123 = plot(X124,YMatrix63,'Parent',subplot2,'Color',[0 0 1]);
set(plot123(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot124 = plot(X125,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot124(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot125 = plot(X126,YMatrix64,'Parent',subplot2,'Color',[0 0 1]);
set(plot125(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot126 = plot(X127,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot126(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot127 = plot(X128,YMatrix65,'Parent',subplot2,'Color',[0 0 1]);
set(plot127(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot128 = plot(X129,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot128(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot129 = plot(X130,YMatrix66,'Parent',subplot2,'Color',[0 0 1]);
set(plot129(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot130 = plot(X131,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot130(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot131 = plot(X132,YMatrix67,'Parent',subplot2,'Color',[0 0 1]);
set(plot131(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot132 = plot(X133,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot132(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot133 = plot(X134,YMatrix68,'Parent',subplot2,'Color',[0 0 1]);
set(plot133(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot134 = plot(X135,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot134(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot135 = plot(X136,YMatrix69,'Parent',subplot2,'Color',[0 0 1]);
set(plot135(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot136 = plot(X137,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot136(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot137 = plot(X138,YMatrix70,'Parent',subplot2,'Color',[0 0 1]);
set(plot137(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot138 = plot(X139,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot138(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot139 = plot(X140,YMatrix71,'Parent',subplot2,'Color',[0 0 1]);
set(plot139(8),'Color',[1 0 0]);

% Create plot
plot(X140,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot140 = plot(X141,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot140(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot141 = plot(X142,YMatrix72,'Parent',subplot2,'Color',[0 0 1]);
set(plot141(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot142 = plot(X143,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot142(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot143 = plot(X144,YMatrix73,'Parent',subplot2,'Color',[0 0 1]);
set(plot143(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot144 = plot(X145,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot144(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot145 = plot(X146,YMatrix74,'Parent',subplot2,'Color',[0 0 1]);
set(plot145(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot146 = plot(X147,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot146(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot147 = plot(X148,YMatrix75,'Parent',subplot2,'Color',[0 0 1]);
set(plot147(8),'Color',[1 0 0]);

% Create plot
plot(X148,Y4,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot148 = plot(X149,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot148(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot149 = plot(X150,YMatrix76,'Parent',subplot2,'Color',[0 0 1]);
set(plot149(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot150 = plot(X151,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot150(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot151 = plot(X152,YMatrix77,'Parent',subplot2,'Color',[0 0 1]);
set(plot151(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot152 = plot(X153,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot152(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot153 = plot(X154,YMatrix78,'Parent',subplot2,'Color',[0 0 1]);
set(plot153(8),'Color',[1 0 0]);

% Create plot
plot(X154,Y5,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot154 = plot(X155,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot154(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot155 = plot(X156,YMatrix79,'Parent',subplot2,'Color',[0 0 1]);
set(plot155(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot156 = plot(X157,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot156(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot157 = plot(X158,YMatrix80,'Parent',subplot2,'Color',[0 0 1]);
set(plot157(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot158 = plot(X159,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot158(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot159 = plot(X160,YMatrix81,'Parent',subplot2,'Color',[0 0 1]);
set(plot159(8),'Color',[1 0 0]);

% Create plot
plot(X160,Y3,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot160 = plot(X161,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot160(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot161 = plot(X162,YMatrix82,'Parent',subplot2,'Color',[0 0 1]);
set(plot161(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot162 = plot(X163,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot162(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot163 = plot(X164,YMatrix83,'Parent',subplot2,'Color',[0 0 1]);
set(plot163(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot164 = plot(X165,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot164(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot165 = plot(X166,YMatrix84,'Parent',subplot2,'Color',[0 0 1]);
set(plot165(8),'Color',[1 0 0]);

% Create plot
plot(X166,Y3,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot166 = plot(X167,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot166(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot167 = plot(X168,YMatrix85,'Parent',subplot2,'Color',[0 0 1]);
set(plot167(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot168 = plot(X169,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot168(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot169 = plot(X170,YMatrix86,'Parent',subplot2,'Color',[0 0 1]);
set(plot169(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot170 = plot(X171,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot170(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot171 = plot(X172,YMatrix87,'Parent',subplot2,'Color',[0 0 1]);
set(plot171(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot172 = plot(X173,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot172(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot173 = plot(X174,YMatrix88,'Parent',subplot2,'Color',[0 0 1]);
set(plot173(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot174 = plot(X175,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot174(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot175 = plot(X176,YMatrix89,'Parent',subplot2,'Color',[0 0 1]);
set(plot175(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot176 = plot(X177,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot176(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot177 = plot(X178,YMatrix90,'Parent',subplot2,'Color',[0 0 1]);
set(plot177(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot178 = plot(X179,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot178(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot179 = plot(X180,YMatrix91,'Parent',subplot2,'Color',[0 0 1]);
set(plot179(8),'Color',[1 0 0]);

% Create plot
plot(X180,Y2,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot180 = plot(X181,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot180(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot181 = plot(X182,YMatrix92,'Parent',subplot2,'Color',[0 0 1]);
set(plot181(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot182 = plot(X183,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot182(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot183 = plot(X184,YMatrix93,'Parent',subplot2,'Color',[0 0 1]);
set(plot183(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot184 = plot(X185,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot184(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot185 = plot(X186,YMatrix94,'Parent',subplot2,'Color',[0 0 1]);
set(plot185(8),'Color',[1 0 0]);

% Create plot
plot(X186,Y6,'Parent',subplot2,'Color',[0 0 1]);

% Create multiple lines using matrix input to plot
plot186 = plot(X187,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot186(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot187 = plot(X188,YMatrix95,'Parent',subplot2,'Color',[0 0 1]);
set(plot187(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot188 = plot(X189,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot188(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot189 = plot(X190,YMatrix96,'Parent',subplot2,'Color',[0 0 1]);
set(plot189(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot190 = plot(X191,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot190(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot191 = plot(X192,YMatrix97,'Parent',subplot2,'Color',[0 0 1]);
set(plot191(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot192 = plot(X193,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot192(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot193 = plot(X194,YMatrix98,'Parent',subplot2,'Color',[0 0 1]);
set(plot193(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot194 = plot(X195,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot194(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot195 = plot(X196,YMatrix99,'Parent',subplot2,'Color',[0 0 1]);
set(plot195(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot196 = plot(X197,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot196(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot197 = plot(X198,YMatrix100,'Parent',subplot2,'Color',[0 0 1]);
set(plot197(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot198 = plot(X199,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot198(5),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot199 = plot(X200,YMatrix101,'Parent',subplot2,'Color',[0 0 1]);
set(plot199(9),'Color',[1 0 0]);

% Create multiple lines using matrix input to plot
plot200 = plot(X201,YMatrix2,'Parent',subplot2,'Marker','.',...
    'LineStyle','none',...
    'Color',[0 0 1]);
set(plot200(5),'Color',[1 0 0]);

% Create xlabel
xlabel('Generation','Interpreter','none');

% Create ylabel
ylabel('Individual','Interpreter','none');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot2,[0 107.1]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot2,[0 6]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot2,[0 1]);
% Create subplot
subplot3 = subplot(3,3,3,'Parent',figure1,'Tag','gaplotscorediversity');

% Create patch
patch('Parent',subplot3,'DisplayName','fun1 [0.0931034  0.126667]',...
    'Vertices',Vertices1,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData1);

% Create patch
patch('Parent',subplot3,'DisplayName','fun2 [0  1]','Vertices',Vertices2,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData2);

% Create patch
patch('Parent',subplot3,'DisplayName','fun3 [0  1]','Vertices',Vertices3,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor',[0.15 0.15 0.15],...
    'CData',CData3);

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
% xlim(subplot4,[0 6]);
% Set the remaining axes properties
set(subplot4,'XTick',[0 1 2 3 4 5 6]);
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
plot(X202,Y7,'Parent',subplot6,'Tag','gaplotPareto1','Marker','pentagram',...
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
bar(YMatrix2,yvector2,'Tag','gaplotparetodistance1','Parent',subplot7,...
    'FaceColor',[1 0 1],...
    'EdgeColor','none');

% Create xlabel
xlabel('Individuals');

% Create title
title('Distance of individuals','Interpreter','none');

% Create ylabel
ylabel('Distance');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot7,[0 6]);
% Uncomment the following line to preserve the Z-limits of the axes
% zlim(subplot7,[0 1]);
% Set the remaining axes properties
set(subplot7,'XTick',[1 2 3 4 5]);
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
% xlim(subplot8,[0 5]);
% Set the remaining axes properties
set(subplot8,'XTick',[0 1 2 3 4 5]);
% Create subplot
subplot9 = subplot(3,3,9,'Parent',figure1,'Tag','gaplotspread');
hold(subplot9,'on');

% Create plot
plot(X1,Y8,'Parent',subplot9,'Tag','gaplotavgdistance','Marker','.',...
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
