x0=2;
x1=3;
hata=0.00001;
step=1;
kontrol=true;
while kontrol==true
    x2 = x1 - (x1 - x0) * besselj(0,x1) / ( besselj(0,x1) - besselj(0,x0) );
    fprintf('%d\t %f\t %f\n',step,x2,abs(besselj(0,x2)));
    x0 = x1;
	x1 = x2;
    step = step + 1;
    kontrol = abs(besselj(0,x2)) > hata;

end
fprintf('%d\t %f\t %f\n',step,x2,abs(besselj(0,x2)));