kok1=5;
kok2=6;
hata=0.000001;
baslangic=0;
fx=@(x)-(1131064142526445*x^5)/144115188075855872 +(24607558901461501*x^4)/972777519512027136 + (374357809650495791*x^3)/540431955284459520 - (2516364790232543299*x^2)/675539944105574400 + (297428157421933753*x)/422212465065984000 + 10;
while abs((kok1-kok2)/kok1)>hata
  
  fa=  fx(kok1);
  fb= fx(kok2);
  icKok=(kok1+kok2)/2;
  fc=fx(icKok);
  
  if fa*fc>0
    kok1=icKok;
  else
    kok2=icKok;
  end
  baslangic=baslangic+1;
  
  fprintf('%d\t%f\t%f\t%f\t%f\n',baslangic,kok1,kok2,icKok,abs((kok1-kok2)/kok1))
  kok2-kok1;

  end
