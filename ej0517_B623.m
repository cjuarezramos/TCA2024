% B6'23
% G = (1)/(s^2(s+4))
% 1. Polos dominantes
close all
ts = 5;
mp = 0.1;
sig = 4/ts;
wd = -sig/log(mp)*pi;
s1 = -sig+wd*1i;

% 2. Lugar de las raices solo para K
numla = 1;
denla = conv([1,0,0],[1,4]);
G = tf(numla,denla)
figure(1)
rlocus(G)
title('Lugar de las raices original')

% Deficiencia de angulo
syms s
g = 1/(s^2*(s+4));
ag = double(angle(subs(g,s,s1)))*180/pi
phiT = 180-ag;
ngc=2;
phi=phiT/ngc


% Polos y ceros de controlador
sz=3
gcz=s+sz;
agcz = angle(s1+sz)*180/pi
sp = imag(s1)/tand(agcz-phi)-real(s1)
Gc=tf([1,sz],[1,sp])

% Kc
Gn = G * Gc^ngc
figure(2)
rlocus(Gn)
title('Lugar de las raices con Gc')

Kc = 14.7


% comprobando
T = Kc*Gn/(1+Kc*Gn);
[y,t]=step(T)
figure(3)
plot(t,y)
hold on
plot([t(1),t(end)],[0.98,0.98]);
plot([t(1),t(end)],[1.02,1.02]);
hold off



% Método 1.
% alfa lo mas grande posible
plot(real(s1),imag(s1),'kx',"MarkerSize",10,"LineWidth",2)
hold on
plot([0,real(s1)],[0,imag(s1)],'r',"LineWidth",2)
plot([real(s1)*2,real(s1)],[imag(s1),imag(s1)],'r',"LineWidth",2)


aPOPA = angle(s1)*180/pi;
mPO = abs(s1);
aPOPB = aPOPA/2
aOPOB = 180-angle(s1)*180/pi;
aBPBO = 180-aPOPB-aOPOB
% Bisetriz PAPO
OB = mPO/sind(aBPBO)*sind(aPOPB)

B = 0 - OB;

plot([B,real(s1)],[0,imag(s1)],'b',"LineWidth",2)

%BC
aPCPB = phi/2;
aPDPB = phi/2;
aCBCP = 180-aPCPB-(180-aBPBO)
mBP = sqrt((B-real(s1))^2+(0-imag(s1))^2)

BC = mBP/sind(aCBCP)*sind(aPCPB);
C = B-BC;

plot([C,real(s1)],[0,imag(s1)],'k',"LineWidth",2)


%BD
aDBDP = 180-aPDPB-aBPBO;
BD = mBP/sind(aDBDP)*sind(aPDPB)
D = B+BD;

plot([D,real(s1)],[0,imag(s1)],'k',"LineWidth",2)

T = 1/abs(D)
alfa = D/C

Gc = tf([1, 1/T],[1,1/T/alfa])
G
Gp = tf(10,[1,1,0])

G = Gc*Gp
figure
rlocus(G)
Kc = 1.23;