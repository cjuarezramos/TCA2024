close all
% respuesta al escalón
tau = 5;
T = tf(1,[tau 1]);
[x,t]=step(T,30);
plot(t,x,"LineWidth",3)
grid on


t2 = 0:0.1:tau;
y = t2/tau;
hold on
plot(t2,y,"LineWidth",3)

% respuesta a la rampa
figure
[y2,t]=lsim(T,t,t);
plot(t,t,t,y2,"LineWidth",3)

% respuesta al impulso
figure
[y3,t3]=impulse(T);
plot(t3,y3,"LineWidth",2)
