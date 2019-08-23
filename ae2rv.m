function [r, v] = ae2rv(ae)
mu = 3.986*10^14;   % for earth
% transform orbit elements to position and velocity vector @ J2000 Inertial
% Well, it is hard to say whether it is in the inertial frame ! Given first
% in inertial is OK
% input:
%       a - Semimajor
%       e - Eccentricity
%       i - Inclination
%       O - Longitude of the Ascending Node
%       w - Argument of Perigee
%       f - True Anomaly
% output:
%       r - Position vector in
%       v - Velocity vector in
%
% need tests
%                                       Zhang Shuai, HIT, P.R.C. 20171001
a = ae(1);
e = ae(2);
i = ae(3);
O = ae(4);
w = ae(5);
f = ae(6);

E = 2 * atan(sqrt( ( 1 - e ) / ( 1 + e ) ) * tan( f / 2 ) );
P = [cos(O)*cos(w)-sin(O)*sin(w)*cos(i);
    sin(O)*cos(w)+cos(O)*sin(w)*cos(i);
    sin(w)*sin(i)];
Q = [-cos(O)*sin(w)-sin(O)*cos(w)*cos(i);
    -sin(O)*sin(w)+cos(O)*cos(w)*cos(i);
    cos(w)*sin(i)];
r = a*(cos(E)-e)*P+a*sqrt(1-e^2)*sin(E)*Q;
v = sqrt(mu*a)/norm(r)*(-sin(E)*P+sqrt(1-e^2)*cos(E)*Q);
end