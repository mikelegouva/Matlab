%The code below is free to use.
%The code below is part of a project for my university Dit|UOI
%Code by Michail Gouvalaris


% Load the dataset
filename = 'O001.txt';
data = load(filename);

% Define sampling frequency
fs = 173.61;

% Time vector
t = (0:length(data)-1) / fs;

% Step 1: Remove DC component
data = data - mean(data);

% Step 2: Design and implement a bandpass filter (0.5 - 60 Hz)
low_freq = 0.5;
high_freq = 60;
[b, a] = butter(4, [low_freq, high_freq] / (fs/2), 'bandpass');
filtered_data = filtfilt(b, a, data);

% Step 3: Design and apply a 50Hz cutoff filter
notch_freq = 50;
Q = 30;
[b_notch, a_notch] = iirnotch(notch_freq / (fs/2), 1/Q);
final_filtered_data = filtfilt(b_notch, a_notch, filtered_data);

% Step 4: Calculate characteristics
std_dev = std(final_filtered_data);
variance = var(final_filtered_data);
skewness_val = skewness(final_filtered_data);
kurtosis_val = kurtosis(final_filtered_data);
bandpower_val = bandpower(final_filtered_data, fs, [0.5, 60]);

% Step 5: Calculate Power Spectral Density (PSD)
[pxx, f] = pwelch(final_filtered_data, [], [], [], fs);

% Display results
disp('Characteristics:');
disp(['Standard Deviation: ', num2str(std_dev)]);
disp(['Variance: ', num2str(variance)]);
disp(['Skewness: ', num2str(skewness_val)]);
disp(['Kurtosis: ', num2str(kurtosis_val)]);
disp(['Bandpower: ', num2str(bandpower_val)]);

% Plot PSD
figure;
plot(f, 10*log10(pxx));
title('Power Spectral Density (PSD)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;

% Feel free to add more visualizations or details as needed for your exercise.
