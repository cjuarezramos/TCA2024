% Ejemplo 6-16
% G=10/(s*(s+2)(s+8))

% 1. Requerimientos:
pd1 = -2+2*sqrt(3)*1i;
Kv = 80;

% 2. Cumplo con K la respuesta transitoria
numla = 10;
den1 = conv([1,0],[1,2]);
denla = conv(den1,[1,8]); 
G=tf(numla,denla)
rlocus(G)
% NO se cumple por lo que requiero un control en adelanto.

% 3. Cumplo con respuesta estacionaria
syms s;
g=10/s/(s+2)/(s+8);
Kv_orig=double(subs(s*g,s,0))
% NO cumple, requiero un compensador en atraso

% 4 Controlador a utilizar:
% Gc=Kc(s+sz1)/(s+sp1)*(s+sz2)/(s+sp2)

% 4.1 Adelanto primero.
% a. Deficiencia de angulo
ag=double(angle(subs(g,s,pd1)))*180/pi
phi = 180 - ag;
% b. Calculo de sz1 y sp1
sz1 = 2;
agcz = angle(pd1+sz1)*180/pi;
agcp=agcz-phi;
sp1 = imag(pd1)/tand(agcp)-real(pd1)

% Calculo Kc
Gc1=tf([1,sz1],[1,sp1]);
rlocus(G*Gc1)
Kc=19.2;

% Calculo de Beta
Kv_nuevo = 19.2*5/32
Beta = 80/3;

sz2=0.1
sp2=sz2/Beta;
gc2=(s+sz2)/(s+sp2)

agc2=double(angle(subs(gc2,s,pd1)))*180/pi

Gc2=tf([1,sz2],[1,sp2]);

rlocus(G*Gc1*Gc2*Kc)




