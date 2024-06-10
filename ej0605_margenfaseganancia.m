% margen de fase y margen de ganancia
K=50
G2 = tf(K,conv([1,0],conv([1,1],[1,5])));
T2 = tf(K,[1,6,5,K]);
figure(1)
hold on
bode(G2)
hold off

figure
margin(G2)

