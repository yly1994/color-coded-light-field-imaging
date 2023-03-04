
load xielv10mm;
load Xrayshu10mm;
load Xrayheng10mm;


%%
xy7cm=xyoutput(XYZshu,XYZheng);
load Xrayshu16mm;
load Xrayheng16mm;


xy8cm=xyoutput(XYZshu,XYZheng);

ss=size(xy8cm,1);
for tm=1:ss
% tm=1;
    [aa,bb]=min(((xy8cm(tm,1)-xy7cm(:,1)).^2+(xy8cm(tm,2)-xy7cm(:,2)).^2).^(1/2)+((xy8cm(tm,3)-xy7cm(:,3)).^2+(xy8cm(tm,4)-xy7cm(:,4)).^2).^(1/2));
    numberx(tm)=bb;
    chayi(tm)=aa;
%     [aa,bb]=min(((xy8cm(tm,3)-xy7cm(:,3)).^2+(xy8cm(tm,4)-xy7cm(:,4)).^2).^(1/2));
%     numbery(tm)=bb;
end
sss=size(numberx,2);
xilvx=xielv10mm(numberx,1);xilvy=xielv10mm(numberx,2);
slopex= (reshape(xilvx, sss^(1/2), sss^(1/2)))';slopey= (reshape(xilvy, sss^(1/2), sss^(1/2)));

save slopex
save slopey

function [inputN]=xyoutput(XYZshu,XYZheng)
xshu=XYZshu(:,1)./(XYZshu(:,1)+XYZshu(:,2)+XYZshu(:,3));
yshu=XYZshu(:,2)./(XYZshu(:,1)+XYZshu(:,2)+XYZshu(:,3));
xheng=XYZheng(:,1)./(XYZheng(:,1)+XYZheng(:,2)+XYZheng(:,3));
yheng=XYZheng(:,2)./(XYZheng(:,1)+XYZheng(:,2)+XYZheng(:,3));
inputN=[xshu,yshu,xheng,yheng];
end


% outputN1=xielv(:,1);
% outputN2=xielv(:,2);
% yy=myNeuralNetworkFunction4(inputN);
% % yy(:,2)=myNeuralNetworkFunction4y(inputN);
% xilvx=yy(:,1);xilvy=yy(:,2);
