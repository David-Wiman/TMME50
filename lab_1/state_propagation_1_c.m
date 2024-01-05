% Function to propagate the state
function next_state = state_propagation_1_c(t, state, m, I_yy, reference_state, force_lin_param)
    % Rename state components for readability
    u = state(1);
    w = state(2);
    q = state(3);
    theta = state(4);
    x_f = state(5);
    z_f = state(6);
    
    % Extract reference state
    u0 = reference_state(1);
    w0 = reference_state(2);
    q0 = reference_state(3);
    theta_0 = reference_state(4);
    x_f_0 = reference_state(5);
    z_f_0 = reference_state(6);
    
    % Extract force linearization parameters
    Xu = force_lin_param(1);
    Xw = force_lin_param(2);
    Zu = force_lin_param(3);
    Zw = force_lin_param(4);
    Mw = force_lin_param(5);
    Mq = force_lin_param(6);
    
    % Constants
    g = 9.81;
    
    % Forces
    X = m*g*sin(theta_0) + m*Xu*(u - u0) + m*Xw*(w-w0);
    Z = -m*g*cos(theta_0) + m*Zu*(u - u0) + m*Zw*(w - w0);
    M = I_yy*Mw*(w - w0) + I_yy*Mq*(q - q0);
    
    % State dynamics
    next_state(1) = -q*w - g*sin(theta) + X/m;
    next_state(2) = q*u + g*cos(theta) + Z/m;
    next_state(3) = M/I_yy;
    next_state(4) = q;
    next_state(5) = u*cos(theta) + w*sin(theta);
    next_state(6) = u*sin(theta) - w*cos(theta);
    
    % Transpose to get row vector 
    next_state = next_state';
end