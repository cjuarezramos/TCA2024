% Ejemplo 1
K=100;
T1=1;
T2=2;

GH = tf(K,conv([T1,1],[T2,1]))

% Diagrama de Nyquist
figure (1)
hold on
nyquist(GH)
hold off

% Ejemplo 2
K=1.5;
T1 = 2;
T2=1;
GH = tf(K,conv([1,0],conv([T1,1],[T2,1])))

% Diagrama de Nyquist
figure(2)
hold on 
nyquist(GH)
hold off


% Ejemplo 3
K=1;
T1 = 1;
T2=1;

GH = tf(K*[T2,1],conv([1,0,0],[T1,1]))

figure(3)
hold on
nyquist(GH)
hold off


% Ejemplo 4
K=1;
T = 1;
GH = tf(K,conv([1,0],[T,-1]))
figure(4)
nyquist(GH)


% Ejemplo 5
GH = tf([1,3],conv([1,0],[1,-1]))
figure(5)
nyquist(GH)

% Ejemplo 6

GH = tf(4*[1,0.5],[1,1,0,1])
figure(6)
nyquist(GH)
