# Two Link Manipulator

## General Info 

This project includes a number of small programs related to measuring the applied torque on the links of a two link manipualtor.
The Repository inlcudes a number of small programs which can be used to simulate and plot the state response and torque required in order to achiev a specified trajectory. 
These include: 

- Trapezidal Trajectory planner which estimates the link positions, velocities and accelerations for a defined maximum acceleration and velocity
- Feedforward Torque control Simulink model 
- Simulink model of a two link pendulum (no applied torque to the joint except gravity);
- text files of Position and Velocity trajectories have also been provided for testing of the model. 


## Technology 
Software required 
- MATLAB/Simulink 2019b 

## Setup 
Start by cloning the git repository from address: 

"https://github.com/MajedYassin/TwoLink_Manipulator-.git"

In order to run/test the Feedforward torque control model in Simulink first: 

- Run the Trapezoidla Trajectory file in MATLAB;

- Run initialise Parameters; 

- Run the Model; 

***Note: The timestep in the trajectory modeule and both Simulink models has been set to 0.01, 
  please remember to adjust this value accordingly in all each when changing the timestep in either of them;***
  
When Running the Pendulum_model: 

- Set the Starting Position (Initial Joint Angles) in the Simulink model in the constant block labelled q; 
