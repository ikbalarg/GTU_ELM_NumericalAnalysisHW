fonksiyon=@(a) (((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4));
aralik=linspace(0,2*pi,360);
[x,y]=geriFark(fonksiyon,aralik);
[m,n]=aranokta(fonksiyon,aralik);
[l,k]=ileriFark(fonksiyon,aralik);
[z,q]=ucNokta(fonksiyon,aralik);
plot(x,y);
hold on
plot(m,n);
hold on
plot(l,k);
hold on
plot(z,q);
function [x,y]=ucNokta(fonksiyon,aralik)
    x=[];
    y=[];
    for i=1:length(aralik)-2
        xSonuc=(-3*fonksiyon(aralik(i))+4*fonksiyon(aralik(i+1))-fonksiyon(aralik(i+2)))/(2*(abs(aralik(i+1)-aralik(i))));
        x(end+1)=aralik(i);
        y(end+1)=xSonuc;
    end
    for i=length(aralik)-1:length(aralik)
        xSonuc=(-3*fonksiyon(aralik(i))+4*fonksiyon(aralik(i-1))-fonksiyon(aralik(i-2)))/(2*(abs(aralik(i)-aralik(i-1))));
        x(end+1)=aralik(i);
        y(end+1)=xSonuc;
    end
end
function [x,y]=aranokta(xfonksiyon,aralik)
    x=[];
    y=[];
    for i=2:length(aralik)-1
        xSonuc=(xfonksiyon(aralik(i+1))-xfonksiyon(aralik(i-1)))/(2*abs(aralik(i)-aralik(i-1)));
        x(end+1)=aralik(i);
        y(end+1)=xSonuc;
    end
end
function [x,y]=ileriFark(xfonksiyon,aralik)
    x=[];
    y=[];
    for i=1:length(aralik)-1
        xSonuc=(xfonksiyon(aralik(i+1))-xfonksiyon(aralik(i)))/(abs(aralik(i+1)-aralik(i)));
        x(end+1)=aralik(i);
        y(end+1)=xSonuc;
    end
end
function [x,y]=geriFark(xfonksiyon,aralik)
    x=[];
    y=[];
    for i=2:length(aralik)
        xSonuc=(xfonksiyon(aralik(i))-xfonksiyon(aralik(i-1)))/(abs(aralik(i)-aralik(i-1)));
        x(end+1)=aralik(i);
        y(end+1)=xSonuc;
    end
end
