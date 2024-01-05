% Function to propagate the state
function next_state = state_propagation(t, state, reference_state)

    % I don't want to pass too many variables to this function
    run('T33_Shooting_Star_parameters.m');
    
    % Rename state components for readability
    u = state(1);
    v = state(2);
    w = state(3);
    
    p = state(4);
    q = state(5);
    r = state(6);
    
    phi = state(7);
    theta = state(8);
    psi = state(9);
    
    x_f = state(10);
    y_f = state(11);
    z_f = state(12);
    
    % Extract reference state
    u0 = reference_state(1);
    v0 = reference_state(2);
    w0 = reference_state(3);
    
    p0 = reference_state(4);
    q0 = reference_state(5);
    r0 = reference_state(6);
    
    phi_0 = reference_state(7);
    theta_0 = reference_state(8);
    psi_0 = reference_state(9);
    
    x_f_0 = reference_state(10);
    y_f_0 = reference_state(11);
    z_f_0 = reference_state(12);
    
    % Forces
    X = m*g*sin(theta_0) + m*Xu*(u - u0) + m*Xw*(w - w0);
    Y = -m*g*cos(theta_0)*sin(phi_0) + m*Yv*(v - v0);
    Z = -m*g*cos(theta_0)*cos(phi_0) + m*Zu*(u - u0) + m*Zw*(w - w0);
    
    % Moments
    L = I_xx*Lv*(v - v0) + I_xx*Lp*(p - p0) + I_xx*Lr*(r - r0);
    M = I_yy*Mw*(w - w0) + I_yy*Mq*(q - q0);
    N = I_zz*Nv*(v - v0) + I_zz*Np*(p - p0) + I_zz*Nr*(r - r0);   
    
    % State dynamics
    next_state(1) = -q*w + r*v - g*sin(theta) + X/m; % u
    next_state(2) = -r*u + p*w + g*sin(phi)*cos(theta) + Y/m; % v
    next_state(3) = q*u - p*v + g*cos(phi)*cos(theta) + Z/m; % w
    
    next_state(4) = (1/(1 - I_zz*I_xx/I_xz^2))*( I_zz*q*r*(I_zz - I_yy)/I_xz^2 - I_zz*p*q/I_xz - I_zz*L/I_xz^2 + p*q*(I_yy - I_xx)/I_xz + q*r - N/I_xz ); % p
    next_state(5) = -r*p*(I_xx-I_zz)/I_yy - I_xz*(p^2 - r^2)/I_yy + M/I_yy; % q
    next_state(6) = I_xx*next_state(4)/I_xz + q*r*(I_zz - I_yy)/I_xz - p*q - L/I_xz; % r
    
    next_state(7) = p + q*tan(theta)*sin(phi) + r*tan(theta)*cos(phi); % phi
    next_state(8) = q*cos(phi) - r*sin(phi); % theta
    next_state(9) = q*sin(phi)/cos(theta) + r*cos(phi)/cos(theta); % psi
    
    R = [cos(theta)*cos(psi) , cos(theta)*sin(psi) , -sin(theta);
         -cos(phi)*sin(psi) + sin(phi)*sin(theta)*cos(psi) , cos(phi)*cos(psi) + sin(phi)*sin(theta)*sin(psi) , sin(phi)*cos(theta);
         sin(phi)*sin(psi) + cos(phi)*sin(theta)*cos(psi) , -sin(phi)*cos(psi) + cos(phi)*sin(theta)*sin(psi) , cos(phi)*cos(theta)];
    
    R_inv = inv(R);
    
    next_state(10) = R_inv(1,1)*u + R_inv(1,2)*v + R_inv(1,3)*w; % x_f
    next_state(11) = R_inv(2,1)*u + R_inv(2,2)*v + R_inv(2,3)*w; % y_f
    next_state(12) = R_inv(3,1)*u + R_inv(3,2)*v + R_inv(3,3)*w; % z_f
    
    % Transpose to get row vector 
    next_state = next_state';
end