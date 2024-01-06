%This code was designed by Michail Gouvalaris on January 06th 2024.
%It is intended for academic use at the Dept. of Informatics and Telecommunication of University of Ioannina.


%This code was designed and compiled at Matlab R2023a (9.14.0.2206163)


%The code generates a figure with two subplots, each showing a plot of a mathematical function. 
%The first subplot displays the graph of y = sin(5x), and the second subplot shows the graph of y = cos(10x). 
%The overall figure has a super title indicating the functions being plotted.

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
