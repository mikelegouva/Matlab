%This code was designed by Michail Gouvalaris on January 06th 2024.
%It is intended for academic use at the Dept. of Informatics and Telecommunication of University of Ioannina.


%This code was designed and compiled at Matlab R2023a (9.14.0.2206163)

%The code generates a centered sinusoidal signal with added noise, designs and applies bandpass filters of varying orders (4, 6, 8, 10, 12, 16) to the signal within a specified frequency range (0.5 Hz to 60 Hz), and then plots the original centered signal along with the filtered signals for each filter order.

% Define parameters
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:5; % Time vector (5 seconds)

% Create original signal
original_signal = sin(2*pi*10*t) + randn(size(t));

% Center the signal
centered_signal = original_signal - mean(original_signal);

% Frequency range for bandpass filters
f_low = 0.5;
f_high = 60;

% Different filter orders
filter_orders = [4, 6, 8, 10, 12, 16];

% Create and apply bandpass filters
for order = filter_orders
    % Create filter
    filter_name = sprintf('filter_%.2f_%.2f_%d', f_low, f_high, order);
    
    % Design bandpass filter using 'fdesign.bandpass'
    bandpass_spec = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', 0.4, 0.5, 60, 60.5, 60, 1, 60, fs);
    bandpass_filter = design(bandpass_spec, 'FIR', 'SystemObject', true, 'FilterOrder', order);
    
    % Apply filter to centered signal
    filtered_signal = filter(bandpass_filter, centered_signal);

    % Save filter coefficients
    save(filter_name, 'bandpass_filter');

    % Display original and filtered signals
    figure;
    subplot(2, 1, 1);
    plot(t, centered_signal, 'b', 'LineWidth', 1.5);
    title('Original Centered Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');

    subplot(2, 1, 2);
    plot(t, filtered_signal, 'r', 'LineWidth', 1.5);
    title(['Filtered Signal (Order = ' num2str(order) ')']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    sgtitle(['Bandpass Filter: ' filter_name]);
end
