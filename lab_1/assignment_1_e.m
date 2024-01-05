% Set variables
run('T33_Shooting_Star_parameters.m');

% Reference state around which linearization happens
reference_state = [v, 0, 0, 0, 0, h];

% Force linearization parameters, [Xu, Xw, Zu, 0, Mw, 0]
force_lin_param = [Xu, Xw, Zu, 0, Mw, 0];

% Set ODE options
initial_q = 0.1;
initial_conditions = [v, 0, initial_q, 0, 0, h];
time_interval = [0, 8]; % ~1/5 of the phugoid oscillation period

% Compute ODE
[time, state] = ode45(@(t, state) state_propagation_1_c(t, state, m, I_y, reference_state, force_lin_param), time_interval, initial_conditions);

% Extract all states for plotting
u = state(:,1);
w = state(:,2);
q = state(:,3);
theta = state(:,4);
x_f = state(:,5);
z_f = state(:,6);

% Plot
figure(1)
subplot(3,2,1)
plot(time, u);
title('Air speed along x-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('u [m/s]')
grid

subplot(3,2,2)
plot(time, w);
title('Air speed along z-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('w [m/s]')
grid

subplot(3,2,3)
plot(time, theta);
title('Pitch')
xlabel('Time [s]')
ylabel('\theta [rad]')
grid

subplot(3,2,4)
plot(time, q);
title('Pitch Angular Velocity')
xlabel('Time [s]')
ylabel('q [rad/s]')
grid

subplot(3,2,5)
plot(time, x_f);
title('Position along x-axis, inertial frame')
xlabel('Time [s]')
ylabel('x_f [m]')
grid

subplot(3,2,6)
plot(time, z_f);
title('Position along z-axis, inertial frame')
xlabel('Time [s]')
ylabel('z_f [m]')
grid

figure(2)
plot(x_f, z_f)
title('Aeroplane position, inertial frame')
xlabel('x_f [m]')
ylabel('z_f [m]')
grid

% Angle of Attack
speed_along_fixed_x = u.*cos(theta) + w.*sin(theta);
speed_along_fixed_z = u.*sin(theta) - w.*cos(theta); % Positive up
velocity_vector_angle = atan2(speed_along_fixed_z, speed_along_fixed_x);
alpha = velocity_vector_angle - theta;

figure(3)
plot(time, alpha)
title('Angle of Attack')
xlabel('Time [s]')
ylabel('\alpha [rad]')
grid