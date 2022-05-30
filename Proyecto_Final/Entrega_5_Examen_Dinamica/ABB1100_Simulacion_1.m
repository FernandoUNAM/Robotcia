%%  Robot ABB 1100 4 58
%   Simulación 1: Movimiento de cada uno de los Sistemas de Referencia (ejes)
tic
close all; clc;
%clear all; 

global sysref zoom

% Opción para ocultar los Sistemas de Referencia
sysref = 1;
zoom = 0;

% Definición de movimiento
Incremento = 10;
Delay = 0.001;



% Movimiento de Articulación q1
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(deg2rad(i),0,0,0,0,0);
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end

% Movimiento de Articulación q2
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(0,deg2rad(i),0,0,0,0);
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end

% Movimiento de Articulación q3
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(0,0,deg2rad(i),0,0,0);
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end

% Movimiento de Articulación q4
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(0,0,0,deg2rad(i),0,0);
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end



% Movimiento de Articulación q5
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(0,0,0,0,deg2rad(i),0);
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end
%%


% Movimiento de Articulación q6
for i = 0:Incremento:360
   clf;
   ABB1100_RobotDrawing(0,0,0,0,0,deg2rad(i));
   pause(Delay);
   %exportgraphics(gcf,'ABB1100_Simulacion1_V2.gif','Append',true);
end
toc
