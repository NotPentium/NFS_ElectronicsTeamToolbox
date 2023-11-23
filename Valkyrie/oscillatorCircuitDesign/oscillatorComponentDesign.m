clear, clc
%% Component Parameters
f = 32e6; % Oscilatting frequency
cl = 10e-12; % Crystal Load Capacitance
c0 =  100e-12; % Crystal Shunt Capacitance // Very Bad Scenario
esr = 60; % Crystal Equivalente Resistance Circuit 
dl = 100e-6; % Crystal Maximum Drive Level
cs = 5e-12; % PCB/Traces Stray Capacitance // Average Value 
gm = 10; % Minimal Transconductance required to maintain a stable oscillation  

%% 
% Assuming both load capacitors to have the same value
cl1 = 2* (cl-cs) ;  
cl2 = cl1 ;

% Calculating the drive level limiting resistor rExt
rExt = 1/(2*pi*f*cl2);

% Assuming a very bad scenario where the shunt capacitance is big, we see
% if the crystal is capable of remaining stable.
gmcrit = 4*(esr+rExt)*((2*pi*f)^2)*((c0+cl)^2); 
gmargin = gm/gmcrit; % gmargin must be bigger than 5 to ensure stable oscillations

% Determining the maximum allowed current flowing through the crystal (in mA)
imaxRMS = sqrt(dl/esr); 
imaxPP = 2*sqrt((2*dl)/esr);

%% Presentation

fprintf('Load Capacitor 1: %.1fpF\n', round(cl1*1e12));
fprintf('Load Capacitor 2: %.1fpF\n', round(cl2*1e12));
fprintf('Gain Margin: %.2f\n', gmargin);
fprintf('Resistor Value: %d Ohms\n', round(rExt));
fprintf('RMS Max Current: %.2fmA\n', imaxRMS*1e3);
fprintf('PP Max Current: %.2fmA\n', imaxPP*1e3);