%The code below is free to use.
%The code below is part of a project for my university Dit|UOI
%Code by Michail Gouvalaris


% Define the range for x
x = linspace(-5, 5, 100);

% Define the functions
y1 = 2 * x.^2;
y2 = 3 * x.^3;

% Plot the functions on the same graph
figure;
plot(x, y1, 'b-', 'LineWidth', 2);  % Blue color, continuous line
hold on;
plot(x, y2, 'r--', 'LineWidth', 2);  % Red color, dotted line

% Label the axes and add a title
xlabel('x');
ylabel('Platos');
title('Grafiki apeikonisi ton sinartiseon 2𝑥^2 kai 3𝑥^3');

% Add a legend
legend('2𝑥^2', '3𝑥^3');

% Set the axis limits
xlim([-5, 5]);

% Display the grid
grid on;

% Hold off to stop overlaying future plots on the same figure
hold off;
