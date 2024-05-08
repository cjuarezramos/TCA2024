% Gp = 1/s^2

% Requerimientos:
Z = 0.5;
wn = 2;

pd = roots([1,2*Z*wn,wn^2]);

% 2. Probar solo si lo logro con K
% Funcion de transferencia de lazo abierto:
Gp = tf(1,[1,0,0]);
H = tf(1,[0.1,1]);
figure(1)
rlocus(Gp*H)


% Deficiencia de angulo
pd1=pd(1)

syms s
gp = 1/s^2
h = 1/(0.1*s+1)
% calcular el angulo de la funcion de transferencia de lazo abierto
% para el polo dominante 
agph = double(angle(subs(gp*h,s,pd1)))*180/pi
phiT = 180-agph;
ngc = 3; % cantidad de compensadores
phi = phiT/ngc;

% calculo de polo y cero del compensador
sz = 4
agcz=angle(pd1+sz)*180/pi
agcp=agcz-phi

sp = imag(pd1)/tand(agcp)-real(pd1)


gc = (s+sz)/(s+sp)
agc = double(angle(subs(gc,s,pd1)))*180/pi

% Funcion de transferencia de lazo abierto con controlador
Gc = tf([1,sz],[1,sp])
FTLA = Gc^ngc*Gp*H
figure(2)
rlocus(FTLA)

Kc = 339;


% funcion de transferencia en lazo cerrado
T = Kc*Gc^ngc*Gp/(1+Kc*Gc^ngc*Gp*H)
figure(3)
step(T)
roots(T.Denominator{1})
roots(T.Numerator{1})
