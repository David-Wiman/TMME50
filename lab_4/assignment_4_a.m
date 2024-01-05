% Set variables
run('T33_Shooting_Star_parameters.m');

% Longitudinal equations
long_eqs = [Xu , Xw , 0 , -g ;
            Zu , Zw , v , 0 ;
            Mu + Mw_dot*Zu , Mw + Mw_dot*Zw , Mq + Mw_dot*v , 0 ;
            0 , 0 , 1 , 0];

% Lateral equations
lat_eqs = [Ybeta/v , Yp/v , -(1-Yr/v) , g/v ;
           Lbeta , Lp , Lr , 0 ;
           Nbeta , Np , Nr , 0 ;
           0 , 1 , 0 , 0];
       
[long_eig_vectors, long_eig_values] = eig(long_eqs);
[lat_eig_vectors, lat_eig_values] = eig(lat_eqs);