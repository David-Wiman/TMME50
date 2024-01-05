% Set variables
run('T33_Shooting_Star_parameters.m');

% Reference state around which linearization happens
reference_state = [v, 0, 0, 0, 0, h];

% Force linearization parameters, [Xu, Xw, Zu, Zw, Mw, Mq]
force_lin_param = [Xu, Xw, Zu, Zw, Mw, Mq];

% Set ODE options
initial_theta = 0.1;
initial_conditions = [v, 0, 0, initial_theta, 0, h];
time_interval = [0, 100];

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
subplot(4,3,1)
plot(time, u, '-.r');
title('Air speed along x-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('u [m/s]')
grid on

subplot(4,3,3)
plot(time, w, '-.r');
title('Air speed along z-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('w [m/s]')
grid on

subplot(4,3,8)
plot(time, theta, '-.r');
title('Pitch')
xlabel('Time [s]')
ylabel('\theta [rad]')
grid on

subplot(4,3,5)
plot(time, q, '-.r');
title('Pitch Angular Velocity')
xlabel('Time [s]')
ylabel('q [rad/s]')
grid on

subplot(4,3,10)
plot(time, x_f, '-.r');
title('Position along x-axis, inertial frame')
xlabel('Time [s]')
ylabel('x_f [m]')
grid on

subplot(4,3,12)
plot(time, z_f, '-.r');
title('Position along z-axis, inertial frame')
xlabel('Time [s]')
ylabel('z_f [m]')
grid on

figure(2)
plot3(x_f, zeros(length(x_f),1),  z_f, '-.r')
title('Aeroplane position, inertial frame')
xlabel('x_f [m]')
ylabel('y_f [m]')
zlabel('z_f [m]')
grid on