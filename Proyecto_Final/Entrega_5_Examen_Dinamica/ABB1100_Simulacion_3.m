%%  Robot ABB 1100 4 58
%   Simulación 3: Solución del Robot para una Trayectoria Definida

% Inicialización de la Simulación
clear all; close all; clc;

tic

% Parametros de Visualizacion

global sysref zoom
sysref = 0;
zoom = 1;

% Parametros de Animación
Incremento = 5;
Delay = 0.001;

% Definición del Punto Cartesiano a Resolver dentro del Espacio de Trabajo
global xe ye ze alpha beta gamma

alpha = deg2rad(0);
beta = deg2rad(-180);
gamma = deg2rad(0);

% Condición Inicial de Articulaciones (Estado Inicial)
q0 = [0,0,0,0,0,0];

% Avance de Arreglo
c = 1;

% Prealocación de Memoria 
 x = NaN*ones(1,37); y = NaN*ones(1,37); z = NaN*ones(1,37);
 q1 = NaN*ones(1,37); q2 = NaN*ones(1,37); q3 = NaN*ones(1,37); q4 = NaN*ones(1,37);
 q5 = NaN*ones(1,37); q6 = NaN*ones(1,37); q7 = NaN*ones(1,37);

toc

tic
for i = 0:Incremento:360
    
    % Limpieza de Figura
    clf;
    
    % Trayectoria Definida en el Espacio Cartesiano
    xe = 0.3 + sin(deg2rad(i))*0.05;
    ye = 0.3 + cos(deg2rad(i))*0.05;
    ze = 0.4;
    
    % Almacenamiento de Puntos Cartesianos
    x(c) = xe;
    y(c) = ye;
    z(c) = ze;
    
    % Solución de Cinemática Inversa
    % Dadas Coordenadas Cartesianas -> Solución en Espacio Articular
    
    q = fsolve(@ABB1100_CinematicaInversa,q0);
    
    % Almacenamiento de Puntos en el Espacio Articular
    q1(c) = q(1);
    q2(c) = q(2);
    q3(c) = q(3);
    q4(c) = q(4);
    q5(c) = q(5);
    q6(c) = q(6);
    
    % Dibujo del Robot en Seguimiento de la Trayectoria
    ABB1100_RobotDrawing(q(1),q(2),q(3),q(4),q(5),q(6));
    
    % Dibujo de la Trayectoria
    plot3(x,y,z,'r',"LineWidth",2);
    campos([1 0.5 1]);
    
    % Asignación de Solución Actual a la Previa
    q0 = q;
    
    % Incremento del Movimiento en el Arreglo
    c = c + 1;
    
    pause(Delay)
    %exportgraphics(gcf,'ABB1100_Simulacion_3_V1.gif','Append',true);
end
toc
