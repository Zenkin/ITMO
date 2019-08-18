amperageTime = i40minus.time;
amperageValues = i40minus.signals.values;
angVelTime = angVel40minus.time;
angVelValues = angVel40minus.signals.values;

amperageTime40 = i40plus.time;
amperageValues40 = i40plus.signals.values;
angVelTime40 = angVel40plus.time;
angVelValues40 = angVel40plus.signals.values;

set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');

graph_1 = figure('Name','angVel','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(angVelTime, angVelValues, 'r--', 'LineWidth', 2);
hold on;
plot(angVelTime40, angVelValues40, 'r', 'LineWidth', 2);
title('$Graph$ $\omega$(t)');
xlabel('$t$, s');
ylabel('$\omega, rad/s$');
legend('J_m = 0.78 kg*m^2','J_m = 1.68 kg*m^2');
grid on;

graph_2 = figure('Name','Amperage','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(amperageTime, amperageValues, 'r', 'LineWidth', 2);
title('$Graph$ I(t)');
xlabel('$t$, s');
ylabel('$I, A$');
legend('   I(t)');
grid on;