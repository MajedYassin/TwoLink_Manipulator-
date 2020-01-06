%%Trajectory Planner 
Vmax = 10;
Amax = 8;
qi = - pi/4;
q0 = 0;
hi = qi - q0;
t0 = 0; 
dt = 0.01;
q  = cell(25, 1);
qd = cell(60, 1);
qdd= cell(60, 1);

x = 1;
t = t0;

if(qi < 0) 
        Amax = -1 * Amax; 
end

if (hi > ((Vmax^2)/abs(Amax)))
    Ta = Vmax / abs(Amax);
    T  = ((abs(qi - q0))* abs(Amax) + Vmax^2)/(abs(Amax) * Vmax);
    while t <= Ta
       q{x}   = q0 + 0.5*Amax*(t - t0)^2;
       qd{x}  = Amax * t;
       qdd{x} = Amax;
       x = x + 1;
       t = t + dt; 
    end
    while t <= (T - Ta)
        q{x}   = q0 + Amax*Ta * (t - Ta/2);
        qd{x}  = Vmax;
        qdd{x} = Amax;
        x = x + 1;
        t = t + dt;
    end
    while t <= T
        q{x}   = qi - 0.5*Amax*(T - t)^2;
        qd{x}  = Amax * (T-t);
        qdd{x} = - Amax; 
        x = x + 1;
        t = t + dt; 
    end
else
    Ta = sqrt(hi/Amax);
    T  = 2* Ta;
    Vmax = hi / Ta;
    while t <= Ta 
        q{x} = q0 + 0.5*Amax*(t - t0)^2;
        qd{x}  = Amax * t;
        qdd{x} = Amax;
        x = x + 1;
        t = t + dt;
    end 
    while t <= T
        q{x}   = qi - 0.5*Amax*(T - t)^2;
        qd{x}  = Amax * (T-t);
        qdd{x} = - Amax; 
        x = x + 1;
        t = t + dt;
    end
end


qj = pi /6;
hj = qj - q0;

Aj = hj / (Ta*(T-Ta));
Vj = hj / (T - Ta);


%%Second Joint 
q1 = cell(25, 1);
q1d = cell(60, 1);
q1dd = cell(60, 1);
tj = t0;
x = 1; 

while tj <= Ta
    q1{x}   = q0 + 0.5*Aj*(tj - t0)^2;
    q1d{x}  = Aj * (tj - t0);
    q1dd{x} = Aj;
    x = x + 1;
    tj = tj +dt;
end
if (hj > ((Vmax^2)/abs(Amax)))
     while tj <= (T - Ta)
            q1{x}   = q0 + Aj*Ta * (tj - Ta/2);
            q1d{x}  = Aj * Ta;
            q1dd{x} = Aj;
            x = x + 1;
            tj = tj + dt;
     end
end
while tj <= T
    q1{x}   = qj - 0.5*Aj*(T - tj)^2;
    q1d{x}  = Aj * (T - tj);
    q1dd{x} = - Aj; 
    x = x + 1;
    tj = tj + dt;
end

Q = cell2mat(q);
Q1 = cell2mat(q1);


Qda   = cell2mat(qd);
Qdda  = cell2mat(qdd);
Q1da  = cell2mat(q1d); 
Q1dda = cell2mat(q1dd);

time = 0:dt:T;

%Plot Positon, Velocity and Acceleration trajectories of First Link
tiledlayout(3,1)
ax1 = nexttile;
plot(time, Q)
ylabel('Position (rad)', 'FontSize', 11)

ax2 = nexttile;
plot(time, Qda)
ylabel('Velocity (rad/s)', 'FontSize', 11)

ax3 = nexttile; 
plot(time, Qdda)
ylabel('Acceleration (rad/s^{2})', 'FontSize', 11)

xlim([ax1 ax2 ax3],[0 0.62]) 
plot1_title = ['First Link Trajectories for Rotation:', ' -\pi/4 rad'];
title(ax1, plot1_title,'FontSize', 14)
xlabel(ax3,'Time(s)', 'FontSize', 11) 

%Plot Position, Velocity and Acceleration trajectories of second link
figure
tiledlayout(3,1)
ax1 = nexttile;
plot(time, Q1)
ylabel('Position (rad)', 'FontSize', 11)

ax2 = nexttile;
plot(time, Q1da)
ylabel('Velocity (rad/s)', 'FontSize', 11)

ax3 = nexttile; 
plot(time, Q1dda)
ylabel('Acceleration (rad/s^{2})', 'FontSize', 11)

xlim([ax1 ax2 ax3],[0 0.62]) 
ylim(ax3,[-6 6])
plot2_title = ['Second Link Trajectories for Rotation:', ' \pi/6 rad'];
title(ax1, plot2_title,'FontSize', 14)
xlabel(ax3,'Time(s)', 'FontSize', 11) 
