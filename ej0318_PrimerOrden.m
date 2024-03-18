close all
tau = 5;
T = tf(1,[tau 1]);
[x,t]=step(T,10);
plot(t,x,"LineWidth",3)
grid on


t2 = 0:0.1:tau;
y = t2/tau;
hold on
plot(t2,y,"LineWidth",3)
