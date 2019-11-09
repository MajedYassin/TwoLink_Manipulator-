% Two-link Planar robot 

% Basic Mechanical parameters 
a1 = 0.5;
a2 = 0.5;
ac1 = 0.25; 
ac2 = 0.25;
m1 = 2;
m2 = 2;
g  = 9.81;
Kv = 0.0;
Kp = 0.0;
I_1= 0.0651;
I_2= 0.0651;


%Run TL_trajectory
joint_position  = [Q  Q1]; 
joint_velocity  = [Qda  Q1da];
joint_acceleration = [Qdda  Q1dda];

time_period = linspace(0, T, 63);
s1 = timeseries(joint_position(:,1), time_period);
s2 = timeseries(joint_position(:,2), time_period);
sd1 = timeseries(joint_velocity(:,1), time_period);
sd2 = timeseries(joint_velocity(:,2), time_period);
sdd1 = timeseries(joint_acceleration(:,1), time_period); 
sdd2 = timeseries(joint_acceleration(:,2), time_period); 
s = timeseries(joint_position, time_period);


