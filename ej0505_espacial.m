% ejemplo A6-13
syms s
gp = 1/s^2
h = 1/(0.1*s+1)

Gp = tf(1,[1,0,0]);
H = tf(1,[0.1,1]);
T0= Gp/(1+Gp*H)
step(T0)

% 1. Polos dominantes
Z = 0.5; wn=2;
pd = roots([1,2*Z*wn,wn^2])
pd1 = pd(1)

% 2. Solo K?
rlocus(Gp*H)
% no se puede

% 3. deficiencia de angulo
aGpH=double(angle(subs(gp*h,s,pd1)))*180/pi

phi = 180-aGpH

% 4. Calculo de cero y polo del controlador
sc = 0;
agpnum = double(angle(subs(s+sc,s,pd1)))*180/pi

agpden = agpnum - phi


