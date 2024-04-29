% ejemplo G(s) = 10/(s*(s+1))
% Requerimientos
Z = 0.5;
wn = 3;
% 1. Polos dominantes
% polinomio de la ecuacion caracteristica>
pec = [1,2*Z*wn,wn^2];
pd = roots(pec);
pd1=(pd(1))

% 2. Verificar si solo con K
Gp = tf(10,conv([1,0],[1,1]))

% Lugar de las raices
rlocus(Gp)

% resultado paso 2, no se puede.


% 3. Calcular deficiencia de angulo
syms s
gp =10/(s*(s+1))
gp_pd1 = subs(gp,s,pd1)% sustituy s por pd1
gp_pd1 = double(gp_pd1)% cambia simbolico a numero
agp = angle(gp_pd1)*180/pi

phi = 180-agp % deficiencia de angulo

% 4. Calcular polo y cero
% metodo 2
sz=1;
% angulo de monomio numerador del controlador
gcnum=(s+sz)
agcnum=double(angle(subs(gcnum,s,pd1)))*180/pi
agcden = agcnum - phi
sp = imag(pd1)/tand(agcden)-real(pd1)

gc = (s+sz)/(s+sp)
agc = double(angle(subs(gc,s,pd1)))*180/pi

ag = double(angle(subs(gc*gp,s,pd1)))*180/pi

% 5. Calcular Kc
% funcion de transferencia de lazo abierto

numla=conv(10,[1,sz]);
denla=conv(conv([1,0],[1,1]),[1,sp])
gla = tf(numla,denla)

rlocus(gla)
Kc = 0.9;






