% =========================================================================
% PID control
% =========================================================================
close all

% Initial conditions for PID control
tspan = [0 300]; %s
c0 = 0.015; %L/s
Y0 = [130;130;0]; % I.C. for both T and Ts is 130degF, I.C. for I is zero

ftnhand = @Tmixer_ftn;

% Define PID Parameters for Controlled Run #1
Kc = -0.0168; % L/s*degF
tauI = 10; % s
tauD = 0.5; % s 

[t,Y] = ode45(ftnhand,tspan,Y0,[],c0,Kc,tauI,tauD);

Ts1 = Y(:,2);


figure 
plot(t,Ts1,'r','Linewidth',2)
hold on
plot([t(1) t(end)],120*[1 1],': k','Linewidth',2) % setpoint

xlabel('Time (s)')
ylabel('Sensor Reading (degF)')

% Now we plot the outlet flow rate as a function of time to ensure our
% system is behaving as expected
%figure 
%plot(t_out{1},yFout_out{1},'r','Linewidth',2)
%hold on
%plot(t_out{2},yFout_out{2},'b','Linewidth',2)
%plot([t(1) t(end)],1*[1 1],': k','Linewidth',2) % setpoint
%xlabel('Time (s)')
%ylabel('Outlet Flow Rate (kg/s)')
%legend('Kc = -0.1','Kc = -10','Outlet Flowrate Setpoint')