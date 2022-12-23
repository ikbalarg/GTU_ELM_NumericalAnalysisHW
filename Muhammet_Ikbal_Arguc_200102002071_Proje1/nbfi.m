
function cikti = nbfi(x,sonADegerleri,xDegerleri,yDegerleri)
uzunluk=length(xDegerleri);
cikti=yDegerleri(1);
l1=[];
count=1;
for i=1:uzunluk-1
    deger=1;
    for a=1:i
        deger=deger*(x-xDegerleri(a));
    end
    a1=deger*sonADegerleri(count);
    cikti=cikti+a1;
    count=count+1;

end
