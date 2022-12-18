bolunmusAralik=linspace(0,2*pi,360);
pFonksiyonu=@ (a) (abs(cos(3*a/4))^8 + abs(sin(3*a/4))^8)^(-1/4);
pFonkDegerler=[];%pFonksiyonunun değerlerinin tutulduğu bir liste
xFonksiyonu=[];%xFonksiyonunun değerlerinin tutulduğu bir liste
yFonksiyonu=[];%yFonksiyonunun değerlerinin tutulduğu bir liste
for i=bolunmusAralik
    pFonkDegerler(end+1)=pFonksiyonu(i);
    xFonksiyonu(end+1)=cos(i)*pFonksiyonu(i);
    yFonksiyonu(end+1)=sin(i)*pFonksiyonu(i);
end
polarplot(bolunmusAralik,pFonkDegerler); 

%plot(xFonksiyonu,yFonksiyonu);
