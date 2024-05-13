% ejemplo 6.14
% G(s)=1/(1000*(s^2-1.1772)

% 1. Requirimientos
Z=0.7;
wn=0.5;
% polos dominantes:
pd = roots([1,2*Z*wn,wn^2]);
pd1=pd(1);

% 2. Corroborrar si basta solo K
G=tf(1,1000*[1,0,-1.1772])
rlocus(G)

% 3. Deficiencia de angulo
syms s
g=1/1000/(s^2-1.1772);
ag=double(angle(subs(g,s,pd1)))*180/pi;
phi = 180-ag;

% 4. Calculo de Td
sz =imag(pd1)/tand(phi)-real(pd1);

% 5. Calcular Kc
GcG=tf([1,sz],1000*[1,0,-1.1772])
rlocus(GcG)
sgrid
Kc = 700;
% Tiempo derivativo:
Td = 1/sz
% Constante proporcional
Kp = Kc/Td

% Respuesta al escalon
T=tf(Kc*[1,sz],[1000,Kc,-1000*1.1772+Kc*sz])

[x,t]=step(T,50);
plot(t,x)



