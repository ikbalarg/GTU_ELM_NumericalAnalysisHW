xDegerleri=[0 1.2 2.4 3.6 4.8 6];
yDegerleri=[10.0000 6.7113 0.0251 -3.9177 -2.4043 1.5065];
x_cnt=[0:0.0001:6];
newtonSonucListesi=[];
LagrangeSonucListesi=[];
for i=1:length(x_cnt)
    x=x_cnt(i);
    sonADegerleri=newton12(xDegerleri,yDegerleri);
    newtonSonucListesi(end+1)=nbfi(x,sonADegerleri,xDegerleri,yDegerleri);
    LagrangeSonucListesi(end+1)=lagrangefonk(x,xDegerleri,yDegerleri);
end
plot(x_cnt,newtonSonucListesi,"--k")
hold on
plot(x_cnt,LagrangeSonucListesi,":b")
hold on
plot(x_cnt,10*besselj(0,x_cnt))%besselj fonk
