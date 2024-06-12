% Ejercicio compensador en adelanto
G = tf(4,[1,2,0]);
margin(G)

% Paso 1 K para cumplir con Kv
K = 10;
G1 =tf(K*4,[1,2,0]);
margin(G1)

phim = 38;

alfa = (1-sind(phim))/(1+sind(phim))


gm = 20*log10(1/sqrt(alfa))

wc = 9;
T=1/(sqrt(alfa)*wc)
sz = 1/T
sp = 1/(alfa*T)

Kc = K/alfa

Gc = tf(Kc*[1,sz],[1,sp])
margin(G*Gc)

% graficas en el tiempo
FLC1 = feedback(G,1);
FLC2 = feedback(G*Gc,1);
t=0:0.01:6;
y1 = step(FLC1,t);
y2 = step(FLC2,t);
plot(t,y1,t,y2)

y3 = lsim(FLC1,t,t);
y4 = lsim(FLC2,t,t);
plot(t,y3,t,y4,t,t,"LineWidth",2)

% otro mas
G = tf(10,[1,1,0]);
margin(G)
K = 2

margin(K*G)
grid on

phim=44;
alfa = (1-sind(phim))/(1+sind(phim))
gcm = 20*log10(1/sqrt(alfa))

wc = 7;
T = 1/sqrt(alfa)/wc
sz = 1/T
sp = 1/(alfa*T)

Kc = K/alfa

Gc = tf(Kc*[1,sz],[1,sp])

margin(G*Gc)
