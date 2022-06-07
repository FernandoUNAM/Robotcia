%%  Robot ABB 1100 4 580
%   Función de Dibujo del Robot

% La función recibe las variables articulares del robot a dibujar
function [] = ABB1100_RobotDrawing(q1,q2,q3,q4,q5,q6)

% Activación de Sistemas de Referencia
global sysref
%global zoom

% Se mandan a llamar los parámetros físicos del robot
ABB1100_Parametros

% Modelo Denavit Hartenberg en Espacio Articular del Robot (Numérico)

S01 = DHC(0,0,q1,l1);
S12 = DHC(pi/2,0,(pi/2)+q2,0);
S23 = DHC(0,l2,q3,0);
S34 = DHC(pi/2,0,q4,l3);
S45 = DHC(-pi/2,0,q5,0);
S56 = DHC(pi/2,0,q6,0);
S67 = DHC(0,0,0,l4);

% Sistemas de Referencia en Espacio Cartesiano

S02 = S01*S12;
S03 = S01*S12*S23;
S04 = S01*S12*S23*S34;
S05 = S01*S12*S23*S34*S45;
S06 = S01*S12*S23*S34*S45*S56;
S07 = S01*S12*S23*S34*S45*S56*S67;

% Posiciones Cartesianas de Articulaciones y Eslabones

x = [0 S01(1,4) S02(1,4) S03(1,4) S04(1,4) S05(1,4) S06(1,4) S07(1,4)];
y = [0 S01(2,4) S02(2,4) S03(2,4) S04(2,4) S05(2,4) S06(2,4) S07(2,4)];
z = [0 S01(3,4) S02(3,4) S03(3,4) S04(3,4) S05(3,4) S06(3,4) S07(3,4)];

x01 = [0 S01(1,4)];
x12 = [S01(1,4) S02(1,4)];
x23 = [S02(1,4) S03(1,4)];
x34 = [S03(1,4) S04(1,4)];
x45 = [S04(1,4) S05(1,4)];
x56 = [S05(1,4) S06(1,4)];
x67 = [S06(1,4) S07(1,4)];

y01 = [0 S01(2,4)];
y12 = [S01(2,4) S02(2,4)];
y23 = [S02(2,4) S03(2,4)];
y34 = [S03(2,4) S04(2,4)];
y45 = [S04(2,4) S05(2,4)];
y56 = [S05(2,4) S06(2,4)];
y67 = [S06(2,4) S07(2,4)];

z01 = [0 S01(3,4)];
z12 = [S01(3,4) S02(3,4)];
z23 = [S02(3,4) S03(3,4)];
z34 = [S03(3,4) S04(3,4)];
z45 = [S04(3,4) S05(3,4)];
z56 = [S05(3,4) S06(3,4)];
z67 = [S06(3,4) S07(3,4)];


% Dibujo de Eslabones en Espacio Cartesiano

line = 3;
plot3(x01,y01,z01,"LineWidth",line,"Color",[0 0.4470 0.7210]);
hold on
plot3(x12,y12,z12,"LineWidth",line,"Color",[0.8500 0.3250 0.0980]);
plot3(x23,y23,z23,"LineWidth",line,"Color",[0.9290 0.6940 0.1250]);
plot3(x34,y34,z34,"LineWidth",line,"Color",[0.4940 0.1840 0.5560]);
plot3(x45,y45,z45,"LineWidth",line,"Color",[0.4660 0.6740 0.1880]);
plot3(x56,y56,z56,"LineWidth",line,"Color",[0.3010 0.7450 0.9330]);
plot3(x67,y67,z67,"LineWidth",line,"Color",[0.6350 0.0780 0.1840]);


% Dibujo de Sistemas de Referencia de las Articulaciones

if sysref == 1
    frame(eye(4),'red',0.20);
    %frame(S01,'#0072BD',0.1);
    %frame(S02,'#D95319',0.1);
    %frame(S03,'#EDB120',0.1);
    %frame(S04,'#7E2F8E',0.1);
    %frame(S05,'#77AC30',0.1);
    %frame(S06,'#4DBEEE',0.1);
    frame(S07,'#4DBEEE',0.1);
elseif sysref == 0.5
    frame(eye(4),'red',0.2);
    frame(S07,'#4DBEEE',0.1);
else 
    ;
end

% Limites de Visualización de la Gráfica
% if zoom == 1
%     ejes = [-0.9 0.9 -0.9 0.9 -0.92 0.92];
% 
% elseif zoom == 0.5
%     ejes = [-0.9 0.9 -0.9 0.9 -0.92 0.92];

%else

ejes = [-0.6 0.6 -0.6 0.6 -0.92 0.92];
    
%end

axis(ejes);

% Malla 3D 
grid on;

end