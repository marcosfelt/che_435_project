function dYdt = Tmixer_ftn(t,Y,c0,Kc,tauI,tauD)
% Define state variables 
T = Y(1);
Ts = Y(2);
I = Y(3);

% Define constants for problem 
tauS = 3.2; % s 
V = 1.75; % L
T1 = 62.1; % degF
T2 = 145.8; % degF
F2 = 0.066; % L/s
TSpec = 120; % degF

% Develop PI controller algorithm
e = TSpec - Ts; 

c = c0 + Kc*(e + I/tauI - (tauD/tauS)*(T-Ts));

% Express differential equations for state variables 
dTdt = (1/V)*(c*T1+F2*T2-(c+F2)*T);
dTsdt = (1/tauS)*(T-Ts);
dIdt = e;

dYdt = [dTdt; dTsdt; dIdt];
