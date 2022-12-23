x0=2;
x1=3;
hata=0.00001;
step=1;
kontrol=true;
fx=@(x) -(1131064142526445*x^5)/144115188075855872 +(24607558901461501*x^4)/972777519512027136 + (374357809650495791*x^3)/540431955284459520 - (2516364790232543299*x^2)/675539944105574400 + (297428157421933753*x)/422212465065984000 + 10;
while kontrol==true
    x2 = x1 - (x1 - x0) * fx(x1) / ( fx(x1) - fx(x0) );
    fprintf('%d\t %f\t %f\n',step,x2,abs(fx(x2)));
    x0 = x1;
	x1 = x2;
    step = step + 1;
    kontrol = abs(fx(x2)) > hata;

end
fprintf('%d\t %f\t %f\n',step,x2,abs(fx(x2)));