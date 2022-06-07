function Tau = ABB1100_Control_PD(q1d,q2d,q3d,q4d,q5d,q6d,q1,q2,q3,q4,q5,q6,q1p,q2p,q3p,q4p,q5p,q6p)

% Error de Posición 6x1
qe = [q1d-q1;
      q2d-q2;
      q3d-q3;
      q4d-q4;
      q5d-q5;
      q6d-q6];

% Vector de Velocidades 6x1

qp = [q1p;q2p;q3p;q4p;q5p;q6p];

% Vector de Ganancias de Posición (Proporcional)

kp = 50*diag([1 1 1 1 1 1]);

% Vector de Ganancias de Velocidades (Proporcional)

kv = 25*diag([1 1 1 1 1 1]);

Tau = kp*qe - kv*qp;

end