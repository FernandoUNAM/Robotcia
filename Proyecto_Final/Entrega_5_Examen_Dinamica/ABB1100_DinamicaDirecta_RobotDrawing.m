%% Comportamiento Obtenido

sim_q1 = out.q_sim.Data(:,1);
sim_q2 = out.q_sim.Data(:,2);
sim_q3 = out.q_sim.Data(:,3);
sim_q4 = out.q_sim.Data(:,4);
sim_q5 = out.q_sim.Data(:,5);
sim_q6 = out.q_sim.Data(:,6);

q1s = sim_q1';
q2s = sim_q2';
q3s = sim_q3';
q4s = sim_q4';
q5s = sim_q5';
q6s = sim_q6';

sim_Time = out.q_sim.Time;

for i = 1:1:(length(sim_Time))
    clf
    ABB1100_RobotDrawing(q1s(i),q2s(i),q3s(i),q4s(i),q5s(i),q6s(i))
    pause(0.01)
    %exportgraphics(gcf,'ABB1100_Simulacion_Dinamica_0F_P0.gif','Append',true);
end