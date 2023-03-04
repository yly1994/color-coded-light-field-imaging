function XYZ=XYZjisuan(SR)

    CIE_Std0 = CIE1931Std_XYZ; 
CIE_Std=CIE_Std0(63:371,:);


 [a,sample_num0]=size(SR);
 sample_num=sample_num0-1;

   
K=100/sum(CIE_Std(:,3));  
xCIE=size(CIE_Std,1);
as1=CIE_Std(1,1);asz=CIE_Std(xCIE,1);% CIE_Std
asas=as1:1:asz;
for tm=1:sample_num

SRx(:,tm)=interp1(SR(:,1),SR(:,tm+1),asas);
end

XYZ=zeros(sample_num,3);
for ii=1:sample_num
   Xt=K*sum(CIE_Std(:,2).*SRx(:,ii)); 
   Yt=K*sum(CIE_Std(:,3).*SRx(:,ii)); 
   Zt=K*sum(CIE_Std(:,4).*SRx(:,ii)); 
   XYZ(ii,:)=[Xt,Yt,Zt];
end
x=XYZ(:,1)./(XYZ(:,1)+XYZ(:,2)+XYZ(:,3));
y=XYZ(:,2)./(XYZ(:,1)+XYZ(:,2)+XYZ(:,3));
end

