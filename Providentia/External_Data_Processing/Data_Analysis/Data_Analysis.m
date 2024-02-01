clear all, clc, close all

%% ---------- Read Data from the Text File ---------- %%
data = readtable('Dataset_Example.txt', 'Delimiter', ';');

%% ---------- Extract Data ---------- %%
time = data.time;
accel_data = data{:, 2:4};
gyro_data = data{:, 5:7};
mag_data = data{:, 8:10};
ekf_data = data{:, 11:13};
gps_data = data{:, 14:15};
bosch_data = data{:, 16:18};
ws_data = data{:, 19};
tps_data = data{:, 20};
brk_data = data{:, 21};
sw_theta_data = data{:, 22};

%% ---------- Accelerometer Plots ---------- %%
figure;

subplot(3, 1, 1);
plot(time, accel_data(:, 1), 'r');
title('Accelerometer X-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(3, 1, 2);
plot(time, accel_data(:, 2), 'g');
title('Accelerometer Y-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(3, 1, 3);
plot(time, accel_data(:, 3), 'b');
title('Accelerometer Z-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

%% ---------- Gyroscope Plots ---------- %%
figure;

subplot(3, 1, 1);
plot(time, gyro_data(:, 1), 'r');
title('Gyroscope X-axis');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');

subplot(3, 1, 2);
plot(time, gyro_data(:, 2), 'g');
title('Gyroscope Y-axis');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');

subplot(3, 1, 3);
plot(time, gyro_data(:, 3), 'b');
title('Gyroscope Z-axis');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');

%% ---------- Magnetometer Plots ---------- %%
figure;

subplot(3, 1, 1);
plot(time, mag_data(:, 1), 'r');
title('Magnetometer X-axis');
xlabel('Time (s)');
ylabel('Magnetic Field (uT)');

subplot(3, 1, 2);
plot(time, mag_data(:, 2), 'g');
title('Magnetometer Y-axis');
xlabel('Time (s)');
ylabel('Magnetic Field (uT)');

subplot(3, 1, 3);
plot(time, mag_data(:, 3), 'b');
title('Magnetometer Z-axis');
xlabel('Time (s)');
ylabel('Magnetic Field (uT)');

%% ---------- EKF Output Plots ---------- %%
figure;

subplot(3, 1, 1);
plot(time, ekf_data(:, 1), 'r');
title('EKF Output X-axis');
xlabel('Time (s)');
ylabel('EKF Output');

subplot(3, 1, 2);
plot(time, ekf_data(:, 2), 'g');
title('EKF Output Y-axis');
xlabel('Time (s)');
ylabel('EKF Output');

subplot(3, 1, 3);
plot(time, ekf_data(:, 3), 'b');
title('EKF Output Z-axis');
xlabel('Time (s)');
ylabel('EKF Output');

%% ---------- GPS Plots ---------- %%
figure;

% 2D
% subplot(2, 1, 1);
% plot(time, gps_data(:, 1), 'r');
% title('GPS X-axis');
% xlabel('Time (s)');
% ylabel('GPS Data');
% 
% subplot(2, 1, 2);
% plot(time, gps_data(:, 2), 'g');
% title('GPS Y-axis');
% xlabel('Time (s)');
% ylabel('GPS Data');

% 3D
plot3(gps_data(:, 1), gps_data(:, 2), time, 'b');
title('GPS 3D Plot');
xlabel('GPS X-axis');
ylabel('GPS Y-axis');
zlabel('Time');
grid on;

%% ---------- BOSCH Accelerometer Plots ---------- %%
figure;

subplot(3, 1, 1);
plot(time, bosch_data(:, 1), 'r');
title('BOSCH Accelerometer X-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(3, 1, 2);
plot(time, bosch_data(:, 2), 'g');
title('BOSCH Accelerometer Y-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

subplot(3, 1, 3);
plot(time, bosch_data(:, 3), 'b');
title('BOSCH Accelerometer Z-axis');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

%% ---------- Wheel Speed Plot ---------- %%
figure;

plot(time, ws_data, 'r');
title('Wheel Speed');
xlabel('Time (s)');
ylabel('Speed (units)');

% Calculate Average Wheel Speed
avg_ws = mean(ws_data);
disp(['Average Wheel Speed: ' num2str(avg_ws) ' km/h']); % COLOCAR UNIDADES CORRETAS

% Highest and Lowest Wheel Speed
max_ws = max(ws_data);
min_ws = min(ws_data);

disp(['Highest Wheel Speed: ' num2str(max_ws) ' km/h']);
disp(['Lowest Wheel Speed: ' num2str(min_ws) ' km/h']);

%% ---------- Throttle Position Plot ---------- %%
figure;

plot(time, tps_data, 'g');
title('Throttle Position');
xlabel('Time (s)');
ylabel('Position');

% Calculate Average Throttle Position
avg_tps = mean(tps_data);
disp(['Average Throttle Position: ' num2str(avg_tps) ' units']); % COLOCAR UNIDADES CORRETAS

%% ---------- Brake Position Plot ---------- %%
figure;

plot(time, brk_data, 'b');
title('Brake Position');
xlabel('Time (s)');
ylabel('Position');

% Calculate Average Brake Position
avg_brk = mean(brk_data);
disp(['Average Brake Position: ' num2str(avg_brk) ' units']); % COLOCAR UNIDADES CORRETAS

%% ---------- Steering Wheel Theta Plot ---------- %%
figure;

plot(time, sw_theta_data, 'm');
title('Steering Wheel Theta');
xlabel('Time (s)');
ylabel('Angle (degrees)');

% Calculate Average Steering Wheel Theta
avg_sw_theta = mean(sw_theta_data);
disp(['Average Steering Wheel Theta: ' num2str(avg_sw_theta) ' degrees']);

%% ---------- Comparison of all Acceleration Data ---------- %%
figure;

subplot(3, 1, 1);
plot(time, accel_data(:, 1), 'r', time, ekf_data(:, 1), 'g', time, bosch_data(:, 1), 'b');
title('X-axis Comparison');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Accelerometer', 'EKF Output', 'BOSCH Accelerometer');

subplot(3, 1, 2);
plot(time, accel_data(:, 2), 'r', time, ekf_data(:, 2), 'g', time, bosch_data(:, 2), 'b');
title('Y-axis Comparison');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Accelerometer', 'EKF Output', 'BOSCH Accelerometer');

subplot(3, 1, 3);
plot(time, accel_data(:, 3), 'r', time, ekf_data(:, 3), 'g', time, bosch_data(:, 3), 'b');
title('Z-axis Comparison');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('Accelerometer', 'EKF Output', 'BOSCH Accelerometer');

%% ---------- Highest and Lowest Acceleration (EKF Output and BOSCH Accelerometer) ---------- %%
max_accel_ekf_x = max(ekf_data(:, 1));
min_accel_ekf_x = min(ekf_data(:, 1));

max_accel_ekf_y = max(ekf_data(:, 2));
min_accel_ekf_y = min(ekf_data(:, 2));

max_accel_ekf_z = max(ekf_data(:, 3));
min_accel_ekf_z = min(ekf_data(:, 3));

max_accel_bosch_x = max(bosch_data(:, 1));
min_accel_bosch_x = min(bosch_data(:, 1));

max_accel_bosch_y = max(bosch_data(:, 2));
min_accel_bosch_y = min(bosch_data(:, 2));

max_accel_bosch_z = max(bosch_data(:, 3));
min_accel_bosch_z = min(bosch_data(:, 3));

disp(['Highest Acceleration (EKF Output) X-axis: ' num2str(max_accel_ekf_x) ' units']);
disp(['Lowest Acceleration (EKF Output) X-axis: ' num2str(min_accel_ekf_x) ' units']);

disp(['Highest Acceleration (EKF Output) Y-axis: ' num2str(max_accel_ekf_y) ' units']);
disp(['Lowest Acceleration (EKF Output) Y-axis: ' num2str(min_accel_ekf_y) ' units']);

disp(['Highest Acceleration (EKF Output) Z-axis: ' num2str(max_accel_ekf_z) ' units']);
disp(['Lowest Acceleration (EKF Output) Z-axis: ' num2str(min_accel_ekf_z) ' units']);

disp(['Highest Acceleration (BOSCH Accelerometer) X-axis: ' num2str(max_accel_bosch_x) ' units']);
disp(['Lowest Acceleration (BOSCH Accelerometer) X-axis: ' num2str(min_accel_bosch_x) ' units']);

disp(['Highest Acceleration (BOSCH Accelerometer) Y-axis: ' num2str(max_accel_bosch_y) ' units']);
disp(['Lowest Acceleration (BOSCH Accelerometer) Y-axis: ' num2str(min_accel_bosch_y) ' units']);

disp(['Highest Acceleration (BOSCH Accelerometer) Z-axis: ' num2str(max_accel_bosch_z) ' units']);
disp(['Lowest Acceleration (BOSCH Accelerometer) Z-axis: ' num2str(min_accel_bosch_z) ' units']);

%% ---------- Calculate Error between EKF and BOSCH Accelerometer ---------- %%
error_accel = sqrt(sum((ekf_data - bosch_data).^2, 2));
figure;
plot(time, error_accel, 'm');
title('Error between EKF and BOSCH Accelerometer');
xlabel('Time (s)');
ylabel('Error (m/s^2)');

% -------------------- THIS CODE IS ONLY AN IDEA THAT PROBABLT WONT BE ON THE FINAL VERSION OF THE CODE -------------------- %

%% ---------- Velocity Calculation using GPS Data ---------- %% 
% Using numerical differentiation to calculate velocity
delta_time = diff(time);
velocity_x = diff(gps_data(:, 1)) ./ delta_time;
velocity_y = diff(gps_data(:, 2)) ./ delta_time;

% Plot Velocity
figure;

subplot(2, 1, 1);
plot(time(2:end), velocity_x, 'r');
title('GPS Velocity X-axis');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

subplot(2, 1, 2);
plot(time(2:end), velocity_y, 'g');
title('GPS Velocity Y-axis');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

% Calculate Average Velocity
avg_velocity_x = mean(velocity_x);
avg_velocity_y = mean(velocity_y);
disp(['Average Velocity (X, Y): ' num2str(avg_velocity_x) ', ' num2str(avg_velocity_y) ' m/s']);
