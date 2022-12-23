kok1=5;
kok2=6;
hata=0.000001;
baslangic=0;
while abs((kok1-kok2)/kok1)>hata
  
  fa=  10*besselj(0,kok1);
  fb= 10*besselj(0,kok2);
  icKok=(kok1+kok2)/2;
  fc=10*besselj(0,icKok);
  
  if fa*fc>0
    kok1=icKok;
  else
    kok2=icKok;
  end
  baslangic=baslangic+1;
  
  fprintf('%d\t%f\t%f\t%f\t%f\n',baslangic,kok1,kok2,icKok,abs((kok1-kok2)/kok1))
  kok2-kok1;

  end
