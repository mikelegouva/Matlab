%This code was designed by Michail Gouvalaris on January 06th 2024.
%It is intended for academic use at the Dept. of Informatics and Telecommunication of University of Ioannina.


%This code was designed and compiled at Matlab R2023a (9.14.0.2206163)


%The code generates a plot of two mathematical functions (2𝑥^2 and 3𝑥^3) using MATLAB. 
%It sets up the x-axis range, plots the functions with different line styles and colors on the same graph, labels the axes, adds a title, legend, sets axis limits, displays a grid, and ensures future plots don't overlay on the same figure.


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
