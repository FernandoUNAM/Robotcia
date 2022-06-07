function Tau = ABB1100_Control_PDG(q1d,q2d,q3d,q4d,q5d,q6d,q1,q2,q3,q4,q5,q6,q1p,q2p,q3p,q4p,q5p,q6p)

% Error de Posición 6x1
qe = [q1d-q1;
      q2d-q2;
      q3d-q3;
      q4d-q4;
      q5d-q5;
      q6d-q6];

% Matriz de Torque Gravitacional

MG = [0; 15.77*sin(q2 + q3 + 1.571) + 23.29*cos(q2 + 1.571); 15.77*sin(q2 + q3 + 1.571); 0; 0; 0];

% Vector de Velocidades 6x1

qp = [q1p;q2p;q3p;q4p;q5p;q6p];

% Vector de Ganancias de Posición (Proporcional)

kp = 1*diag([1 1 1 1 1 1]);

% Vector de Ganancias de Velocidades (Proporcional)

kv = 0.5*diag([1 1 1 1 1 1]);

Tau = kp*qe - kv*qp + MG;

end