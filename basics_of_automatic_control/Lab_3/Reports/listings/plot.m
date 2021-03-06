Time = result.time;
Values_2 = result.signals.values;
set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(Time, Values_2, 'r', 'LineWidth', 2);
title('$Graph$ $of$ $signal$ $y(t)$');
xlabel('$t$, s');
ylabel('$y$');
legend('   y(t)');
grid on;
