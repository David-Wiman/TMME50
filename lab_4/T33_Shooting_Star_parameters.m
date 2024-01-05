% Constants
g = 9.81;

% Unit conversions
feet_to_meter = 0.3048;
feet2_to_m2 = 0.09290;
lb_to_kg = 0.4536;
slug_to_kg = 14.59;
slug_feet2_to_kg_m2 = 1.356;
lb_to_N = 4.448;

% Parameters in SI units
h = 100;
v = 228*feet_to_meter;
m = 367*slug_to_kg;
I_x = 12700*slug_feet2_to_kg_m2;
I_y = 20700*slug_feet2_to_kg_m2;
I_z = 32001*slug_feet2_to_kg_m2;
I_xz = 480*slug_feet2_to_kg_m2;
Q = 61.7*lb_to_N/feet2_to_m2;

Xu = -0.0391;
Xalpha = 18.58*feet_to_meter;
Xw = Xalpha/v;
Zu = -0.248;
Zalpha = -213.41*feet_to_meter;
Zw = Zalpha/v;
Mu = 0.000318/feet_to_meter;
Malpha = -1.89;
Mw = Malpha/v;
Malpha_dot = -0.35;
Mw_dot = Malpha_dot/v;
Mq = -0.694;
Xdelta_e = 0.516*feet_to_meter;
Zdelta_e = -13.4*feet_to_meter;
Mdelta_e = -4.19;

Ybeta = -28.4*feet_to_meter;
Lbeta = -5.49;
Lp = -2.03;
Lr = 0.641;
Nbeta = 0.667;
Np = -0.116;
Nr = -0.207;
Ydelta_r = 0.0295*feet_to_meter;
Ldelta_r = -0.0125;
Ndelta_r = -1.24;
Ldelta_a = 6.01;
Ndelta_a = 0.0286;

S = 234.8*feet2_to_m2;
b = 37.54*feet_to_meter;
c = 6.72*feet_to_meter;

Yp = 0;
Yr = 0;