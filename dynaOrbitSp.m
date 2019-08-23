ds = function dynaOrbitSp(t,s)
% orbit dynamics in Sp coordinate system
%
%

rSp = s(1);
alphaSp = s(2);
phiSp = s(3);
drSp = s(4);
dalphaSp = s(5);
dphiSp = s(6);

% External Forces set to 0
FrSp = 0;
FalphaSp = 0;
FphiSp = 0;

% 

ddrSp = rSp * dalphaSp ^ 2 * cos(phiSp) ^ 2 + rSp * dphiSp ^ 2 + FrSp;
ddalphaSp = (-2 * ( drSp * cos(phiSp) - rSp * dphiSp * sin(phiSp)) * dalphaSp + FalphaSp) / r / cos(phiSp);
ddphiSp = ( - ( 2 * drSp * dphiSp + r * dalpha^2 * sin(phiSp) * cos(phiSp)) + FphiSp ) / r;

% 
ds = [drSp; dalphaSp; dphiSp; ddrSp; ddalphaSp; ddphiSp]; 