threshold = 1
% Parameters
N = 1000; % Number of samples for the signal
SNR_dB = -10; % Signal-to-Noise Ratio in dB
threshold = 1; % Detection threshold
PU_active = true; % Primary User active or not (1 = active, 0 = inactive)
% Generate primary user's signal if PU is active
if PU_active
PU_signal = sqrt(10^(SNR_dB/10)) * randn(1, N); % Scaled random signal
else
PU_signal = zeros(1, N); % No signal if PU is inactive
end
% Add Gaussian noise to simulate the noisy environment
noise = randn(1, N); % Noise with mean 0 and variance 1
% Received signal (signal + noise if PU is active, otherwise only noise)
received_signal = PU_signal + noise;
% Energy Detection: Calculate the energy of the received signal
energy = sum(abs(received_signal).^2) / N;
% Threshold Comparison: Decide if PU is active based on energy
if energy > threshold
disp('Channel is occupied by Primary User (PU)');
else
disp('Channel is free, Cognitive Radio can transmit');
end
% Plotting the received signal for visualization
figure;
plot(received_signal);
title('Received Signal');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;
