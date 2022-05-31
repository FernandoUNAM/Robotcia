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

% Moment of Inertia at the Center of Mass (kg*m^2)

Ixx1 = 0.0316500000;
Ixy1 = 0.0000095196;
Ixz1 = -0.0002157000;
Iyx1 = 0.0000095196;
Iyy1 = 0.0491100000;
Iyz1 = 0.0000009685;
Izx1 = -0.0002157000;
Izy1 = 0.0000009685;
Izz1 = 0.0420000000;

Ixx2 = 0.0523300000;
Ixy2 = 0.0000397331;
Ixz2 = 0.0003922000;
Iyx2 = 0.0000397331;
Iyy2 = 0.0386600000;
Iyz2 = -0.0003664000;
Izx2 = 0.0003922000;
Izy2 = -0.0003664000;
Izz2 = 0.0380700000;

Ixx3 = 0.0879900000;
Ixy3 = -0.0000608838;
Ixz3 = 0.0010370000;
Iyx3 = -0.0000608838;
Iyy3 = 0.0756800000;
Iyz3 = -0.0023960000;
Izx3 = 0.0010370000;
Izy3 = -0.0023960000;
Izz3 = 0.0197000000;

Ixx4 = 0.0044920000;
Ixy4 = 0.0000961428;
Ixz4 = -0.0003186000;
Iyx4 = 0.0000961428;
Iyy4 = 0.0060800000;
Iyz4 = -0.0001323000;
Izx4 = -0.0003186000;
Izy4 = -0.0001323000;
Izz4 = 0.0061840000;

Ixx5 = 0.0056990000;
Ixy5 = 0.0001403000;
Ixz5 = 0.0000274219;
Iyx5 = 0.0001403000;
Iyy5 = 0.0233700000;
Iyz5 = -0.0000031108;
Izx5 = 0.0000274219;
Izy5 = -0.0000031108;
Izz5 = 0.0245600000;

Ixx6 = 0.0005799000;
Ixy6 = 0.0000016168;
Ixz6 = -0.0000000148;
Iyx6 = 0.0000016168;
Iyy6 = 0.0009751000;
Iyz6 = -0.0000000298;
Izx6 = -0.0000000148;
Izy6 = -0.0000000298;
Izz6 = 0.0008797000;

Ixx7 = 0.0000048726;
Ixy7 = 0.0000000018;
Ixz7 = 0.0000000002;
Iyx7 = 0.0000000018;
Iyy7 = 0.0000025040;
Iyz7 = -0.0000000174;
Izx7 = 0.0000000002;
Izy7 = -0.0000000174;
Izz7 = 0.0000026062;


%%
clear
value = 3.165E+07;
u = symunit;
c = unitConvert(value*u.g*u.mm^2,"SI");
[F,U] = separateUnits(c);
valueConverted = vpa(F,5)
U
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
