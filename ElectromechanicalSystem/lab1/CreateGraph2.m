amperageTime = i.time;
amperageValues = i.signals.values;
voltageTime = u.time;
voltageValues = u.signals.values;
angVelTime = angVel.time;
angVelValues = angVel.signals.values;
accelTime = accel.time;
accelValues = accel.signals.values;

amperageTime100 = i100.time;
amperageValues100 = i100.signals.values;
voltageTime100 = u100.time;
voltageValues100 = u100.signals.values;
angVelTime100 = angVel100.time;
angVelValues100 = angVel100.signals.values;
accelTime100 = accel100.time;
accelValues100 = accel100.signals.values;

amperageTime150 = i150.time;
amperageValues150 = i150.signals.values;
voltageTime150 = u150.time;
voltageValues150 = u150.signals.values;
angVelTime150 = angVel150.time;
angVelValues150 = angVel150.signals.values;
accelTime150 = accel150.time;
accelValues150 = accel150.signals.values;

amperageTime200 = i200.time;
amperageValues200 = i200.signals.values;
voltageTime200 = u200.time;
voltageValues200 = u200.signals.values;
angVelTime200 = angVel200.time;
angVelValues200 = angVel200.signals.values;
accelTime200 = accel200.time;
accelValues200 = accel200.signals.values;

set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');

graph_1 = figure('Name','Voltage','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(voltageTime100, voltageValues100, 'r', 'LineWidth', 1);
hold on;
plot(voltageTime150, voltageValues150, 'g--', 'LineWidth', 4);
hold on;
plot(voltageTime200, voltageValues200, 'b:', 'LineWidth', 3);
title('$Graph$ $U(t)$');
xlabel('$t$, s');
ylabel('$U$ , B');
legend('M_{MC}=100','M_{MC}=150','M_{MC}=200');

graph_2 = figure('Name','Amperage','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(amperageTime100, amperageValues100, 'r', 'LineWidth', 2);
hold on;
plot(amperageTime150, amperageValues150, 'g', 'LineWidth', 2);
hold on;
plot(amperageTime200, amperageValues200, 'b', 'LineWidth', 2);
title('$Graph$ $I(t)$');
xlabel('$t$, s');
ylabel('$I$ , B');
legend('M_{MC}=100','M_{MC}=150','M_{MC}=200');

graph_3 = figure('Name','AngularVelocity','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(angVelTime100, angVelValues100, 'r', 'LineWidth', 2);
hold on;
plot(angVelTime150, angVelValues150, 'g', 'LineWidth', 2);
hold on;
plot(angVelTime200, angVelValues200, 'b', 'LineWidth', 2);
title('$Graph$ $\omega(t)$');
xlabel('$t$, s');
ylabel('$\omega$ , rad/s');
legend('M_{MC}=100','M_{MC}=150','M_{MC}=200');

graph_4 = figure('Name','Angle','NumberTitle','off','Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(accelTime100, accelValues100, 'r', 'LineWidth', 2);
hold on;
plot(accelTime150, accelValues150, 'g', 'LineWidth', 2);
hold on;
plot(accelTime200, accelValues200, 'b', 'LineWidth', 2);
title('$Graph$ $\alpha(t)$');
xlabel('$t$, s');
ylabel('$\alpha$ , rad');
legend('M_{MC}=100','M_{MC}=150','M_{MC}=200');

grid on;