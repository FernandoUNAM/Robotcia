%%  Robot Comau Racer 5

%%   Parámetros del Robot

% Robot's Links Length [m]

l1 = .327;
l2 = .290;
l3 = .300;
l4 = .064;

% Body's Weight [Kg] (1.5 from Original)

m1 = 9.9694; 
m2 = 8.8463;
m3 = 7.0698;
m4 = 2.9381;
m5 = 0.9242;
m6 = 4.3808;
m7 = 0.0021;

% Moment of Inertia at the Center of Mass (kg/m^2)

Ixx1 = 3.165
%% Mesa de Trabajo

largo   = 1.0;
ancho   = 0.40;
grosor  = 0.10;
altura  = 0.331;

MiddleEdge = [.080;0;altura];

    conveyorx = [MiddleEdge(1),         MiddleEdge(1),          MiddleEdge(1)+ancho,    MiddleEdge(1)+ancho];
    conveyory = [MiddleEdge(2)-largo/2, MiddleEdge(2)+largo/2,  MiddleEdge(2)+largo/2,  MiddleEdge(2)-largo/2];
    conveyorz = [MiddleEdge(3),         MiddleEdge(3),          MiddleEdge(3),          MiddleEdge(3)];

ConveyorPosition = [conveyorx;conveyory;conveyorz];
%%

Box1Pos = [MiddleEdge+ancho];


%{
Box1 = [[MiddleEdge(1)+ancho MiddleEdge(1)+ancho MiddleEdge(1)+ancho+Lados MiddleEdge(1)+ancho+Lados],...
        [0 Lados Lados 0],[ones(1,4)*altura]];

Box2 = [[MiddleEdge(1)+ancho MiddleEdge(1)+ancho MiddleEdge(1)+ancho+Lados MiddleEdge(1)+ancho+Lados],...
        [0 -Lados -Lados 0],[ones(1,4)*altura]];
%}
