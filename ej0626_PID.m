% ejemplo PID ziegler-Nichols
G = tf(1,conv([1,0],conv([1,1],[1,5])))
rlocus(G)
Kcr=30;
Flc = feedback(Kcr*G,1)
polos_lc = roots(Flc.Denominator{1})

Pcr = 1/imag(polos_lc(2)/2/pi)

% Proporcional
Kp = 0.5*Kcr;
FLC_P = feedback(Kp*G,1)
t=0:0.01:30;
figure(2)
title('Respuesta al escalon')
yp=step(FLC_P,t);
plot(t,ones(1,length(t)),'k',"LineWidth",2)
hold on
plot(t,yp,'b',"LineWidth",2)
hold off

ypl=lsim(FLC_P,t,t);
figure(3)
title('Respuesta a la rampa')
plot(t,t,"k","LineWidth",2)
hold on
plot(t,ypl,"b","LineWidth",2)
hold off


% PI
Kp = 0.45*Kcr;
Ti = Pcr/1.2;

Gc = Kp*(1+tf(1,[Ti,0]))
FLC_PI = feedback(Gc*G,1)
figure(2)
yp=step(FLC_PI,t);
hold on
plot(t,yp,'r',"LineWidth",2)
hold off

ypl=lsim(FLC_PI,t,t);
figure(3)
hold on
plot(t,ypl,"r","LineWidth",2)
hold off

% PID
Kp = 0.6*Kcr;
Ti = 0.5*Pcr;
Td = 0.125*Pcr;
Gc = Kp*(1+tf(1,[Ti,0])+tf([Td,0],1))
FLC_PID = feedback(Gc*G,1);
figure(2)
yp=step(FLC_PID,t);
hold on
plot(t,yp,'c',"LineWidth",2)
hold off

ypl=lsim(FLC_PID,t,t);
figure(3)
hold on
plot(t,ypl,"c","LineWidth",2)
hold off


% MOdificando PID
K = 0.075*Kcr*Pcr;
sz=4/Pcr;
sz=0.65;
K = K*0.48
Gc = K*(tf(conv([1,sz],[1,sz]),[1,0]));
figure(4)
rlocus(G*Gc)
sgrid


FLC_PID_modif = feedback(Gc*G,1);
figure(5)
step(FLC_PID_modif)

