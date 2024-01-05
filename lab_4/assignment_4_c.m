% Set variables
run('T33_Shooting_Star_parameters.m');

% Longitudinal equations
long_eqs = [Xu , Xw , 0 , -g ;
            Zu , Zw , v , 0 ;
            Mu + Mw_dot*Zu , Mw + Mw_dot*Zw , Mq + Mw_dot*v , 0 ;
            0 , 0 , 1 , 0];
        
linear_terms = [0;
                Zdelta_e;
                Mdelta_e + Mw_dot*Zdelta_e;
                0];
       
Gsys = ss(long_eqs, linear_terms, eye(4), 0);
G = minreal(tf(Gsys));
G_3 = G(3);

step(G_3, 100)
grid
title('Long step response for q')