x0=5;
x1=6;
hata=0.00001;
step=1;
kontrol=true;
fx=@(x) - (23435*x^5)/2985984 + (12589*x^4)/497664 + (95759*x^3)/138240 - (1287349*x^2)/345600 + (101441*x)/144000 + 10;
while kontrol==true
    x2 = x1 - (x1 - x0) * fx(x1) / ( fx(x1) - fx(x0) );
    fprintf('%d\t %f\t %f\n',step,x2,abs(fx(x2)));
    x0 = x1;
	x1 = x2;
    step = step + 1;
    kontrol = abs(fx(x2)) > hata;

end
fprintf('%d\t %f\t %f\n',step,x2,abs(fx(x2)));