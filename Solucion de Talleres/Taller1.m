% Taller1

% data = readcell('Taller1_claves.xls');
% for i = 2:28
%     N(i-1,1) = data{i,1};
%     Nombre{i-1,1} = data{i,3};
%     Carnet{i-1,1} = data{i,2};
%     for j = 19:33
%         data_E1(i-1,j-18)=str2double(data{i,j});
%     end
% end
% save data_taller1 N Nombre Carnet data_E1;
close all
load data_taller1.mat

fprintf('Digite su numero de carnet: ')
alum_carnet = input('','s');
if length(alum_carnet) < 8
    n_c = length(alum_carnet);
    nzeros = 8 - n_c;
    for j=1:nzeros
        alum_carnet = ['0' alum_carnet];
    end
end
i = find(strcmp(Carnet,alum_carnet));
if ~isempty(i)
    
    while 1
        fprintf('Qué ejercicio quiere ver:\n')
        fprintf('\t1. Ejercicio 1a.\n')
        fprintf('\t2. Ejercicio 1b.\n')
        fprintf('\t3. Ejercicio 1c.\n')
        fprintf('\t4. Ejercicio 2a.\n')
        fprintf('\t5. Ejercicio 2b.\n')
        fprintf('\tOtro número Salir\n')
        opc = input('Su opción es: ');
        switch opc

            %% Ejercicio 1.a.
            case 1
                disp('Ejercicio 1.a:')
                syms s K;
                g1e1 = K/(s*(s+data_E1(i,1))*(s^2+s*data_E1(i,2)+data_E1(i,3)));
                disp('G(s)=')
                pretty(g1e1)
                disp('i.	Rangos del eje real que pertenece al lugar de las raíces:')
                fprintf ('\ts E [%3.2f,%3.2f]\n',-data_E1(i,1),0)
                disp('ii.	Número de asíntotas')
                fprintf('\tEl lugar de las raices tiene 4 asintotas\n');
                disp('iii.	Ángulos de asíntotas')
                fprintf('\tAsintota 1: 135°\n\tAsintota 2: 225°\n\tAsintota 3: 315°\n\tAsintota 4: 45°\n')
                disp('iv.	Centroide de asíntotas')
                deng1 = conv([1,0],conv([1,data_E1(i,1)],[1,data_E1(i,2),data_E1(i,3)]));
                centroide = sum(roots(deng1))/4;
                fprintf('\tCentroide de asintotas: %4.2f\n',centroide)
                disp('v.	Punto de ruptura')
                [num,den]=numden(g1e1);
                raizdK=double(solve(diff(den/num)));
                idxr1 = find(imag(raizdK)==0);
                r1 = raizdK(idxr1);
                idxrup = find(r1>-data_E1(i,1)&&r1<0);
                pRuptura=r1(idxrup);
                fprintf('\tPunto de ruptura es:%4.2f\n',pRuptura)
                disp('vi.	Ángulo de salida de los polos de lazo abierto')
                polos = roots(deng1);
                idxcplx = find(imag(polos)>0);
                p1 = polos(idxcplx);
                ang_sal = -pi-angle(p1)-angle(p1+data_E1(i,1))-pi/2;
                ang_sal = ang_sal*180/pi + 360;
                fprintf('\tAngulo de salida es: %6.2f°\n',ang_sal)
                disp('vii.	Valores de cruce por eje imaginario')
                Kimg=data_E1(i,1)*data_E1(i,3)*(data_E1(i,1)^2*data_E1(i,2)+data_E1(i,1)*data_E1(i,2)^2+data_E1(i,2)*data_E1(i,3))/(data_E1(i,1)+data_E1(i,2))^2;
                dent1 = deng1;
                dent1(end) = Kimg;
                polos_osc = roots(dent1);
                idxp = find(abs(real(polos_osc))<1e-5);
                fprintf('\tPara un K = %5.2f el lugar de las raices cruza el eje jw en:\n',Kimg)
                fprintf('\t\t0+j%5.2f y 0-j%5.2f\n',imag(polos_osc(idxp(1))),imag(polos_osc(idxp(1))))
                figure(1)
                subplot(1,3,1)
                G1 = tf(1,conv([1,0],conv([1,data_E1(i,1)],[1,data_E1(i,2),data_E1(i,3)])));
                rlocus(G1)
                title('Ejercicio 1.a.')

                disp('Enter para continuar')
                pause

                %% Ejercico 1 b
            case 2
                disp('Ejercicio 1.b:')
                g2e1 = K*(s+data_E1(i,4))/s^2;
                disp('G(s)=')
                pretty(g2e1)
                disp('i.	Rangos del eje real que pertenece al lugar de las raíces:\n')
                fprintf ('\ts E ]-inf,%3.2f]\n',-data_E1(i,4))
                disp('ii.	Número de asíntotas\n')
                fprintf('\tUna asintota\n')
                disp('iii.	Ángulos de asíntotas\n')
                fprintf('\tEl angulo es de 180°\n')
                disp('iv.	Punto de ingreso\n')
                [num,den]=numden(g2e1);
                raizdK=double(solve(diff(den/num)));
                idxr1 = find(imag(raizdK)==0);
                r1 = raizdK(idxr1);
                idxrup = find(r1<-data_E1(i,4));
                pingreso=r1(idxrup);
                fprintf('\tPunto de ingreso es:%4.2f\n',pingreso)


                G2 = tf([1,data_E1(i,4)],[1,0,0]);
                subplot(1,3,2)
                rlocus(G2)
                title('Ejercicio 1.b.')
                disp('Enter para continuar')
                pause

                %% Ejercicio 1.c.
            case 3
                disp('Ejercicio 1.c:')
                g3e1 = K/((s+data_E1(i,5))*(s+data_E1(i,6))*(s+data_E1(i,7))*(s+data_E1(i,8)));
                disp('G(s)=')
                pretty(g3e1)
                disp('i.	Rangos del eje real que pertenece al lugar de las raíces:')
                polos=[-data_E1(i,5),-data_E1(i,6),-data_E1(i,7),-data_E1(i,8)];
                polos = sort(polos,'descend');
                fprintf ('\ts E [%5.2f,%5.2f] U [%5.2f,%5.2f] \n',polos(2),polos(1),polos(4),polos(3))
                disp('ii.	Número de asíntotas')
                fprintf('\tExisten 4 asintotas\n')
                disp('iii.	Ángulos de asíntotas')
                fprintf('\tAsintota 1: 135°\n\tAsintota 2: 225°\n\tAsintota 3: 315°\n\tAsintota 4: 45°\n')
                disp('iv.	Centroide de asíntotas')
                centroide = sum(polos)/4;
                fprintf('\tCentroide de asintotas: %4.2f\n',centroide)
                disp('v.	Puntos de ruptura')
                [num,den]=numden(g3e1);
                raizdK=double(solve(diff(den/num)));
                idxr1 = find(imag(raizdK)==0);
                r1 = raizdK(idxr1);
                idxrup1 = find(r1>polos(2)&r1<polos(1));
                idxrup2 = find(r1>polos(4)&r1<polos(3));
                pRuptura1=r1(idxrup1);
                pRuptura2=r1(idxrup2);
                fprintf('\tPunto de ruptura 1 es:%4.2f\n',pRuptura1)
                fprintf('\tPunto de ruptura 2 es:%4.2f\n',pRuptura2)
                disp('vi.	Valores de cruce por eje imaginario')
                a = conv([1,data_E1(i,5)],[1,data_E1(i,6)]);
                b = conv([1,data_E1(i,7)],[1,data_E1(i,8)]);
                den = conv(a,b);
                Kimg = den(4)*(den(2)*den(3)-den(1)*den(4))/den(2)^2-den(5);
                den(5) = den(5)+Kimg;
                pls_osc=roots(den);
                idxp = find(abs(real(pls_osc))<1e-5);
                fprintf('\tPara un K = %5.2f el lugar de las raices cruza el eje jw en:\n',Kimg)
                fprintf('\t\t0+j%5.2f y 0-j%5.2f\n',imag(pls_osc(idxp(1))),imag(pls_osc(idxp(1))))
                G3 = tf(1,conv(a,b));
                subplot(1,3,3)
                rlocus(G3)
                title('Ejercicio 1.c.')
                disp('Enter para continuar')
                pause

                %% Ejercicio 2
            case 4
                s1 = data_E1(i,10);
                s2 = data_E1(i,11);
                Kh_l = 1/(s1+s2);
                fprintf('i. Para que el sistema sea estable debe cumplirse:\n')
                fprintf('\t1. K>0\n')
                fprintf('\t2. Si Kh>%5.2f el sistema es siempre estable si K>0\n',Kh_l)
                fprintf('\t3. Sin embargo, sugiero un Kh<%5.2f\n',Kh_l)
                Kh = input('Para continuar, elija un valor de Kh = ');
                Gla = tf([Kh,1],[1,s1+s2,s1*s2,0]);
                figure(2)
                rlocus(Gla)
                title('ii. Lugar de las raices del ejercicio 2.a.')
                [r,k] = rlocus(Gla);
                sobr_enl=exp(-real(r)./abs(imag(r))*pi);
                [a,b,c] = find(sobr_enl>10&sobr_enl<15);
                fprintf('iii. Algunos valores de K que cumplen con el requerimiento de una sobre enlongación de 10%% a 15%% son:\n')
                for j = 1: length(b)
                    fprintf('Con K = %6.2f obtiene: \n',k(b(j)))
                    fprintf('\tpolo lazo cerrado en %6.4f +j%6.4f\n',real(r(a(j),b(j))),imag(r(a(j),b(j))));
                    fprintf('\tSobreenlongación: %5.2f%%\n',sobr_enl(a(j),b(j)))
                end
                Kc = input('Ingrese el valor de K que desea emplear: ');


                T = tf(Kc,[1,s1+s2,s1*s2+Kc*Kh,Kc]);

                disp('Polos de lazo cerrado: ');
                polos = roots(T.denominator{1});
                disp(polos)
                disp('Sobrenelongación teórica: ')
                disp(exp(-real(polos)./abs(imag(polos))*pi))
                [y,t] = step(T);
                figure(3)
                plot(t,y)
                title('iv. Respuesta al escalón ejercicio 2.a.')
                xlabel('Tiempo (s)')
                ylabel('y(t)')
                Kp = Inf;
                Kv = Kc/(s1*s2+Kc*Kh);
                Ka = 0;
                fprintf('v. Las constantes de error estáticas son:\n')
                fprintf('\tPosición: %f\n\tVelocidad:%5.2f\n\tAceleración: %g\n',Kp,Kv,Ka)
                disp('Enter para continuar')
                pause

                %% ejercicio 3
            case 5
                A = data_E1(i,13);
                sp1 = data_E1(i,15);
                sz = data_E1(i,14);
                sp2 = data_E1(i,12);
                Gla = tf(A*[1,sz],conv([1,0],conv([1,sp1],[1,sp2])));
                rlocus(Gla)
                [r,k] = rlocus(Gla);
                Z = -real(r)./abs(r);
                [a,b,c]=find(Z>0.45&Z<0.55);
                disp('ii. algunas posibilidades de K con Factor de amortiguamiento entre 0.45 y 0.55: ')
                for j = 1: length(b)
                    fprintf('Con K = %6.2f obtiene: \n',k(b(j)))
                    fprintf('\tpolo lazo cerrado en %6.4f +j%6.4f\n',real(r(a(j),b(j))),imag(r(a(j),b(j))));
                    fprintf('\tFactor de amortiguamiento: %5.2f\n',Z(a(j),b(j)))
                end

                K = input('Ingrese el valor de K para cumplir con el requerimiento: ');



                T = tf(K*A*[1,sz],[1,sp1+sp2,sp1*sp2+A*K,A*K*sz]);

                disp('Polos de lazo cerrado: ');
                polos = roots(T.denominator{1});
                disp(polos)
                disp('Factor de amortiguamiento teórico: ')
                disp(-real(polos)./abs(polos))
                [y,t] = step(T);
                figure(4)
                plot(t,y)
                title('iii. Respuesta al escalón ejercicio 2.a.')
                xlabel('Tiempo (s)')
                ylabel('y(t)')
                Kp = Inf;
                Kv = A*K*sz/(sp1*sp2);
                Ka = 0;
                fprintf('v. Las constantes de error estáticas son:\n')
                fprintf('\tPosición: %f\n\tVelocidad:%5.2f\n\tAceleración: %g\n',Kp,Kv,Ka)

                r = rlocus(Gla,K);

            otherwise
                break;
        end
    end


else
    disp('Error en el ingreso de carnet')
end
