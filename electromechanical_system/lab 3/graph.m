%Скорость 2 фазного

% Time = result.time;
% Values_1 = result.signals(1).values;
% set(0, 'DefaultTextInterpreter', 'latex');
% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
% set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
% figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
% plot(Time, Values_1, 'r', 'LineWidth', 2);
% hold on;
% xlabel('$t$, s');
% ylabel('$\omega$, rad/s');
% legend('   \omega(t)');
% grid on;

% Токи двухфазного

% Time = tok.time;
% Values_1 = tok.signals(1).values;
% Values_2 = tok.signals(2).values;
% set(0, 'DefaultTextInterpreter', 'latex');
% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
% set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
% figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
% plot(Time, Values_1, 'r', 'LineWidth', 2);
% hold on;
% plot(Time, Values_2, 'b--', 'LineWidth', 2);
% xlabel('$t$, s');
% ylabel('$I$, A');
% legend('   I_1', '   I_2');
% grid on;

% Мех. характеристика

% M = [ 0 0.16 0.2 0.3 0.45 0.484]
% omega = [ 137.5 91 80 51 10 0]
% set(0, 'DefaultTextInterpreter', 'latex');
% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
% set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
% figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
% plot(M, omega, 'r', 'LineWidth', 2);
% hold on;
% xlabel('М, Nm');
% ylabel('$\omega$, rad/s');
% legend('   \omega(M)');
% grid on;

% Рег. характеристика

% U = [0 10 20 27 30]
% omega_2 = [0 50.25 101.5 138.4 154.5]
% set(0, 'DefaultTextInterpreter', 'latex');
% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
% set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
% figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
% plot(U, omega_2, 'r', 'LineWidth', 2);
% hold on;
% xlabel('U, B');
% ylabel('$\omega$, rad/s');
% legend('   \omega(U)');
% grid on;

% Скорость трехфазного

Time = result_2.time;
Values_3 = result_2.signals(1).values;
set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(Time, Values_3, 'r', 'LineWidth', 2);
hold on;
xlabel('$t$, s');
ylabel('$\omega$, rad/s');
legend('   \omega(t)');
grid on;

% Токи трехфазного

% Time_3 = tok_2.time;
% Values_4 = tok_2.signals(1).values;
% Values_5 = tok_2.signals(2).values;
% Values_6 = tok_2.signals(3).values;
% set(0, 'DefaultTextInterpreter', 'latex');
% set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
% set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
% figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
% plot(Time_3, Values_4, 'r', 'LineWidth', 2);
% hold on;
% plot(Time_3, Values_5, 'b--', 'LineWidth', 2);
% plot(Time_3, Values_6, 'b:', 'LineWidth', 2);
% xlabel('$t$, s');
% ylabel('$I$, A');
% legend('   I_1', '   I_2','   I_3');
% grid on;
