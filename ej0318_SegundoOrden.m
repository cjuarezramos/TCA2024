close all

% Sistema de Segundo Orden
wn = 10*pi;
Z = 2;

syms s
sys = wn^2/(s^2+2*Z*wn*s+wn^2)
U = 1/s
Y = sys*U
y=ilaplace(Y)

yf = matlabFunction(y)

t=0:0.001:1;
plot(t,yf(t),"LineWidth",2)
grid on




% Otras formas de trabajar.
T = tf(wn^2,[1 2*Z*wn wn^2])


% polos
p=roots(T.Denominator{1});
disp(p)

% Respuesta al escalón
figure
[y2,t2]=step(T);
plot(t2,y2,"LineWidth",2)

% Casos sobreamortiguados
if 0
    Tsimplificada = tf(-p(2),[1 -p(2)])
    hold on
    [y3,t3]=step(Tsimplificada);
    plot(t3,y3,"LineWidth",2)
end


