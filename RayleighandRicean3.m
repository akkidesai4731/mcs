clc;
clear all;
close all;
r=0:0.001:10; % Range of values
sigma=sqrt(0.2); % Standard deviation, sqrt(variance)
A=1; % Amplitude of the Line-of-Soght component
% Rayleigh Distribution
rayleigh_pdf=(r./sigma^2).*exp(-r.^2/(2*sigma^2));
% Rician Distribution
ricean_pdf=(r./sigma^2).*exp(-(r.^2+A^2)/(2*sigma^2)).*besseli(0,r*A/sigma^2);
% Plotting
figure;
plot(r,rayleigh_pdf,'r-','LineWidth',2);
hold on;
plot(r,ricean_pdf,'b--','LineWidth',2);
hold off;
% Labels and Title
xlabel('r');
ylabel('Probability Density');
title('Rayleigh and Rician Distribution');
legend('Rayleigh Distribution','Rician Distribution');
grid on;
