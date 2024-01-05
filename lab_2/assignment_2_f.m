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

% Transfere function from elevator deflection to q
Gq = (b1*s + b0) / (s^2 + 2*zeta*omega*s + omega^2);

% Tansfere function from elevator deflection to w
Gw = (d1*s + d0) / (s^2 + 2*zeta*omega*s + omega^2);

% Tansfere function from elevator deflection to az
Gaz = s*Gw - v*Gq - l*s*Gq;

% Higher level fransfere functions
k_rg = 0.325; % 0.325 gives good results
Gc = -Gq / (1 - k_rg*Gq); % Same as feedback(-Gq*k_rg, 1)

%  The poles on the root locus plot are denoted
%  by x and the zeros are denoted by o.
rlocus(Gc/s)
title('Root loci with respect to k_a, k_{rg} = 0.325')
hold on
plot(-1.4902, 1.5204, 'rd') % r1
plot(-1.4902, -1.5204, 'rd') % r2

% Store a good value
k_a = 0.417;