%The code below is free to use.
%The code below is part of a project for my university Dit|UOI
%Code by Michail Gouvalaris

% Define the range for x
x = linspace(0, 2*pi, 1000);

% Calculate the functions
y1 = sin(5*x);
y2 = cos(10*x);

% Plot the functions in separate subplots
subplot(2,1,1);
plot(x, y1, 'b-', 'LineWidth', 2);
title('sin(5x)');
xlabel('x');
ylabel('y');
xlim([0, 2*pi]);
ylim([-1, 1]);
grid on;

subplot(2,1,2);
plot(x, y2, 'r-', 'LineWidth', 2);
title('cos(10x)');
xlabel('x');
ylabel('y');
xlim([0, 2*pi]);
ylim([-1, 1]);
grid on;

% Adjust the overall title for the entire figure
sgtitle('Plot of sin(5x) and cos(10x)');
