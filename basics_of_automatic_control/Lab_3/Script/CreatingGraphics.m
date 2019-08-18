Time = result.time;
Values_1 = result.signals(1).values;

Time_1 = result_1.time;
Values_2 = result_1.signals(1).values;

Time_2 = result_2.time;
Values_3 = result_2.signals(1).values;
set(0, 'DefaultTextInterpreter', 'latex');
set(0,'DefaultAxesFontSize', 20,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize', 20,'DefaultTextFontName','Times New Roman');
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
plot(Time_1, Values_2, 'r', 'LineWidth', 2);
grid on;