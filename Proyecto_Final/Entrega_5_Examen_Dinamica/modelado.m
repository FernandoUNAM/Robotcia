%% Modelado Dinámico de Robot 2GDL

clear all;close all; clc;

syms l1 l2 q1 q2 

% Modelo Denavith Hartenberg

S01 = DHC(0,0,q1,0);
S12 = DHC(0,l1,q2,0);
S23 = DHC(0,l2,0,0);

% Cinemática Directa

S02 = S01*S12;
S03 = S01*S12*S23;

% Submatriz Rotacional

R01 = S01(1:3,1:3);
R12 = S12(1:3,1:3);
R23 = S23(1:3,1:3);

% Submatriz Traslacional

P01 = S01(1:3,4);
P12 = S12(1:3,4);
P23 = S23(1:3,4);

% Propagación de Velocidades 

syms q1p q2p

Z = [0;0;1];

% Velocidad Lineal y Rotacional de sistema 0 visto desde 0
v00 = [0;0;0];
w00 = [0;0;0];

% Velocidad Lineal y Rotacional de sistema 1 visto desde 1
v11 = transpose(R01)*(v00+cross(w00,P01));
w11 = transpose(R01)*w00+q1p*Z;

% Velocidad Lineal y Rotacional de sistema 2 visto desde 2
v22 = transpose(R12)*(v11+cross(w11,P12));
w22 = transpose(R12)*w11+q2p*Z;

% Velocidad Lineal y Rotacional de sistema 3 visto desde 3
v33 = transpose(R23)*(v22+cross(w22,P23));
w33 = transpose(R23)*w22+0*Z;

% Cálculo del Modelo Dinámico

syms q1pp q2pp m1 m2 I1 I2 g

% Definición de la Energía Cinética
% Queremos que esa velocidad nos lleve al centro de M1
% Producto cruz de una velocidad angular y un vector de posición da por
% resultado una velocidad lineal (Velocidad de velocidad 1 vista desde 1 y
% se le suma la distancia hacia el centro de masa. Siendo la mitad tomando
% en cuenta una densidad uniforme

% Vectores de Posición a los centros de masa
P1_cm1 = (P12/2)
P2_cm2 = (P23/2)
    
% Velocidades al Cuadrado (Escalar) -> Rapidez
%   Velocidad al cuadrado por medio de la Transpuesta
v1 = transpose(v11+cross(w11,P1_cm1))*(v11+cross(w11,P1_cm1))
v2 = transpose(v22+cross(w22,P2_cm2))*(v22+cross(w22,P2_cm2))
    
% Energía Cinética Traslacional Eslabones 1 y2
k1t = (1/2)*m1*v1
k2t = (1/2)*m2*v2


% Energía Cinética Rotacional Eslabones 1 y 2

k1r = (1/2)*transpose(w11)*I1*w11;
k2r = (1/2)*transpose(w22)*I2*w22;

% Energía Cinética Total Eslabones 1 y 2
%k1 = k1t + k1r
% Otra forma de Escribirlo
k1 = 1/2*m1*transpose(v11+cross(w11,P1_cm1))*(v11+cross(w11,P1_cm1))+1/2*transpose(w11)*I1*w11

%k2 = k2t + k2r
% Otra Forma de Escribirlo
k2 = 1/2*m2*transpose(v22+cross(w22,P2_cm2))*(v22+cross(w22,P2_cm2))+1/2*transpose(w22)*I2*w22

% Energía Cinética Total 
kt = k1 + k2;
% kt2 = k11 + k22;

% Energía Potenciál

% Alturas a los centros de masa
H1_cm1 = subs(S02(2,4),l1,l1/2)
H2_cm2 = subs(S03(2,4),l2,l2/2)

% Energía Potencial 
u1 = m1*g*H1_cm1
u2 = m2*g*H2_cm2

ut = u1 + u2;

% Energía Total del Robot

E = kt + ut

% Función Lagrangiana

L = kt - ut

% Dinámica Inversa
% Ecuaciones de Movimiento
% Vector Auxiliar que ayudará a encontrar la derivada Velocidades y Aceleraciones
Qp = [q1p;q2p;q1pp;q2pp]

tau1 = [diff(diff(L,q1p),q1) diff(diff(L,q1p),q2)...
        diff(diff(L,q1p),q1p) diff(diff(L,q1p),q2p)]*Qp-diff(L,q1)

tau2 = [diff(diff(L,q2p),q1) diff(diff(L,q2p),q2)...
        diff(diff(L,q2p),q1p) diff(diff(L,q2p),q2p)]*Qp-diff(L,q2)

% Si en la ecuación 2 no aparece la masa 1, al motor 2 no le afecta la de
% la masa 1. Aunque si debería con el coriolis

% Expresar el modelo en Forma Matricial 

% Expresión General
% M(Q)*qpp + C(q,qp)*qp + G(q) = Tau
% Todo se evalua con q y qp que viene de la trayectoria, viniendo del
% Espacio cartesiano mapeado en el espacio articular y nos dá un torque

% Matriz de nxn (2x2) cuadrada, positiva, simétrica, se puede invertir
% Matriz de Masas

M = [diff(tau1,q1pp),diff(tau1,q2pp);...
     diff(tau2,q1pp),diff(tau2,q2pp)]

% Vector de Fuerzas Gravitacionales Gnx1

g1 = subs(tau1,[q1pp,q2pp,q1p,q2p],[0,0,0,0])
g2 = subs(tau2,[q1pp,q2pp,q1p,q2p],[0,0,0,0])

G = [g1;g2]

% Matriz Centrífuga y de Coriolis
%   Cálculo de C(q,qp)qp
%   Mp(q)qp - 1/2*diff(transpose(qp)*M*qp

q = [q1;q2];
qp = [q1p;q2p];
qpp = [q1pp;q2pp];

Mp = diff_matrix(M,qp,q)

% Energía Cinética
KE = 1/2*transpose(qp)*M*qp

% Parcial de posición 
dKE = [diff(KE,q1); diff(KE,q2)]

% Vector C
C = Mp*qp - dKE

% Modelo Matricial Completo

M*qpp+C+G;

% Evaluación de Matrices
parametros

Me = eval(M)
Ce = eval(C)
Ge = eval(G)

%% Dinámica directa 

% Expresión General
% M(Q)*qpp + C(q,qp)*qp + G(q) = Tau + transpose(J(q)) * Fext

% Se despeja qpp y debe ser cuadrada y positiva
% qpp = inv(M)*(Tau - C(q,qp)*qp + G(q))

% M(Q)*qpp + C(q,qp)*qp + G(q) = Tau + f

%Fuerza externa
syms fx03 fy03

F=[fx03;fy03];

R03=R01*R12*R23;

v03=R03*v33;
w03=R03*w33;

J03=[diff(v03(1),q1p) diff(v03(1),q2p);
     diff(v03(2),q1p)  diff(v03(2),q2p)];

Fext=transpose(J03)*F

parametros

Fext = eval(simplify(Fext))

%% Condiciones Iniciales

% Posición Inicial de Articulaciones
q0 = [-pi/2;0];

% Torque Inicial en Articulaciones
tau_inicial = [0;0];

% Fuerza Externa Inicial en Articulaciones
fx07_init = 0;
fy07_init = 0;

% Coeficientes de Fricción
f = [0;0];

%% Comportamiento Obtenido

sim_q1 = out.q_sim.Data(:,1);
sim_q2 = out.q_sim.Data(:,2);

q1 = sim_q1';
q2 = sim_q2';

sim_Time = out.q_sim.Time;

close

for i = 1:1:(length(sim_Time))
    clf
    robot(q1(i),q2(i))
    pause(0.001)
end

%% Comportamiento Deseado
close
c = 0;
for i = 1:1:360
    c = (i-1)/10;
    d = deg2rad((i-1));
    clf
    ref(:,i) = referencia(d);
    robot(ref(1,i),ref(2,i))
    pause(0.001)
end

refg = rad2deg(ref);