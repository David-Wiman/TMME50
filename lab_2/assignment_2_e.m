% Set variables
run('T33_Shooting_Star_parameters.m');

% Create a Laplace variable
s = tf('s'); 

% Constants for the transfere functions
b1 = Mdelta_e + Mw_dot*Zdelta_e;
b0 = Mw*Zdelta_e - Mdelta_e*Zw;
d1 = Zdelta_e;
d0 = -Mq*Zdelta_e + v*Mdelta_e;
omega = sqrt(Zw*Mq - Mw*v);
zeta = -(Mq + Mw_dot*v + Zw) / (2*omega);
l = 0;

% Transfer function from elevator deflection to q
Gq = (b1*s + b0) / (s^2 + 2*zeta*omega*s + omega^2);

% Transfer function from elevator deflection to w
Gw = (d1*s + d0) / (s^2 + 2*zeta*omega*s + omega^2);

% Transfer function from elevator deflection to az
Gaz = s*Gw - v*Gq - l*s*Gq;

% Higher level transfer functions
k_rg = 1;
Gc = -Gq / (1 - k_rg*Gq); % Same as feedback(-Gq*k_rg, 1)

