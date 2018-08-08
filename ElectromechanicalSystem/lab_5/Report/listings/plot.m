	close all; clear all; clc;
	open('Simulink');
	sim('Simulink');
	Time = result.time;
	Values_1 = result.signals(1).values;
	Values_2 = result.signals(2).values;
	set(0, 'DefaultTextInterpreter', 'latex');
	set(0,'DefaultAxesFontSize',20,'DefaultAxesFontName','Times New Roman');
	set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman');
	figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
	plot(Time, Values_1, 'r', 'LineWidth', 2);
	hold on;
	plot(Time, Values_2, 'b', 'LineWidth', 2);
	title('$Graph$ $of$ $signals$ $u(t)$ $and$ $y(t)$');
	xlabel('$t$, s');
	ylabel('$y$ $u$');
	legend('   u(t)', '   y(t)');
	grid on;
