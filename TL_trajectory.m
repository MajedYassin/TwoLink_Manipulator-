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
        qd{x}  = Amax * Ta;
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
while tj <= T
    q1{x}   = qj - 0.5*Aj*(T - tj)^2;
    q1d{x}  = Aj * (T - tj);
    q1dd{x} = - Aj; 
    x = x + 1;
    tj = tj + dt;
end

Q = cell2mat(q);
Q1 = cell2mat(q1);
Qd = gradient(Q)/dt;
Q1d = gradient(Q1)/dt;
Qdd = gradient(Qd)/dt;
Q1dd = gradient(Q1d)/dt;


Qda   = cell2mat(qd);
Qdda  = cell2mat(qdd);
Q1da  = cell2mat(q1d); 
Q1dda = cell2mat(q1dd);

time = 0:dt:T;

plot(time, Q)
hold on 
plot(time, Qda)

figure
plot(time, Q1)
hold on 
plot(time, Q1da)