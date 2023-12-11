file_name = 'gnss_coordenates.txt'; 
import_options = detectImportOptions(file_name, 'Delimiter', ',');
import_options = setvartype(import_options, 'Var1', 'datetime');
data_table = readtable(file_name, import_options);

% Extracting data
datetime = data_table.Var1;
latitude = data_table.Var2;
longitude = data_table.Var3;

% This values with the location site, change accordingly
% FSPortugal Site: 358m
% FSSpain Site: 127m
% FSAustria Site: 683m
% NOVA FCT Site: 98m
% KIP Site: 19m
altitude = 98; 
                
% Setting origin
origin = [latitude(1), longitude(1), altitude];
[x, y] = latlon2local(latitude, longitude, altitude, origin);

% Plotting the trajectory
figure;
scatter(x, y)

% Setting plot axis limits with a margin
margin = 10;  % Adjust the margin size as needed
axis([min(x)-margin, max(x)+margin, min(y)-margin, max(y)+margin]);

% Making the plot axis equal and adding labels
axis equal;
xlabel('East (m)');
ylabel('North (m)');
title('Trajectory Plot');
grid on;

% Assuming dx and dy are the direction vectors at each data point
dx = diff(x);
dy = diff(y);
 
% Scatter plot
scatter(x, y, 'o', 'Color', 'blue', 'LineWidth', 1.25);
% Quiver plot
hold on;
quiver(x(1:end-1), y(1:end-1), dx, dy, 0, 'Color', 'red', 'LineWidth', 1.25);
hold off;

% Setting plot axis limits with a margin
margin = 10;  % Adjust the margin size as needed
axis([min(x)-margin, max(x)+margin, min(y)-margin, max(y)+margin]);

% Making the plot axis equal and adding labels
axis equal;
xlabel('East (m)');
ylabel('North (m)');
title('Trajectory Plot');
grid on;

