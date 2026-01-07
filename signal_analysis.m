%% signal_analysis.m
% Author: Your Name
% Purpose: Generate, add noise, and analyze a signal
% Date: 2026-01-07

clc; clear; close all;

% --- Step 1: Generate a sine wave ---
Fs = 1000;             % Sampling frequency (Hz)
t = 0:1/Fs:1;          % Time vector (1 second)
f = 5;                 % Signal frequency (Hz)
A = 1;                 % Amplitude

signal = A*sin(2*pi*f*t);

% --- Step 2: Add noise ---
noise = 0.3*randn(size(t));  % Gaussian noise
noisy_signal = signal + noise;

% --- Step 3: Plot time domain ---
figure;
plot(t, noisy_signal, '.-')
hold on
plot(t, signal, 'r', 'LineWidth', 1.5)
xlabel('Time (s)')
ylabel('Amplitude')
title('Time Domain Signal')
legend('Noisy Signal','Original Signal')
grid on

% --- Step 4: Frequency domain analysis ---
N = length(noisy_signal);
Y = fft(noisy_signal);
f_axis = (0:N-1)*(Fs/N);

figure;
plot(f_axis, abs(Y)/N)
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Frequency Domain')
xlim([0 50])   % show up to 50 Hz
grid on
