bolunmusAralik=linspace(0,2*pi,360);
pFonksiyonu=@ (a) (abs(cos(3*a/4))^8 + abs(sin(3*a/4))^8)^(-1/4);
pFonkDegerler=[];
for i=bolunmusAralik
    pFonkDegerler(end+1)=pFonksiyonu(i);
end
[listeson]=cubicsplinetam(bolunmusAralik,pFonkDegerler);
plot(bolunmusAralik,listeson)

function [listeson]=cubicsplinetam(bolunmusAralik,pFonkDegerler)
    listeson=[];
    i=1;
    for j=1:length(bolunmusAralik)-2
        liste1=[bolunmusAralik(j),bolunmusAralik(j+1),bolunmusAralik(j+2)];
        liste2=[ pFonkDegerler(j),pFonkDegerler(j+1),pFonkDegerler(j+2)];
        [katsayilar]=kubikspline(liste1,liste2);
        fark=abs(liste1(2)-liste1(1));
        display(katsayilar)
        q=@(x) katsayilar(1)*((x-liste1(1))^3)+katsayilar(2)*(x-liste1(1))+liste2(1);
        q1=@(x) -1*katsayilar(1)*fark*(x-liste1(2))^3+katsayilar(1)*fark*3*(x-liste1(2))^2+(3*katsayilar(1)*fark^2+katsayilar(2))*(x-liste1(2))+liste2(2);
        if j<(length(bolunmusAralik))-2
            listeson(end+1)=q(liste1(1));
        end
        if j>=(length(bolunmusAralik))-2
            listeson(end+1)=q(liste1(1));
            listeson(end+1)=q(liste1(2));
            listeson(end+1)=q1(liste1(3));
        end
    end
end
function [katsayilar]=kubikspline(liste1,liste2)
    artisMiktari=abs(liste1(2)-liste1(1));
    a0=@(x) artisMiktari*(-1*(x-liste1(2))^3+3*(x-liste1(2))^2+3*artisMiktari*(x-liste1(2)));
    c0=@(x) x-liste1(2);
    a00=@(x)(x-liste1(1))^3;
    c00=@(x)(x-liste1(1));
    e1=[a0(liste1(3)) c0(liste1(3));
        a00(liste1(2)) c00(liste1(2))];
    e2=[liste2(3)-liste2(2);liste2(2)-liste2(1)];
    katsayilar=(e1)\e2;
end
