% Ejemplo compensador en atraso
% G(s)=K/(s*(s+1)(s+2));
% Requerimientos:
%   Factor de amortiguamiento: 0.5
%   Kv = 5 s^-1

% 1. Calculo polos dominantes 
denlap1 = conv([1,0],[1,1]);
denla = conv(denlap1,[1,2]);
G = tf(1,denla);
figure(1)
rlocus(G)
sgrid
% Polos dominantes:
r = rlocus(G,1.04);
pd = r(2);
K = 1.04;
T = K*G/(1+K*G);
figure;
[y,t]=step(T,100);

% 2. Calculo de Kv original
Kv = 0.52;

% 3. Necesidad de mejorar Kv?
% Kv solicitado es 5
% Por lo tanto:
B = 10; % B = Kv_solictado/Kv_original

% 4. Elegir cero y polos
% Gc=(s+sz)/(s+sp)
sz = 0.02; % "arbitrario"
sp=sz/B;

% corroborar aporte de 0 a -5
syms s
gc=(s+sz)/(s+sp);
agc = double(angle(subs(gc,s,pd)))*180/pi

% Calcular Kc
Gc=tf([1,sz],[1,sp])
figure
hold on;
rlocus(K*G*Gc)
Kc = 0.97;

Tc = K*G*Kc*Gc/(1+K*G*Kc*Gc);
[y1,t1]=step(Tc,100);

figure
plot(t,y,t1,y1)

t=0:0.01:100;
y=lsim(T,t,t);
yc=lsim(Tc,t,t);
figure
plot(t,t,t,y,t,yc,"LineWidth",2)

