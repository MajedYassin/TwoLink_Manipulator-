% Two-link Planar robot 

% Basic Mechanical parameters 
a1=0.5;
a2=0.5;
ac1= 0.25; 
ac2 = 0.25;
m1 = 2;
m2 = 2;
g = 9.81;
Kv = 0.2;
Kp = 5;
I_1= 0.042;
I_2= 0.042;

%{
Gear reduction 
Gr = 5;
GRM = [1/(Gr^2) 1/Gr
    1/Gr (1/Gr^2)];


% Inertia Matrix 
I_1= 0.042;
I_2= 0.042;
Mi=[H11 H12
    H21 H22];
H11 = m1*(ac1^2)+I_1+m2*((a1^2)+(ac2^2)+2*a1*ac2*cos(q2))+I_2;
H22 = m2*(ac2^2) + I_2;
H21= m2*((ac2^2)+2*a1*ac2*cos(q2))+I_2;
H12 = H21;


% Coriolis Term
Ci=[-P*q2d -2*P*q1d
    P*q1d 0];
P = m2*a1*ac2*sin(q2);

%Gravitational Force terms 
G = [G1
    G2];
G1 = m1*ac1*g*cos(q1)+m2*g*(ac2*cos(q1+q2)+a1*cos(q1));
G2 = m2*g*ac2*cos(q1+q2);
%}

%Obtaining State Variables: Polynomial trajectory 




% Inverse Kinematics 






