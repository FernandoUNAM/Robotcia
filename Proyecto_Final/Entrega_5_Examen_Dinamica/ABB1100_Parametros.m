%%  Robot Comau Racer 5

%%   Parámetros del Robot

% Robot's Links Length [m]

l1 = .327;
l2 = .290;
l3 = .300;
l4 = .064;

% Distance to the Center of Mass [mm]

dcx1 = 0.006272;      dcy1 = 0.000289;       dcz1 = -0.089581;
dcx2 = -0.008702;     dcy2 = 0.000704;       dcz2 = 0.124173;
dcx3 = -0.006611;     dcy3 = -0.004914;      dcz3 = -0.007585;
dcx4 = -0.12011;      dcy4 = -0.000288;      dcz4 = 0.002315;
dcx5 = 0.012701;      dcy5 = 0.000188;       dcz5 = -0.000004;
dcx6 = 0.059683;     dcy6 = 0.000059;       dcz6 = 0.000037;
%{ 
Original delta q6
dcx6 = -0.059683;     dcy6 = 0.000059;       dcz6 = 0.000037;
%}

% Body's Weight [Kg] (1.5 from Original)

m0 = 9.9694; 
m1 = 8.8463;
m2 = 7.0698;
m3 = 2.9381;
m4 = 4.3808;
m5 = 0.9242;
m6 = 0.0206;

% Moment of Inertia at the Center of Mass (kg*m^2)

Ixx0 = 0.0316500000;
Ixy0 = 0.0000095196;
Ixz0 = -0.0002157000;
Iyx0 = 0.0000095196;
Iyy0 = 0.0491100000;
Iyz0 = 0.0000009685;
Izx0 = -0.0002157000;
Izy0 = 0.0000009685;
Izz0 = 0.0420000000;

Ixx1 = 0.0523300000;
Ixy1 = 0.0000397331;
Ixz1 = 0.0003922000;
Iyx1 = 0.0000397331;
Iyy1 = 0.0386600000;
Iyz1 = -0.0003664000;
Izx1 = 0.0003922000;
Izy1 = -0.0003664000;
Izz1 = 0.0380700000;

Ixx2 = 0.0879900000;
Ixy2 = -0.0000608838;
Ixz2 = 0.0010370000;
Iyx2 = -0.0000608838;
Iyy2 = 0.0756800000;
Iyz2 = -0.0023960000;
Izx2 = 0.0010370000;
Izy2 = -0.0023960000;
Izz2 = 0.0197000000;

Ixx3 = 0.0044920000;
Ixy3 = 0.0000961428;
Ixz3 = -0.0003186000;
Iyx3 = 0.0000961428;
Iyy3 = 0.0060800000;
Iyz3 = -0.0001323000;
Izx3 = -0.0003186000;
Izy3 = -0.0001323000;
Izz3 = 0.0061840000;

Ixx4 = 0.0056990000;
Ixy4 = 0.0001403000;
Ixz4 = 0.0000274219;
Iyx4 = 0.0001403000;
Iyy4 = 0.0233700000;
Iyz4 = -0.0000031108;
Izx4 = 0.0000274219;
Izy4 = -0.0000031108;
Izz4 = 0.0245600000;

Ixx5 = 0.0005799000;
Ixy5 = 0.0000016168;
Ixz5 = -0.0000000148;
Iyx5 = 0.0000016168;
Iyy5 = 0.0009751000;
Iyz5 = -0.0000000298;
Izx5 = -0.0000000148;
Izy5 = -0.0000000298;
Izz5 = 0.0008797000;
%{
Ixx6 = 0.0005799000;
Ixy6 = 0.0000016168;
Ixz6 = -0.0000000148;
Iyx6 = 0.0000016168;
Iyy6 = 0.0009751000;
Iyz6 = -0.0000000298;
Izx6 = -0.0000000148;
Izy6 = -0.0000000298;
Izz6 = 0.0008797000;
%}

Ixx6 = 0.0000048726;
Ixy6 = 0.0000000018;
Ixz6 = 0.0000000002;
Iyx6 = 0.0000000018;
Iyy6 = 0.0000025040;
Iyz6 = -0.0000000174;
Izx6 = 0.0000000002;
Izy6 = -0.0000000174;
Izz6 = 0.0000026062;

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
%% Cajas 

Box1Pos = [MiddleEdge+ancho];
