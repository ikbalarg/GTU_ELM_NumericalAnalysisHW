function sonADegerleri = newton12(xDegerleri,yDegerleri)
uzunluk=length(xDegerleri);
sonADegerleri=[]; %en son olan farkları tutacak
listeADegerleri=[]; % her bir adımdaki farkları tutacak 
if isempty(sonADegerleri)
    counter=2;
    for i=counter : uzunluk 23456
        hesaplananDeger=((yDegerleri(i)-yDegerleri(i-1))/(xDegerleri(i)-xDegerleri(i-1)));
        listeADegerleri(end+1)=hesaplananDeger;
    end
    sonADegerleri(end+1)=listeADegerleri(1);
    counter=counter+1;
   
end
if (length(sonADegerleri) ~=uzunluk-2) && (~isempty(sonADegerleri))
    altCounter=3;
    for a=3:uzunluk-1
        altUzunluk=length(listeADegerleri);
        counter=altCounter;
        counter2=1;
        for i=2:altUzunluk
            
            hesaplananDeger=((listeADegerleri(i)-listeADegerleri(i-1))/(xDegerleri(counter)-xDegerleri(counter2)));
            counter=counter+1;
            counter2=counter2+1;
            listeADegerleri(i-1)=hesaplananDeger;
        end
        altCounter=altCounter+1;
        sonADegerleri(end+1)=listeADegerleri(1);
        listeADegerleri=listeADegerleri(1:altUzunluk-1);
        listeADegerleri;

    end
end
if (length(sonADegerleri) ==uzunluk-2)
    counter1=uzunluk-2;
    hesaplananDeger=((listeADegerleri(2)-listeADegerleri(1))/(xDegerleri(uzunluk)-xDegerleri(1)));
    sonADegerleri(end+1)=hesaplananDeger;
end

end
