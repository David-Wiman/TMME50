% Set variables
run('T33_Shooting_Star_parameters.m');

% Constants for the transfere functions
b1 = Mdelta_e + Mw_dot*Zdelta_e;
b0 = Mw*Zdelta_e - Mdelta_e*Zw;
d1 = Zdelta_e;
d0 = -Mq*Zdelta_e + v*Mdelta_e;
omega = sqrt(Zw*Mq - Mw*v);
zeta = -(Mq + Mw_dot*v + Zw) / (2*omega);
l = 0;

% Chosen CAP parameters
CAP = 0.7;
zeta_ideal = 0.7;

% Ideal poles
T_theta_2 = b1/b0;
omega_ideal = sqrt( (CAP*v)/(g*T_theta_2) );
r1 = -zeta_ideal*omega_ideal + 1i*omega_ideal*sqrt( 1 - zeta_ideal^2 );
r2 = -zeta_ideal*omega_ideal - 1i*omega_ideal*sqrt( 1 - zeta_ideal^2 );