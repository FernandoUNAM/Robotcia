%%  Robot Comau Racer 5

%%   Parámetros del Robot

% Robot's Links Length [m]

%l1 = .327;
%l2 = .290;
%l3 = .300;
%l4 = .064;

% Distance to the Center of Mass [mm]

%{
cx1 = -27.873;  cy1 = 0.007;    cz1 = 73.884;
cx2 = 6.272;    cy2 = 0.289;    cz2 = 235.419;
cx3 = -8.702;   cy3 = 0.704;    cz3 = 449.173;
cx4 = -6.611;   cy4 = -4.914;   cz4 = 610.415;
cx5 = 179.89;   cy5 = -0.288;   cz5 = 619.315;
cx6 = 312.701;  cy6 = 0.188;    cz6 = 616.996;
cx7 = 359.683;  cy7 = -0.059;   cz7 = 616.963;
%}

%dcx0 = -27.873;     dcy0 = 0.007;       dcz0 = 73.884;

dcx1 = 0.006272;      dcy1 = 0.000289;       dcz1 = -0.089581;
dcx2 = -0.008702;     dcy2 = 0.000704;       dcz2 = 0.124173;
dcx3 = -0.006611;     dcy3 = -0.004914;      dcz3 = -0.007585;
dcx4 = -0.12011;      dcy4 = -0.000288;      dcz4 = 0.002315;
dcx5 = 0.012701;      dcy5 = 0.000188;       dcz5 = -0.000004;
dcx6 = -0.059683;     dcy6 = 0.000059;       dcz6 = 0.000037;

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
