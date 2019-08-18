Time = speed.time;
sp = speed.signals.values(1);

set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);

plot(Time, sp, 'g', 'LineWidth', 2);

xlabel('$t$, s');
ylabel("/omega(t)");
legend("   /omega(t)");
grid on;

