% B6'22
% G = (2s+1)/(s(s+1)(s+2))
% 1. Polos dominantes
ts = 3;
mp = 0.3;
sig = 4/ts;
wd = -sig/log(mp)*pi;
s1 = -sig+wd*1i;

% Verificar si cumple con solo K
numla = [2 1];
denp1 = conv([1 0],[1 1]);
denla = conv([1,2],denp1);
Go = tf(numla,denla)
% Gc1=tf(1,[1,.5])
Gc1=1;
G = Go*Gc1
figure(1)
rlocus(G)


K = 5
T = K*G/(1+K*G)
[y,t]=step(T);
figure(2)
plot(t,y)
hold on
plot([t(1),t(end)],[0.98,0.98]);
plot([t(1),t(end)],[1.02,1.02]);
hold off
% NO cumple
%% ya no requiero nada mas
%3. Deficiencia de angulo
syms s
g = (2*s+1)/(s*(s+1)*(s+2)*(s+.5));
ag = double(angle(subs(g,s,s1)))*180/pi
phiT = 180-ag

ngc = 2;
phi = phiT/ngc;


%4. calculo de cero y polo del gc
sz=1
gcz=s+sz;
agcz = angle(s1+sz)*180/pi
sp = imag(s1)/tand(agcz-phi)-real(s1)
Gc=tf([1,sz],[1,sp]);

% Gc = tf(1,[1,.5])
figure(3)
rlocus(Gc^ngc*G)

Kc = 20;


T=Kc*Gc^ngc*G/(1+Kc*Gc^ngc*G)
[y,t]=step(T);
figure(4)
plot(t,y)
hold on
plot([t(1),t(end)],[0.98,0.98]);
plot([t(1),t(end)],[1.02,1.02]);
hold off


