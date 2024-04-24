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

plot([0-OB,real(p_d(1))],[0,imag(p_d(1))],'b',"LineWidth",2)

%BC
aPCPB = phi_a/2;
aPDPB = phi_a/2;
aCBCP = 180-aPCPB-(180-aBPBO)
BC = 
