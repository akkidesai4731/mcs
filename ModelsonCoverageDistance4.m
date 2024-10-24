transmit_power = 30; % Transmit power in dBm
frequency = 900e6; % Frequency in Hz
antenna_height_t = 40; % Antenna height in meters
antenna_height_r = 10;
% Distance range
d = 1:1:1000; % Distance in meters
% Path loss models
free_space_path_loss = (20 * log10(d)) + 20 * log10(frequency) - 147.55;
two_ray_ground_path_loss =( (40 * log10(d)) + 20 * log10(antenna_height_r) + 20 *
log10(antenna_height_t)+ 20 * log10(frequency) - 147.55);
% Calculate path loss for each model and distance
%free_space_losses = free_space_path_loss(distances);
%two_ray_losses = two_ray_ground_path_loss(distances);
% Plot results
figure;
plot(d, free_space_path_loss, 'b', 'DisplayName', 'Free Space Path Loss');
hold on;
plot(d, two_ray_ground_path_loss, 'r', 'DisplayName', 'Two-Ray Ground Path Loss');
xlabel('Distance (m)');
ylabel('Path Loss (dB)');
title('Effect of Propagation Models on Coverage Distance');
legend;
grid on;
hold off;
