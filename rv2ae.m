function ae = rv2ae(r_v,v_v)
%% rv2ae, r,v in J2000
% 

mu = 3.986e14;

h_v   = cross(r_v,v_v);
h   = norm(h_v);

i   =     acos(h_v(3)/h);
Omega = atan2(h_v(1),-h_v(2));

e_v= cross(v_v,h_v)/mu-r_v/norm(r_v);
e = norm(e_v);

a= h^2/mu/(1-e^2);

% 
omega = atan2(e_v(3),(e_v(2)*sin(Omega)+e_v(1)*cos(Omega))*sin(i));   %

u  = atan2(r_v(3),(r_v(2)*sin(Omega)+r_v(1)*cos(Omega))*sin(i));

theta = u - omega;

ae=[a,e,i,Omega,omega,theta]';