% Function to propagate the state
function next_state = state_propagation_1_a(t, state, m, I_yy)
    % Rename state components for readability
    u = state(1);
    w = state(2);
    q = state(3);
    theta = state(4);
    x_f = state(5);
    z_f = state(6);
    
    % Constants
    g = 9.81;
    
    % Forces
    X = 0;
    Z = 0;
    M = 0;
    
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