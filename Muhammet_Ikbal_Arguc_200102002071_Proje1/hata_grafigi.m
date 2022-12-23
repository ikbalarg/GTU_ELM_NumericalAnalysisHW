xDegerleri=[0 1.2 2.4 3.6 4.8 6];
yDegerleri=[10.0000 6.7113 0.0251 -3.9177 -2.4043 1.5065];
x_cnt=[0:0.0001:6];
LagrangeSonucListesi=[];
bessListesi=[];
for i=1:length(x_cnt)
    x=x_cnt(i);
    LagrangeSonucListesi(end+1)=lagrangefonk(x,xDegerleri,yDegerleri);
    y=10*besselj(0,x);
    bessListesi(end+1)=y;
end
hata=abs(bessListesi-LagrangeSonucListesi);
plot(x_cnt,hata);