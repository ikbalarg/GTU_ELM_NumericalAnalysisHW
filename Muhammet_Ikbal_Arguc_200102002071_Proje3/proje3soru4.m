bolunmusAralik=linspace(0,2*pi,360);
pFonksiyonu=@ (a) (abs(cos(3*a/4))^8 + abs(sin(3*a/4))^8)^(-1/4);
pFonkDegerler=[];
for i=bolunmusAralik
    pFonkDegerler(end+1)=pFonksiyonu(i);
end
[listeson]=cubicsplinetam(bolunmusAralik,pFonkDegerler);
[x1,y1]=geriFark(bolunmusAralik,listeson);
[x2,y2]=ileriFark(bolunmusAralik,listeson);
[x3,y3]=aranokta(bolunmusAralik,listeson);
[x4,y4]=ucNokta(bolunmusAralik,listeson);
plot(x1,y1)
hold on
plot(x2,y2);
hold on
plot(x3,y3);
hold on
plot(x4,y4);
function [xDegerleri,turevDegerleri]=geriFark(x_liste,y_liste)
    xDegerleri=[];
    turevDegerleri=[];
    for i=2:length(x_liste)
        x=y_liste(i);
        y=y_liste(i-1);
        fark=abs(x_liste(2)-x_liste(1));
        sonuc=(x-y)/(fark);
        xDegerleri(end+1)=x_liste(i);
        turevDegerleri(end+1)=sonuc;
    end
end
function [xDegerleri,turevDegerleri]=ileriFark(x_liste,y_liste)
    xDegerleri=[];
    turevDegerleri=[];
    for i=1:length(x_liste)-1
        x=y_liste(i+1);
        y=y_liste(i);
        fark=abs(x_liste(2)-x_liste(1));
        sonuc=(x-y)/(fark);
        xDegerleri(end+1)=x_liste(i);
        turevDegerleri(end+1)=sonuc;
    end
end
function [xDegerleri,turevDegerleri]=ucNokta(x_liste,y_liste)
    xDegerleri=[];
    turevDegerleri=[];
    for i=1:length(x_liste)-2
        x=y_liste(i);
        y=y_liste(i+1);
        z=y_liste(i+2);
        fark=abs(x_liste(i+1)-x_liste(i));
        sonuc = (-3*x+4*y-z)/(2*fark);
        xDegerleri(end+1)=x_liste(i);
        turevDegerleri(end+1)=sonuc;
    end
    for i=length(x_liste)-1:length(x_liste)
        x=y_liste(i);
        y=y_liste(i-1);
        z=y_liste(i-2);
        fark=abs(x_liste(i)-x_liste(i-1));
        sonuc = (-3*x+4*y-z)/(2*fark)*-1;
        xDegerleri(end+1)=x_liste(i);
        turevDegerleri(end+1)=sonuc;
    end
end

function [xDegerleri,turevDegerleri]=aranokta(x_liste,y_liste)
    turevDegerleri=[];
    xDegerleri=[];
    for i=2:length(x_liste)-1
        x1=y_liste(i-1);
        x2=y_liste(i+1);
        fark=abs(x_liste(i)-x_liste(i-1));
        sonuc=(x2-x1)/(2*fark);
        turevDegerleri(end+1)=sonuc;
        xDegerleri(end+1)=x_liste(i);
    end
end

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

