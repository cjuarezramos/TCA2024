syms s
gp=10/(s*(s+1));

p_d=roots([1,3,9])

gpd = subs(gp,s,p_d(1))
agpd = angle(gpd)
agpd = double(agpd)
agpd = agpd*180/pi
phi_a = 180-agpd

% Método 1.
% alfa lo mas grande posible
plot(real(p_d),imag(p_d),'kx',"MarkerSize",10,"LineWidth",2)
hold on
plot([0,real(p_d(1))],[0,imag(p_d(1))],'r',"LineWidth",2)
plot([real(p_d(1))*2,real(p_d(1))],[imag(p_d(1)),imag(p_d(1))],'r',"LineWidth",2)


aPOPA = angle(p_d(1))*180/pi;
mPO = abs(p_d(1));
aPOPB = aPOPA/2
aOPOB = 180-angle(p_d(1))*180/pi;
aBPBO = 180-aPOPB-aOPOB
% Bisetriz PAPO
OB = mPO/sind(aBPBO)*sind(aPOPB)

B = 0 - OB;

plot([B,real(p_d(1))],[0,imag(p_d(1))],'b',"LineWidth",2)

%BC
aPCPB = phi_a/2;
aPDPB = phi_a/2;
aCBCP = 180-aPCPB-(180-aBPBO)
mBP = sqrt((B-real(p_d(1)))^2+(0-imag(p_d(1)))^2)

BC = mBP/sind(aCBCP)*sind(aPCPB);
C = B-BC;

plot([C,real(p_d(1))],[0,imag(p_d(1))],'k',"LineWidth",2)


%BD
aDBDP = 180-aPDPB-aBPBO;
BD = mBP/sind(aDBDP)*sind(aPDPB)
D = B+BD;

plot([D,real(p_d(1))],[0,imag(p_d(1))],'k',"LineWidth",2)

T = 1/abs(D)
alfa = D/C

Gc = tf([1, 1/T],[1,1/T/alfa])

Gp = tf(10,[1,1,0])

G = Gc*Gp
figure
rlocus(G)
Kc = 1.23;


gc = (s+1/T)/(s+1/T/alfa)

t = gc*gp/(1+gc*gp)
t = simplify(t)
[nt,dt] = numden(t) % divido en numerador y denomiandor
nt = coeffs(nt) % saco coeficientes de polinomio del numerador
dt = coeffs(dt) % saco coeficientes de poliniomio del denominador
nt = double(nt) % convierto de simbólico a doble
dt = double(dt)
nt = flip(nt) % invierto para que el mayor exponente me quede en la primera posición
dt = flip(dt)
nt = nt/dt(1) % divido entre el coeficiente mayor del denominador, para que me quede 1 en s de mayor potencia
dt = dt/dt(1)
T = tf(nt,dt) % Función de transferencia.
step(T)