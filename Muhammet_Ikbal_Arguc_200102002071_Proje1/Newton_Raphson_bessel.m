x0=5;
tolerans=0.00000001;
baslangic=0;
l1=[];
while abs(10*besselj(0,x0))>tolerans
  %-10*besselj(1, x0)------> bessej fonksiyonunun türevlenmiş hali
  x=x0-10*besselj(0,x0)/(-10*besselj(1, x0));
  x0=x;
  baslangic=baslangic+1;
  l1(end+1)=x0;
  fprintf('%d\t%f\t%f\n',baslangic,x0,10*besselj(0,x0));
end