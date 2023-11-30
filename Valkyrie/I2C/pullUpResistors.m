clear, clc
%% Comms Protocol Parameters
VDDIO = 3.3;        % Input/Output Voltage Supply Level
VIL = 0.3*VDDIO;    % Maximum Low Level Input Voltage
VIH = 0.7*VDDIO;    % Minimum High Level Input Voltage
VOL = 0.4;          % Maximum Low Level Output Voltage
IOL = 3*1e-3;       % Minimum Low Level Output Current

TR = 300*1e-9;      % Maximum Rise time of SCL/SDA
Cb = 400*1e-12;     % Maximum I2C Bus capacitance

%% Minimum Allowed Resistor Value
Rmin = (VDDIO-VOL)/IOL;

%% Maximum Allowed Resistor Value
C = linspace(0, 400, 400);
t1 = abs(log(1 - (VIL / VDDIO))); 
t2 = abs(log(1 - (VIH / VDDIO)));

T = t2 - t1;
Rmax = TR ./ (T .* C * 1e-12);

% Plotting Rmax with blue color
figure;
semilogy(C, Rmax, 'DisplayName', 'R_{max}');
hold on;
grid on;
yticks([1e2, 1e3, 10e3, 100e3, 1000e3]);
yticklabels({'0.1', '1', '10', '100', '1000'});

% Adding the horizontal line for Rmin in red color
Rmin_line = yline(Rmin, 'r', 'DisplayName', 'R_{min}');
ylim([1e2, 1000e3]);
xlabel('Capacitance (pF)');
ylabel('Resistance (k\Omega)');
title('Pull-up Resistor Value vs. Bus Capacitance');

% Display the legend
legend('Location', 'Best');
