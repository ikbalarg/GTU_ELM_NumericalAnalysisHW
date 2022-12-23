kok1=5;
kok2=6;
hata=0.000001;
baslangic=0;
fx=@(x)- (23435*x^5)/2985984 + (12589*x^4)/497664 + (95759*x^3)/138240 - (1287349*x^2)/345600 + (101441*x)/144000 + 10;
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
