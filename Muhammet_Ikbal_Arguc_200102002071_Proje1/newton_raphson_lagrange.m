x0=5;
tolerans=0.00000001;
baslangic=0;
l1=[];
fx=@(x) - (23435*x^5)/2985984 + (12589*x^4)/497664 + (95759*x^3)/138240 - (1287349*x^2)/345600 + (101441*x)/144000 + 10;
turevlifx=@(x) - (117175*x^4)/2985984 + (12589*x^3)/124416 + (95759*x^2)/46080 - (1287349*x)/172800 + 101441/144000;
while abs(fx(x0))>tolerans
  x=x0-fx(x0)/turevlifx(x0);
  x0=x;
  baslangic=baslangic+1;
  l1(end+1)=x0;
  fprintf('%d\t%f\t%f\n',baslangic,x0,(fx(x0)));
end