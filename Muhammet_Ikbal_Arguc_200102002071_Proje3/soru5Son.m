syms a
m=log((abs(cos(3*a/4))^8 + abs(sin(3*a/4))^8)^(-1/4));
xfonksiyon= diff((((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4))*cos(a));
yfonksiyon=diff((((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4))*sin(a));
ht=m*sqrt(xfonksiyon^2+yfonksiyon^2);
f=matlabFunction(ht);
clear a
sonucGauss2 = gauss23(f,2*pi,0,1);
sonucGauss3=gauss23(f,2*pi,0,2);
function sonuc = gauss23(f,x,y,n)
    agirlikG2=[0.5773502691896257,-0.5773502691896257];
    katsayiG2=[1,1];
    agirlikG3=[0.7745966692414834 0 -0.7745966692414834];
    katsayiG3=[0.5555555555555556, 0.8888888888888888, 0.5555555555555556];
    fark=abs(x-y);
    farkBolu2=fark/2;
    if n==1
        sonuc=f((agirlikG2(1)*fark+fark)/2)*farkBolu2+f((agirlikG2(2)*fark+fark)/2)*farkBolu2;
    elseif n==2
        sonuc=0;
        for i=1:3
            a=katsayiG3(i)*f((agirlikG3(i)*fark+fark)/2)*farkBolu2;
            sonuc=sonuc+a;
        end
    end
end