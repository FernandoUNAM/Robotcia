%%  Robot ABB 1100 4 580

%   Inicialización
clc; clear all; close all;

%%   Matrices de Denavit Hartenberg
syms l1 l2 l3 l4 q1 q2 q3 q4 q5 q6 pi

% Matrices Denavit Hartenberg (Simbólicas)

% DHC(alpha,a,theta,d)

S01 = DHC(0,0,q1,l1);
S12 = DHC(pi/2,0,(pi/2)+q2,0);
S23 = DHC(0,l2,q3,0);
S34 = DHC(pi/2,0,q4,l3);
S45 = DHC(-pi/2,0,q5,0);
S56 = DHC(pi/2,0,q6,0);
S67 = DHC(0,0,0,l4);

S02=S01*S12;
S03=S01*S12*S23;
S04=S01*S12*S23*S34;
S05=S01*S12*S23*S34*S45;
S06=S01*S12*S23*S34*S45*S56;
S07=S01*S12*S23*S34*S45*S56*S67;

%% Modelo Cinemático

% Vectores de Posición que se obtienen de la submatriz de Traslación

P01 = S01(1:3,4);
P12 = S12(1:3,4);
P23 = S23(1:3,4);
P34 = S34(1:3,4);
P45 = S45(1:3,4);
P56 = S56(1:3,4);
P67 = S67(1:3,4);

% Matrices de Rotación relativas  -> Indexado a la submatriz de Rotacion

R01 = S01(1:3,1:3);
R12 = S12(1:3,1:3);
R23 = S23(1:3,1:3);
R34 = S34(1:3,1:3);
R45 = S45(1:3,1:3);
R56 = S56(1:3,1:3);
R67 = S67(1:3,1:3);

%% Propagación de Velocidades

syms q1p q2p q3p q4p q5p q6p

Z = [0;0;1];

% Velocidad Lineal y Angular de 0 visto desde 0
v00 = [0;0;0];
w00 = [0;0;0];

% Velocidad Lineal y Angular de 1 vista desde 1
v11 = transpose(R01)*(v00+cross(w00,P01));
w11 = transpose(R01)*w00+q1p*Z;

% Velocidad Lineal y Angular de 2 vista desde 2
v22 = transpose(R12)*(v11+cross(w11,P12));
w22 = transpose(R12)*w11+q2p*Z;

% Velocidad Lineal y Angular de 3 vista desde 3
v33 = transpose(R23)*(v22+cross(w22,P23));
w33 = transpose(R23)*w22+q3p*Z;

% Velocidad Lineal y Angular de 4 vista desde 4
v44 = transpose(R34)*(v33+cross(w33,P34));
w44 = transpose(R34)*w33+q4p*Z;

% Velocidad Lineal y Angular de 5 vista desde 5
v55 = transpose(R45)*(v44+cross(w44,P45));
w55 = transpose(R45)*w44+q5p*Z;

% Velocidad Lineal y Angular de 6 vista desde 6
v66 = transpose(R56)*(v55+cross(w55,P56));
w66 = transpose(R56)*w55+q6p*Z;

% Velocidad Lineal y Angular de 7 vista desde 7
v77 = transpose(R67)*(v66+cross(w66,P67));
w77 = transpose(R67)*w66+0*Z;

%% Modelo Dinámico

syms g

syms l1 l2 l3 l4 

syms m1 m2 m3 m4 m5 m6

syms q1 q2 q3 q4 q5 q6
syms q1p q2p q3p q4p q5p q6p
syms q1pp q2pp q3pp q4pp q5pp q6pp

syms dcx1 dcx2 dcx3 dcx4 dcx5 dcx6
syms dcy1 dcy2 dcy3 dcy4 dcy5 dcy6
syms dcz1 dcz2 dcz3 dcz4 dcz5 dcz6

syms Ixx1 Ixx2 Ixx3 Ixx4 Ixx5 Ixx6
syms Ixy1 Ixy2 Ixy3 Ixy4 Ixy5 Ixy6
syms Ixz1 Ixz2 Ixz3 Ixz4 Ixz5 Ixz6 

syms Iyx1 Iyx2 Iyx3 Iyx4 Iyx5 Iyx6
syms Iyy1 Iyy2 Iyy3 Iyy4 Iyy5 Iyy6
syms Iyz1 Iyz2 Iyz3 Iyz4 Iyz5 Iyz6

syms Izx1 Izx2 Izx3 Izx4 Izx5 Izx6
syms Izy1 Izy2 Izy3 Izy4 Izy5 Izy6
syms Izz1 Izz2 Izz3 Izz4 Izz5 Izz6

% Matrices de Inercias

I1 = [Ixx1,Ixy1,Ixz1;Iyx1,Iyy1,Iyz1;Izx1,Izy1,Izz1];
I2 = [Ixx2,Ixy2,Ixz2;Iyx2,Iyy2,Iyz2;Izx2,Izy2,Izz2];
I3 = [Ixx3,Ixy3,Ixz3;Iyx3,Iyy3,Iyz3;Izx3,Izy3,Izz3];
I4 = [Ixx4,Ixy4,Ixz4;Iyx4,Iyy4,Iyz4;Izx4,Izy4,Izz4];
I5 = [Ixx5,Ixy5,Ixz5;Iyx5,Iyy5,Iyz5;Izx5,Izy5,Izz5];
I6 = [Ixx6,Ixy6,Ixz6;Iyx6,Iyy6,Iyz6;Izx6,Izy6,Izz6];

% Vectores de Posición a los Centros de Masa

P1_cm1 = [dcx1;dcy1;dcz1];
P2_cm2 = [dcx2;dcy2;dcz2];
P3_cm3 = [dcx3;dcy3;dcz3];
P4_cm4 = [dcx4;dcy4;dcz4];
P5_cm5 = [dcx5;dcy5;dcz5];
P6_cm6 = [dcx6;dcy6;dcz6];

% Energía Cinética

k1=1/2*m1*transpose(v11+cross(w11,P1_cm1))*(v11+cross(w11,P1_cm1))+1/2*transpose(w11)*I1*w11;
k2=1/2*m2*transpose(v22+cross(w22,P2_cm2))*(v22+cross(w22,P2_cm2))+1/2*transpose(w22)*I2*w22;
k3=1/2*m3*transpose(v33+cross(w33,P3_cm3))*(v33+cross(w33,P3_cm3))+1/2*transpose(w33)*I3*w33;
k4=1/2*m4*transpose(v44+cross(w44,P4_cm4))*(v44+cross(w44,P4_cm4))+1/2*transpose(w44)*I4*w44;
k5=1/2*m5*transpose(v55+cross(w55,P5_cm5))*(v55+cross(w55,P5_cm5))+1/2*transpose(w55)*I5*w55;
k6=1/2*m6*transpose(v66+cross(w66,P6_cm6))*(v66+cross(w66,P6_cm6))+1/2*transpose(w66)*I6*w66;

kt=k1+k2+k3+k4+k5+k6;

% Alturas a los Centros de Masa

h1 = subs(S01(3,4),l1,l1+dcz1);
h2 = subs(S02(3,4),l1,l1+dcz2);
h3 = subs(S03(3,4),l2,l2+dcz3);
h4 = subs(S04(3,4),l3,l3+dcz4);
h5 = subs(S05(3,4),l3,l3+dcz5);
h6 = subs(S06(3,4),l4,l4+dcz6);

% Energía Potencial

u1 = m1*g*h1;
u2 = m2*g*h2;
u3 = m3*g*h3;
u4 = m4*g*h4;
u5 = m5*g*h5;
u6 = m6*g*h6;

ut = u1 + u2 + u3 + u4 + u5 +u6;

% Función Lagrangiana

L = kt - ut;

%% Ecuaciones de Movimiento

q   = [q1;q2;q3;q4;q5;q6];
qp  = [q1p;q2p;q3p;q4p;q5p;q6p];
qpp = [q1pp;q2pp;q3pp;q4pp;q5pp;q6pp];

Qp = [qp;qpp];

tic

tau1 = [diff(diff(L,q1p),q1)    diff(diff(L,q1p),q2)    diff(diff(L,q1p),q3)    diff(diff(L,q1p),q4)    diff(diff(L,q1p),q5)    diff(diff(L,q1p),q6)...
        diff(diff(L,q1p),q1p)    diff(diff(L,q1p),q2p)    diff(diff(L,q1p),q3p)    diff(diff(L,q1p),q4p)    diff(diff(L,q1p),q5p)    diff(diff(L,q1p),q6p)]*Qp-diff(L,q1);


tau2 = [diff(diff(L,q2p),q1)    diff(diff(L,q2p),q2)    diff(diff(L,q2p),q3)    diff(diff(L,q2p),q4)    diff(diff(L,q2p),q5)    diff(diff(L,q2p),q6)...
        diff(diff(L,q2p),q1p)    diff(diff(L,q2p),q2p)    diff(diff(L,q2p),q3p)    diff(diff(L,q2p),q4p)    diff(diff(L,q2p),q5p)    diff(diff(L,q2p),q6p)]*Qp-diff(L,q2);


tau3 = [diff(diff(L,q3p),q1)    diff(diff(L,q3p),q2)    diff(diff(L,q3p),q3)    diff(diff(L,q3p),q4)    diff(diff(L,q3p),q5)    diff(diff(L,q3p),q6)...
        diff(diff(L,q3p),q1p)    diff(diff(L,q3p),q2p)    diff(diff(L,q3p),q3p)    diff(diff(L,q3p),q4p)    diff(diff(L,q3p),q5p)    diff(diff(L,q3p),q6p)]*Qp-diff(L,q3);


tau4 = [diff(diff(L,q4p),q1)    diff(diff(L,q4p),q2)    diff(diff(L,q4p),q3)    diff(diff(L,q4p),q4)    diff(diff(L,q4p),q5)    diff(diff(L,q4p),q6)...
        diff(diff(L,q4p),q1p)    diff(diff(L,q4p),q2p)    diff(diff(L,q4p),q3p)    diff(diff(L,q4p),q4p)    diff(diff(L,q4p),q5p)    diff(diff(L,q4p),q6p)]*Qp-diff(L,q4);


tau5 = [diff(diff(L,q5p),q1)    diff(diff(L,q5p),q2)    diff(diff(L,q5p),q3)    diff(diff(L,q5p),q4)    diff(diff(L,q5p),q5)    diff(diff(L,q5p),q6)...
        diff(diff(L,q5p),q1p)    diff(diff(L,q5p),q2p)    diff(diff(L,q5p),q3p)    diff(diff(L,q5p),q4p)    diff(diff(L,q5p),q5p)    diff(diff(L,q5p),q6p)]*Qp-diff(L,q5);


tau6 = [diff(diff(L,q6p),q1)    diff(diff(L,q6p),q2)    diff(diff(L,q6p),q3)    diff(diff(L,q6p),q4)    diff(diff(L,q6p),q5)    diff(diff(L,q6p),q6)...
        diff(diff(L,q6p),q1p)    diff(diff(L,q6p),q2p)    diff(diff(L,q6p),q3p)    diff(diff(L,q6p),q4p)    diff(diff(L,q6p),q5p)    diff(diff(L,q6p),q6p)]*Qp-diff(L,q6);

toc


% Matriz de Inercia M

tic 

M = [diff(tau1,q1pp),diff(tau1,q2pp),diff(tau1,q3pp),diff(tau1,q4pp),diff(tau1,q5pp),diff(tau1,q6pp);...
     diff(tau2,q1pp),diff(tau2,q2pp),diff(tau2,q3pp),diff(tau2,q4pp),diff(tau2,q5pp),diff(tau2,q6pp);...
     diff(tau3,q1pp),diff(tau3,q2pp),diff(tau3,q3pp),diff(tau3,q4pp),diff(tau3,q5pp),diff(tau3,q6pp);...
     diff(tau4,q1pp),diff(tau4,q2pp),diff(tau4,q3pp),diff(tau4,q4pp),diff(tau4,q5pp),diff(tau4,q6pp);...
     diff(tau5,q1pp),diff(tau5,q2pp),diff(tau5,q3pp),diff(tau5,q4pp),diff(tau5,q5pp),diff(tau5,q6pp);...
     diff(tau6,q1pp),diff(tau6,q2pp),diff(tau6,q3pp),diff(tau6,q4pp),diff(tau6,q5pp),diff(tau6,q6pp)];

toc

% Vector de Fuerzas Gravitacionales G

tic

g1 = subs(tau1,[transpose(qp),transpose(qpp)],zeros(1,12));
g2 = subs(tau2,[transpose(qp),transpose(qpp)],zeros(1,12));
g3 = subs(tau3,[transpose(qp),transpose(qpp)],zeros(1,12));
g4 = subs(tau4,[transpose(qp),transpose(qpp)],zeros(1,12));
g5 = subs(tau5,[transpose(qp),transpose(qpp)],zeros(1,12));
g6 = subs(tau6,[transpose(qp),transpose(qpp)],zeros(1,12));

toc

G = [g1;g2;g3;g4;g5;g6];

% Matriz de Coriolis

tic 

Mp = diff_matrix(M,qp,q);
KE = 1/2*transpose(qp)*M*qp;
dKE = [diff(KE,q1);diff(KE,q2);diff(KE,q3);diff(KE,q4);diff(KE,q5);diff(KE,q6)];

C = Mp*qp-dKE;

toc

% Evaluación las matrices

ABB1100_Parametros
tic

Me = eval(M);
Ce = eval(C);
Ge = eval(G);

toc

%% Fuerza Externa

syms Fx07 Fy07 Fz07

F = [Fx07; Fy07; Fz07];

R07 = R01*R12*R23*R34*R45*R56*R67;

v07 = R07*v77;
w07 = R07*w77;

J07 = [diff(v07(1),q1p) diff(v07(1),q2p) diff(v07(1),q3p) diff(v07(1),q4p) diff(v07(1),q5p) diff(v07(1),q6p);...
       diff(v07(2),q1p) diff(v07(2),q2p) diff(v07(2),q3p) diff(v07(2),q4p) diff(v07(2),q5p) diff(v07(2),q6p);...
       diff(v07(3),q1p) diff(v07(3),q2p) diff(v07(3),q3p) diff(v07(3),q4p) diff(v07(3),q5p) diff(v07(3),q6p)];

Fext = transpose(J07)*F;

Fe = eval(Fext);

% Guardado de variables en archivos .m

fid = fopen("Me_P2_v3.m","wt");
fprintf(fid,"%s\n",char(Me));
fclose(fid);

fid = fopen("Ge_P2_v3.m","wt");
fprintf(fid,"%s\n",char(Ge));
fclose(fid);

fid = fopen("Ce_P2_v3.m","wt");
fprintf(fid,"%s\n",char(Ce));
fclose(fid);

fid = fopen("Fe_P2_v3.m","wt");
fprintf(fid,"%s\n",char(Fe));
fclose(fid);

save("DinamicaDirecta_v3.mat","Fext","Fe","J07","Me","Ge","Ce","Fe","M","G","C","-mat")

%% Exterior Force
clc; 

filename = 'Fe_P2_v3.m';
s_filename = 'Fe_P2_v3_s.m';
ss_filename = 'Fe_P2_v3_ss.m';
sss_filename = 'Fe_P2_v3_sss.m';
ssss_filename = 'Fe_P2_v3_ssss.m';

S = fileread(filename);

S = regexprep(S, 'cos\(pi/2\)','0');
S = regexprep(S, 'cos\(pi\)','-1');
S = regexprep(S, 'sin\(pi/2\)','1');
S = regexprep(S, 'sin\(pi\)','0');

S = ['FeS_P2_s = ',S,';'];
S = ['syms q1 q2 q3 q4 q5 q6 q1p q2p q3p q4p q5p q6p Fx07 Fy07 Fz07', newline, S];
S = ['g = 9.81; pi = 3.1416; l1 = .327; l2 = .290; l3 = .300; l4 = .064;', newline, S ,newline];

fid = fopen(s_filename, 'w');
fwrite(fid, S);
fclose(fid);

run(s_filename)

fid = fopen(ss_filename, 'wt');
fprintf(fid, '%s\n', char(FeS_P2_s));
fclose(fid);

FeS_P2_sss = simplify(FeS_P2_s);

fid = fopen(sss_filename, 'wt');
fprintf(fid, '%s\n', char(FeS_P2_sss));
fclose(fid);

FeS_P2_ssss = vpa(FeS_P2_sss,4);

fid = fopen(ssss_filename, 'wt');
fprintf(fid, '%s\n', char(FeS_P2_ssss));
fclose(fid);

%% Gravitational Matrix
clc; 

filename = 'Ge_P2_v3.m';
s_filename = 'Ge_P2_v3_s.m';
ss_filename = 'Ge_P2_v3_ss.m';
sss_filename = 'Ge_P2_v3_sss.m';
ssss_filename = 'Ge_P2_v3_ssss.m';

S = fileread(filename);

S = regexprep(S, 'cos\(pi/2\)','0');
S = regexprep(S, 'cos\(pi\)','-1');
S = regexprep(S, 'sin\(pi/2\)','1');
S = regexprep(S, 'sin\(pi\)','0');

S = ['GeS_P2_s = ',S,';'];
S = ['syms q1 q2 q3 q4 q5 q6 q1p q2p q3p q4p q5p q6p Fx07 Fy07 Fz07', newline, S];
S = ['g = 9.81; pi = 3.1416; l1 = .327; l2 = .290; l3 = .300; l4 = .064;', newline, S ,newline];

fid = fopen(s_filename, 'w');
fwrite(fid, S);
fclose(fid);

run(s_filename)

fid = fopen(ss_filename, 'wt');
fprintf(fid, '%s\n', char(GeS_P2_s));
fclose(fid);

GeS_P2_sss = simplify(GeS_P2_s);

fid = fopen(sss_filename, 'wt');
fprintf(fid, '%s\n', char(GeS_P2_sss));
fclose(fid);

GeS_P2_ssss = vpa(GeS_P2_sss,4);

fid = fopen(ssss_filename, 'wt');
fprintf(fid, '%s\n', char(GeS_P2_ssss));
fclose(fid);
%% Inertial Matrix
clc; 

filename = 'Me_P2_v3.m';
s_filename = 'Me_P2_v3_s.m';
ss_filename = 'Me_P2_v3_ss.m';
sss_filename = 'Me_P2_v3_sss.m';
ssss_filename = 'Me_P2_v3_ssss.m';

S = fileread(filename);

S = regexprep(S, 'cos\(pi/2\)','0');
S = regexprep(S, 'cos\(pi\)','-1');
S = regexprep(S, 'sin\(pi/2\)','1');
S = regexprep(S, 'sin\(pi\)','0');

S = ['MeS_P2_s = ',S,';'];
S = ['syms q1 q2 q3 q4 q5 q6 q1p q2p q3p q4p q5p q6p Fx07 Fy07 Fz07', newline, S];
S = ['g = 9.81; pi = 3.1416; l1 = .327; l2 = .290; l3 = .300; l4 = .064;', newline, S ,newline];

fid = fopen(s_filename, 'w');
fwrite(fid, S);
fclose(fid);

run(s_filename)

fid = fopen(ss_filename, 'wt');
fprintf(fid, '%s\n', char(MeS_P2_s));
fclose(fid);

MeS_P2_sss = simplify(MeS_P2_s);

fid = fopen(sss_filename, 'wt');
fprintf(fid, '%s\n', char(MeS_P2_sss));
fclose(fid);

MeS_P2_ssss = vpa(MeS_P2_sss,4);

fid = fopen(ssss_filename, 'wt');
fprintf(fid, '%s\n', char(MeS_P2_ssss));
fclose(fid);

%% Coriolis Matrix

clc; 

filename = 'Ce_P2_v3.m';
s_filename = 'Ce_P2_v3_s.m';
ss_filename = 'Ce_P2_v3_ss.m';
sss_filename = 'Ce_P2_v3_sss.m';
ssss_filename = 'Ce_P2_v3_ssss.m';

S = fileread(filename);

S = regexprep(S, 'cos\(pi/2\)','0');
S = regexprep(S, 'cos\(pi\)','-1');
S = regexprep(S, 'sin\(pi/2\)','1');
S = regexprep(S, 'sin\(pi\)','0');

S = ['CeS_P2_s = ',S,';'];
S = ['syms q1 q2 q3 q4 q5 q6 q1p q2p q3p q4p q5p q6p Fx07 Fy07 Fz07', newline, S];
S = ['g = 9.81; pi = 3.1416; l1 = .327; l2 = .290; l3 = .300; l4 = .064;', newline, S ,newline];

fid = fopen(s_filename, 'w');
fwrite(fid, S);
fclose(fid);

run(s_filename)

fid = fopen(ss_filename, 'wt');
fprintf(fid, '%s\n', char(CeS_P2_s));
fclose(fid);

CeS_P2_sss = simplify(CeS_P2_s);

fid = fopen(sss_filename, 'wt');
fprintf(fid, '%s\n', char(CeS_P2_sss));
fclose(fid);

CeS_P2_ssss = vpa(CeS_P2_sss,4);

fid = fopen(ssss_filename, 'wt');
fprintf(fid, '%s\n', char(CeS_P2_ssss));
fclose(fid);

clearvars -except Ce Fe Ge Me CeS_P2_s CeS_P2_sss CeS_P2_ssss MeS_P2_s MeS_P2_sss MeS_P2_ssss GeS_P2_s GeS_P2_sss GeS_P2_ssss FeS_P2_s FeS_P2_sss FeS_P2_ssss 

%% Comprobaciones
%{
q1 = 1; q2 = 1; q3 = 1; q4 = 1; q5 = 1; q6 = 1;
q1p = 0; q2p = 0; q3p = 0; q4p = 0; q5p = 0; q6p = 0;
tau1 = 0; tau2 = 0; tau3 = 0; tau4 = 0; tau5 = 0; tau6 = 0; 
friccion = [0;0;0;0;0;0];
Fx07 = 1;
Fy07 = 1;
Fz07 = 1;
pi = 3.1416;

eval(FeS_P2_s)
eval(FeS_P2_sss)
eval(FeS_P2_ssss)

%% Comprobación de Funciones

ABB1100_DinamicaDirecta_3(0,-pi,pi/2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
%}