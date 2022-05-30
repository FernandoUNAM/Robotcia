%%  Robot Comau Racer 5
%   Simulación 2: Solución del Robot para un Punto Dado

% Inicialización de la Simulación
clear all; close all; clc; 

timeStart = tic;

% Parametros de Visualizacion
global sysref zoom

sysref = 1;
zoom = 1;

% Definición del Punto Cartesiano a Resolver dentro del Espacio de Trabajo
global xe ye ze alpha beta gamma

xe = 0.364;
ye = 0.0;
ze = 0.617;

alpha = deg2rad(0);
beta = deg2rad(180);
gamma = deg2rad(0);

% Condición Inicial de Articulaciones para solución por Método Numérico
q0 = [0,0,0,0,0,0];

tic;

% Solución
opts = optimoptions(@fsolve,'Algorithm', 'levenberg-marquardt');

q = fsolve(@ABB1100_CinematicaInversa,q0,opts);

spacing = xe*0.1;

SolveTime = toc;

ABB1100_RobotDrawing(q(1),q(2),q(3),q(4),q(5),q(6));
    campos([0.5 0.5 0.7])

tic
%%
% Posición de Solución Robot con Animación
j = 0;

for i = -100:1:100
    % Limpiado de Figura
    clf
    j = i/100;

    % Dibujo del Robot de la Solución Obtenida
    ABB1100_RobotDrawing(q(1),q(2),q(3),q(4),q(5),q(6));
    campos([0.5 j 0.7])
    pause(0.001)
    
    if j<=-0.5
    text(xe+spacing,ye+spacing,ze+(10*spacing),["Punto Cartesiano:","x_e: "+0.4,"y_e: "+0,"z_e: "+0.364])
    else
    end

    %exportgraphics(gcf,'ABB1100_Simulacion_2_V1.gif','Append',true);
end

TotalLoop = toc;
LoopTimeMean = toc/201;


Message1 = sprintf("El Tiempo de Ejecución del Algoritmo de Solución es de %.4f segundos",SolveTime);
Message2 = sprintf("El Tiempo Promedio del Ciclo de Cambio de Posición de Cámara es de %.4f segundos",LoopTimeMean);
Message3 = sprintf("El Tiempo Completo del Ciclo de Cambio de Posición de camará es de %.4f segundos",TotalLoop);

disp(Message1);
disp(Message2);
disp(Message3);




