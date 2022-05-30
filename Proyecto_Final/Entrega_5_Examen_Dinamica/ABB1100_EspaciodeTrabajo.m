%% Método 2

% 1.- Hacer un barrido de las coordenadas articulares
% 2.- Evaluar el Determinante con las combinaciones
% 3.- Almacenar puntos cartesianos válidos (Cinemática Directa)
% 4.- Dibujar nube de puntos

close all; clear all;

ABB1100_Parametros

tic

inc = 60;
c = 5;

% Inicializacion
% For anidado

for i = 0:inc:360
    
    for j = 0:inc:360
        
        for k = 0:inc:360

            for l = 0:inc:360

                for m = 0:inc:360

                    for n = 0:inc:360

                        q1 = deg2rad(i);
                        q2 = deg2rad(j);
                        q3 = deg2rad(k);
                        q4 = deg2rad(l);
                        q5 = deg2rad(m);
                        q6 = deg2rad(n);
                        
                        % DETJ44r
                        DET = -(l2*l3*cos(q3)*sin(q5)*(cos(pi) - 1)^2*(l3*cos(q2 + q3) + 2*l2*cos(pi/2 + q2) - l3*cos(pi + q2 + q3)))/8;
                        
                        if abs(DET)>0.005 
                        
                            P(c,1) = l4*(sin(pi/2)*(sin(q5)*(cos(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) - cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + sin(pi/2)^2*sin(q1)*sin(q4)) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1))) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*sin(pi/2)*sin(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) - sin(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) - sin(pi/2)^2*cos(q4)*sin(q1)))) + l2*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1)) + l3*sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*cos(q1) + cos(pi/2 + q2)*cos(pi/2)*sin(q1)) + sin(q3)*(cos(pi/2 + q2)*cos(q1) - sin(pi/2 + q2)*cos(pi/2)*sin(q1))) + l3*cos(pi/2)*sin(pi/2)*sin(q1);
                            P(c,2) = l4*(sin(pi/2)*(sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(q5)*(cos(pi/2)*sin(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*sin(q4)) + cos(pi/2)*cos(q5)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4))) + cos(pi/2)*(cos(pi/2)*(sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - cos(pi/2)*sin(pi/2)*cos(q1)) - sin(pi/2)*(sin(q4)*(cos(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) - sin(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1))) + cos(pi/2)*cos(q4)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) + sin(pi/2)^2*cos(q1)*cos(q4)))) + l2*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1)) + l3*sin(pi/2)*(cos(q3)*(sin(pi/2 + q2)*sin(q1) - cos(pi/2 + q2)*cos(pi/2)*cos(q1)) + sin(q3)*(cos(pi/2 + q2)*sin(q1) + sin(pi/2 + q2)*cos(pi/2)*cos(q1))) - l3*cos(pi/2)*sin(pi/2)*cos(q1);
                            P(c,3) = l1 + l4*(cos(pi/2)*(sin(pi/2)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - cos(pi/2)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2)) - sin(pi/2)*(cos(pi/2)*cos(q5)*(cos(pi/2)*sin(pi/2)*cos(q4) - sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) - sin(q5)*(cos(q4)*(cos(pi/2 + q2)*sin(pi/2)*sin(q3) + sin(pi/2 + q2)*sin(pi/2)*cos(q3)) + cos(pi/2)*sin(pi/2)*sin(q4) + cos(pi/2)*sin(q4)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3))) + sin(pi/2)*cos(q5)*(sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3)) - cos(pi/2)^2))) + l3*cos(pi/2)^2 + l2*sin(pi/2 + q2)*sin(pi/2) - l3*sin(pi/2)*(cos(pi/2 + q2)*sin(pi/2)*cos(q3) - sin(pi/2 + q2)*sin(pi/2)*sin(q3));
            
                            c = c+1;


                        end

                    end

                end

            end
            
        end
        
    end
    
end

% Figura de Espacio de Trabajo

RobotWorkspace = figure(1)
RobotWorkspace.Position(1:4) = [0 720 1440 720];
RobotWorkspace.Name = "Espacio de Trabajo Robot Comau Racer 5080"

% Nube de Puntos con Robot de Referencia

sbplot1 = subplot(2,2,1)
plot(DET)
plot3(P(:,1),P(:,2),P(:,3),"r.")
hold on
ABB1100_RobotDrawing(0,0,0,0,0,0)
grid on
sbplot1.Position = sbplot1.Position + [-0.1 -.05 0 .1]
title('Nube de Puntos Posibles Robot')

% Superficie de cubierta de Espacio de Trabajo

sbplot2 = subplot(2,2,3)
DT = delaunayTriangulation(P);
[K,v] = convexHull(DT);
volumen=v % 1.5429 [m^3]
trisurf(K,DT.Points(:,1),DT.Points(:,2),DT.Points(:,3),...
       'FaceColor','cyan')
sbplot2.Position = sbplot2.Position + [0.1 -0.05 0 .15]
title('Superficie Envolvente de Espacio de Trabajo')
 
% Nube de Puntos con un Factor de contracción 0
% S to 0 gives the convex hull
k = boundary(P,0);
sbplot3 = subplot(2,2,2);
plot3(P(:,1),P(:,2),P(:,3),'.','MarkerSize',10)
hold on
trisurf(k,P(:,1),P(:,2),P(:,3),'FaceColor','red','FaceAlpha',0.1)
axis equal
title('Shrink Factor = 0')
grid on
sbplot3.Position = sbplot3.Position + [-0.1 -0.12 0 .15]

% Nube de Puntos con un Factor de Contracción 1 
% S to 1 gives a compact boundary that envelops the points
j = boundary(P,1);
sbplot4 = subplot(2,2,4);
plot3(P(:,1),P(:,2),P(:,3),'.','MarkerSize',10)
hold on
trisurf(j,P(:,1),P(:,2),P(:,3),'FaceColor','red','FaceAlpha',0.1)
axis equal
title('Shrink Factor = 1')
grid on
sbplot4.Position = sbplot4.Position + [0.1 -0.05 0 .15]

toc



