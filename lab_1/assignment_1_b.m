% Set variables
run('T33_Shooting_Star_parameters.m');

% Set ODE options
initial_conditions = [v, 0, 0, 0, 0, h];
time_interval = [0, 100];

% Compute ODE
[time, state] = ode45(@(t, state) state_propagation_1_b(t, state, m, I_y), time_interval, initial_conditions);

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

% Yes, the plane flies in a straight line parallell to the ground