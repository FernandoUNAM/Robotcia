figure(2)
simulacion5_Articular = figure(2);
simulacion5.Position(1:4) = [0 720 1440 720];
simulacion5_Articular.Name = "Robot: ABB1100 4 580 - Espacio Articular";
clf

% Posición en el Espacio Articular

Time_col = Time';

q_row = [q1;q2;q3;q4;q5;q6];
qp_row = [q1p;q2p;q3p;q4p;q5p;q6p];
qpp_row = [q1pp;q2pp;q3pp;q4pp;q5pp;q6pp];

q_row_deg = rad2deg(q_row);
qp_row_deg = rad2deg(qp_row);
qpp_row_deg = rad2deg(qpp_row);

subplot(1,3,1)

plot(Time2,q1,"r")
hold on
plot(Time2,q2,"g")
hold on
plot(Time2,q3,"b")
hold on
plot(Time2,q4,"r")
hold on
plot(Time2,q5,"g")
hold on
plot(Time2,q6,"b")
grid on

title('Posición en el Espacio de Juntas')
xlabel('Tiempo[s]')
ylabel('Orientación[deg]')
legend('q1','q2','q3','q4','q5','q6')


% Velocidad en el Espacio Articular

subplot(1,3,2)
plot(Time2,qp_row_deg(1,:),"r*")
hold on
plot(Time2,qp_row_deg(2,:),"g*")
hold on
plot(Time2,qp_row_deg(3,:),"b*")
hold on
plot(Time2,qp_row_deg(4,:),"r")
hold on
plot(Time2,qp_row_deg(5,:),"g")
hold on
plot(Time2,qp_row_deg(6,:),"b")
grid on
title('Velocidad en el Espacio de Juntas')
xlabel('Tiempo[s]')
ylabel('Velocidad Angular [deg/s]')
legend('q1\prime','q2\prime','q3\prime','q4\prime','q5\prime','q6\prime')


% Aceleración en el Espacio Articular

subplot(1,3,3)

%%

plot(1:1:374,q1pp,"r*")
hold on
plot(1:1:374,q2pp,"g*")
hold on
plot(1:1:374,q3pp,"b*")
hold on
plot(1:1:374,q4pp,"r")
hold on
plot(1:1:374,q5pp,"g")
hold on
plot(1:1:374,q6pp,"b")
grid on

title('Aceleración en el Espacio de Juntas')
xlabel('Tiempo[s]')
ylabel('Aceleración Angular [deg/s^2]')
legend('q1pp','q2pp','q3pp','q4pp','q5pp','q6pp')


GraphsPlottingTime = toc;

Message1 = sprintf("El Tiempo de Ejecución del Perfil Quántico fue de %.4f segundos",ProfileTime);
Message2 = sprintf("El Tiempo del Dibujo de Robot tomó %.4f segundos",RobotDrawingTime);
Message3 = sprintf("El Tiempo de Graficación de los Puntos fue %.4f segundos",GraphsPlottingTime);

disp(Message1);
disp(Message2);
disp(Message3);

