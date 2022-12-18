xfonksiyon=@(a) (((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4))*cos(a);
yfonksiyon=@(a)(((abs(cos(3*a/4))^8) + (abs(sin(3*a/4))^8))^(-1/4))*sin(a);
aralik=linspace(0,2*pi,360);
%[x,y]=aranokta(xfonksiyon,yfonksiyon,aralik);
%[x,y]=sonNokta(xfonksiyon,yfonksiyon,aralik);
%[x,y]=ileriFark(xfonksiyon,yfonksiyon,aralik);
%[x,y]=ileriFark(xfonksiyon,yfonksiyon,aralik);
%[x,y]=geriFark(xfonksiyon,yfonksiyon,aralik);
%[x,y]=aranokta(xfonksiyon,yfonksiyon,aralik);
polarplot(x,y)
function [x,y]=aranokta(xfonksiyon,yfonksiyon,aralik)
    x=[];
    y=[];
    for i=2:length(aralik)-1
        xSonuc=(xfonksiyon(aralik(i+1))-xfonksiyon(aralik(i-1)))/(2*abs(aralik(i)-aralik(i-1)));
        ySonuc =(yfonksiyon(aralik(i+1))-yfonksiyon(aralik(i-1)))/(2*abs(aralik(i)-aralik(i-1)));
        x(end+1)=xSonuc/sqrt(xSonuc^2+ySonuc^2);
        y(end+1)=ySonuc/sqrt(xSonuc^2+ySonuc^2);
    end
end
function [x,y]=ileriFark(xfonksiyon,yfonksiyon,aralik)
    x=[];
    y=[];
    for i=1:length(aralik)-1
        xSonuc=(xfonksiyon(aralik(i+1))-xfonksiyon(aralik(i)))/(abs(aralik(i+1)-aralik(i)));
        ySonuc =(yfonksiyon(aralik(i+1))-yfonksiyon(aralik(i)))/(abs(aralik(i+1)-aralik(i)));
        x(end+1)=xSonuc/sqrt(xSonuc^2+ySonuc^2);
        y(end+1)=ySonuc/sqrt(xSonuc^2+ySonuc^2);
    end
end
function [x,y]=geriFark(xfonksiyon,yfonksiyon,aralik)
    x=[];
    y=[];
    for i=2:length(aralik)
        xSonuc=(xfonksiyon(aralik(i))-xfonksiyon(aralik(i-1)))/(abs(aralik(i)-aralik(i-1)));
        ySonuc =(yfonksiyon(aralik(i))-yfonksiyon(aralik(i-1)))/(abs(aralik(i)-aralik(i-1)));
        x(end+1)=xSonuc/sqrt(xSonuc^2+ySonuc^2);
        y(end+1)=ySonuc/sqrt(xSonuc^2+ySonuc^2);
    end
end
function [x,y]=sonNokta(xfonksiyon,yfonksiyon,aralik)
    x=[];
    y=[];
    for i=1:length(aralik)-2
        xSonuc=(-3*xfonksiyon(aralik(i))+4*xfonksiyon(aralik(i+1))-xfonksiyon(aralik(i+2)))/(2*(abs(aralik(i+1)-aralik(i))));
        ySonuc =(-3*yfonksiyon(aralik(i))+4*yfonksiyon(aralik(i+1))-yfonksiyon(aralik(i+2)))/(2*(abs(aralik(i+1)-aralik(i))));
        x(end+1)=xSonuc/sqrt(xSonuc^2+ySonuc^2);
        y(end+1)=ySonuc/sqrt(xSonuc^2+ySonuc^2);
    end
    for i=length(aralik)-1:length(aralik)
        xSonuc=(-3*xfonksiyon(aralik(i))+4*xfonksiyon(aralik(i-1))-xfonksiyon(aralik(i-2)))/(2*(abs(aralik(i)-aralik(i-1))));
        ySonuc =(-3*yfonksiyon(aralik(i))+4*yfonksiyon(aralik(i-1))-yfonksiyon(aralik(i-2)))/(2*(abs(aralik(i)-aralik(i-1))));
        x(end+1)=xSonuc/sqrt(xSonuc^2+ySonuc^2);
        y(end+1)=ySonuc/sqrt(xSonuc^2+ySonuc^2);
    end
end


