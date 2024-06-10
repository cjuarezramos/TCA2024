% Sistema tipo 1

K=50
G2 = tf(K,conv([1,0],conv([1,1],[1,5])))

figure(1)
hold on
nyquist(G2)
hold off

% Lazo cerrado 
T2 = tf(K,[1,6,5,K])

polos=roots(T2.Denominator{1});
figure(2)
hold on
plot(real(polos),imag(polos),'xy',"LineWidth",2)
hold off
grid on

% respuesta al escalon
[y,t]=step(T2,60);
figure(3)
hold on
plot(t,y)
hold off