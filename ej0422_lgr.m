% Ejemplo 6-10, servo con retroalimentacion de velocidad
% Lugar de las raices


% obtengo k desde el lugar de las raices que me de un factor de
% amortiguamiento de 0.4
k = 1.4
num_lc=20;
den_lc=[1, 5, 4+20*k, 20];
sys_lc = tf(num_lc,den_lc);
figure(2)
step(sys_lc)
