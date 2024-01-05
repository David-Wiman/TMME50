% Set variables
run('T33_Shooting_Star_parameters.m');

% Reference state around which linearization happens
reference_state = [v, 0, 0, 0, 0, h];

% Force linearization parameters, [Xu, Xw, Zu, Zw, Mw, Mq]
force_lin_param = [Xu, Xw, Zu, Zw, Mw, Mq];

% Set ODE options
initial_conditions = [v, 0, 0, 0, 0, h, 0, 0];
time_interval = [0, 20];

% Set step magnitude
q_p = 0.1;

% Control parameters
k_a = 6;
k_rg = 4.5;
tau = 0.05;

% Compute ODE
[time, state] = ode45(@(t, state) state_propagation_control(t, state, m, I_y, q_p, k_a, k_rg, tau, Zdelta_e, Mdelta_e, reference_state, force_lin_param), time_interval, initial_conditions);

% Extract all states for plotting
u = state(:,1);
w = state(:,2);
q = state(:,3);
theta = state(:,4);
x_f = state(:,5);
z_f = state(:,6);
e = state(:,7);
delta_e = state(:,8);

% Plot
figure(1)
plot(time, q);
title('Step Response in q, \tau = 0.05')
xlabel('Time [s]')
ylabel('q [rad/s]')
grid