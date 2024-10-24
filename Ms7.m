% Parameters
SNR_dB = 0:5:30; % SNR values in dB (0, 5, 10, ..., 30)
SNR = 10.^(SNR_dB/10); % Convert SNR from dB to linear scale
num_SNR = length(SNR); % Number of SNR points

% MIMO system sizes (2x2, 4x4, 8x8)
MIMO_systems = [2, 4, 8];
num_systems = length(MIMO_systems);

% Pre-allocate capacity matrix
Capacity = zeros(num_systems, num_SNR);

% Loop over different MIMO systems
for sys = 1:num_systems
Nt = MIMO_systems(sys); % Number of transmit antennas
Nr = Nt; % Assume same number of receive antennas (Nt x Nt)
H = (1/sqrt(2)) * (randn(Nr, Nt) + 1j*randn(Nr, Nt)); % Random MIMO channel matrix

for i = 1:num_SNR
% Capacity calculation using the MIMO capacity formula
C = log2(det(eye(Nr) + (SNR(i)/Nt) * (H * H')));
Capacity(sys, i) = C;
end
end

% Plotting
figure;

hold on;
for sys = 1:num_systems
plot(SNR_dB, Capacity(sys, :), '-o', 'DisplayName', sprintf('%dx%d MIMO',
MIMO_systems(sys), MIMO_systems(sys)));
end

xlabel('SNR (dB)');
ylabel('Channel Capacity (bits/sec/Hz)');
title('MIMO Channel Capacity vs SNR');
legend('show');
grid on;
hold off;
