% Set variables
run('T33_Shooting_Star_parameters.m');

% [u, v, w, p, q, r, phi, theta, psi, x_f, y_f, z_f]

% Reference state around which linearization happens
reference_state = [v, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -h];

% Set ODE options
initial_p = 0.0;
initial_q = 0.0;
initial_r = 0.1;
initial_conditions = [v, 0, 0, initial_p, initial_q, initial_r, 0, 0, 0, 0, 0, -h];
time_interval = [0, 10];

% Compute ODE
[time, state] = ode45(@(t, state) state_propagation(t, state, reference_state), time_interval, initial_conditions);

% Extract all states for plotting
u = state(:,1);
v = state(:,2);
w = state(:,3);
p = state(:,4);
q = state(:,5);
r = state(:,6);
phi = state(:,7);
theta = state(:,8);
psi = state(:,9);
x_f = state(:,10);
y_f = state(:,11);
z_f = state(:,12);

%% Plot
figure(1)

% Air speeds
subplot(4,3,1)
plot(time, u);
title('Air speed along x-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('u [m/s]')
grid on
hold on

subplot(4,3,2)
plot(time, v);
title('Air speed along y-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('v [m/s]')
grid on
hold on

subplot(4,3,3)
plot(time, w);
title('Air speed along z-axis, aeroplane frame')
xlabel('Time [s]')
ylabel('w [m/s]')
grid on
hold on

% Turn rates
subplot(4,3,4)
plot(time, p);
title('Roll Rate')
xlabel('Time [s]')
ylabel('p [rad/s]')
grid on
hold on

subplot(4,3,5)
plot(time, q);
title('Pitch Rate')
xlabel('Time [s]')
ylabel('q [rad/s]')
grid on
hold on

subplot(4,3,6)
plot(time, r);
title('Yaw Rate')
xlabel('Time [s]')
ylabel('r [rad/s]')
grid on
hold on

% Euler angles
subplot(4,3,7)
plot(time, phi);
title('Roll')
xlabel('Time [s]')
ylabel('\phi [rad]')
grid on
hold on

subplot(4,3,8)
plot(time, theta);
title('Pitch')
xlabel('Time [s]')
ylabel('\theta [rad]')
grid on
hold on

subplot(4,3,9)
plot(time, psi);
title('Yaw')
xlabel('Time [s]')
ylabel('\psi [rad]')
grid on
hold on

% Position
subplot(4,3,10)
plot(time, x_f);
title('Position along x-axis, inertial frame')
xlabel('Time [s]')
ylabel('x_f [m]')
grid on
hold on

subplot(4,3,11)
plot(time, y_f);
title('Position along y-axis, inertial frame')
xlabel('Time [s]')
ylabel('y_f [m]')
grid on
hold on

subplot(4,3,12)
plot(time, -z_f);
title('Position along z-axis, inertial frame')
xlabel('Time [s]')
ylabel('z_f [m]')
grid on
hold on

figure(2)
plot3(x_f, y_f, -z_f)
title('Aeroplane position, inertial frame')
xlabel('x_f [m]')
ylabel('y_f [m]')
zlabel('z_f [m]')
grid on
hold on