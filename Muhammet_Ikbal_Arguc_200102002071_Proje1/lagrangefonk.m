function deger=lagrangefonk(x,xDegerleri,yDegerleri)
    uzunluk=length(xDegerleri); %dizi uzunlugu
    deger = 0;
    for i=1 : uzunluk
        icToplam=1; 
        for j=1 :uzunluk 
           if j~=i 
               icToplam=icToplam* ((x-xDegerleri(j))/(xDegerleri(i)-xDegerleri(j)));
                    
           end
        end
        deger=deger+yDegerleri(i)*icToplam;
    end    
end