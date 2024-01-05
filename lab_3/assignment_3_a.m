% Set variables
run('T33_Shooting_Star_parameters.m');

% Reference state around which linearization happens
reference_state = [v, 0, 0, 0, 0, h];

% Force linearization parameters, [Xu, Xw, Zu, Zw, Mw, Mq]
force_lin_param = [Xu, Xw, Zu, Zw, Mw, Mq];

% Set ODE options
initial_conditions = [v, 0, 0, 0, 0, h];
time_interval = [0, 100];

% Set step magnitude
delta_e = 0.1;

% Compute ODE
[time, state] = ode45(@(t, state) state_propagation(t, state, m, I_y, delta_e, Zdelta_e, Mdelta_e, reference_state, force_lin_param), time_interval, initial_conditions);

% Extract all states for plotting
u = state(:,1);
w = state(:,2);
q = state(:,3);
theta = state(:,4);
x_f = state(:,5);
z_f = state(:,6);

% Plot
figure(1)
plot(time, q);
title('Step Response in q, \Delta\delta_{e,0}=0.1')
xlabel('Time [s]')
ylabel('q [rad/s]')
grid