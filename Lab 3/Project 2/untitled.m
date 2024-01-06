%This code was designed by Michail Gouvalaris on January 06th 2024.
%It is intended for academic use at the Dept. of Informatics and Telecommunication of University of Ioannina.


%This code was designed and compiled at Matlab R2023a (9.14.0.2206163)

%The code loads a dataset from 'O001.txt', removes DC component, applies bandpass and low-pass filters, and then plots the original signal, signal with DC component removed, signal after bandpass filtering, signal after 50Hz cutoff filtering, and displays the spectrogram. 
%The filtering parameters and visualization settings are specified, enhancing signal analysis and interpretation.

% Load the dataset
data = load('O001.txt');

% Define the sampling frequency
fs = 173.61;

% Time vector
t = (0:length(data)-1) / fs;

% Step 1: Remove DC component
data_dc_removed = detrend(data);

% Step 2: Design and implement a bandpass filter
filter_order = 2;
f_low = 0.5;
f_high = 60;

% Design bandpass filter
[b, a] = butter(filter_order, [f_low, f_high] / (fs/2), 'bandpass');

% Apply the filter
data_filtered = filtfilt(b, a, data_dc_removed);

% Step 3: Design and apply a 50Hz cutoff filter
f_cutoff = 50;
[b2, a2] = butter(2, f_cutoff / (fs/2), 'low');
data_final = filtfilt(b2, a2, data_filtered);

% Step 4: Calculate the spectrogram
window_length = 256;
overlap_percent = 50; % Overlap percentage
nfft = 1024;

% Calculate spectrogram
[S, F, T] = spectrogram(data_final, window_length, floor(overlap_percent/100*window_length), nfft, fs);

% Plot the results
figure;

% Plot the original signal
subplot(4,1,1);
plot(t, data);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the signal with removed DC component
subplot(4,1,2);
plot(t, data_dc_removed);
title('Signal with DC component removed');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the signal after bandpass filtering
subplot(4,1,3);
plot(t, data_filtered);
title('Signal after Bandpass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the final signal after 50Hz cutoff filtering
subplot(4,1,4);
plot(t, data_final);
title('Signal after 50Hz Cutoff Filtering');
xlabel('Time (s)');
ylabel('Amplitude');

% Display the spectrogram
figure;
surf(T, F, 10*log10(abs(S)), 'EdgeColor', 'none');
axis tight;
view(0,90);
title('Spectrogram');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% Adjust the color map for better visibility
colormap(jet);
