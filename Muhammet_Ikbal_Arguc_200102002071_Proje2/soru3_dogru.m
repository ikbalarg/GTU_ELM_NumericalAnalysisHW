liste1=linspace(0,2*pi,360);
[listem,listem2]=hermiteDegerleri(liste1);
plot(listem2,listem);
function [listem,listem2]=hermiteDegerleri(liste1)
    turevli=@(a)((3*abs(cos((3*a)/4))^7*sin((3*a)/4 + (3*conj(a))/4))/(cos((3*a)/4)*cos((3*conj(a))/4))^(1/2) - (3*abs(sin((3*a)/4))^7*sin((3*a)/4 + (3*conj(a))/4))/(sin((3*a)/4)*sin((3*conj(a))/4))^(1/2))/(4*(abs(cos((3*a)/4))^8 + abs(sin((3*a)/4))^8)^(5/4));
    pFonksiyonu=@ (a)((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4);
    fDegerleri=[];
    turevliDegerler=[];
    for i=1:length(liste1)
        fDegerleri(end+1)=pFonksiyonu(liste1(i));
        turevliDegerler(end+1)=turevli(liste1(i));
    end
    listem=[];
    listem2=[];
    for i=1:length(liste1)-1
        k=[liste1(i),liste1(i+1)];
        kk=[fDegerleri(i),fDegerleri(i+1)];
        kkk=[turevliDegerler(i),turevliDegerler(i+1)];
        hesap=hermiteHesap(k,kk,kkk);
        l=[liste1(i),liste1(i+1)];
        if i<length(liste1)-1
           for j=1
                listem(end+1)=hesap(4)*l(j)^3+hesap(3)*l(j)^2+hesap(2)*l(j)+hesap(1);
                listem2(end+1)=liste1(i);
            end
        end
        if i==length(liste1)-1
            for j=1:2
                listem(end+1)=hesap(4)*l(j)^3+hesap(3)*l(j)^2+hesap(2)*l(j)+hesap(1);
                if j==1
                    listem2(end+1)=liste1(i); 
                end
                if j==2
                    listem2(end+1)=liste1(i+1);
                end
            end
        end
    end
end
function [cozum]=hermiteHesap(liste1,fDegerleri,turevliDegerler)
    a=1;
    at=0;
    b=@(x)x;
    bt=1;
    c=@(x)x^2;
    ct=@(x)2*x;
    d=@(x)x^3;
    dt=@(x)3*x^2;
    for i=1:length(liste1)/2
        deger=liste1(i);
        deger2=liste1(i+1);
        e1=[a b(deger) c(deger) d(deger);
            a b(deger2) c(deger2) d(deger2);
            0 bt ct(deger) dt(deger);
            0 bt ct(deger2) dt(deger2)];
        e2=[fDegerleri(i);fDegerleri(i+1);turevliDegerler(i);turevliDegerler(i+1)];
    end
    cozum=(e1)\e2;
end
