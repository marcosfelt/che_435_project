% =========================================================================
% PID control
% =========================================================================
close all

% Initial conditions for PID control
tspan = [0 200]; %s
c0 = 0.01536; %L/s
Y0 = [130;130;0]; % I.C. for both T and Ts is 130degF, I.C. for I is zero

ftnhand = @Tmixer_ftn;

% Define PID Parameters
Kc = -0.02762; % L/s*degF
tauI = 1; % s
tauD = 10; % s 

[t,Y] = ode15s(ftnhand,tspan,Y0,[],c0,Kc,tauI,tauD);

Ts1 = Y(:,2);

figure 
plot(t,Ts1,'r','Linewidth',2)
hold on
plot([t(1) t(end)],120*[1 1],': k','Linewidth',2) % setpoint
title('Thermal Mixer - Controlled Run 2')
xlabel('Time (s)')
ylabel(' Temperature Sensor Reading (\circF)')
dim = [.45 .6 .3 .3];
str = 'K_{c} = -0.02762 L/s\circF, \tau_{I} = 1s, \tau_{D} = 10s';
annotation('textbox',dim,'String',str,'FitBoxToText','on');
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