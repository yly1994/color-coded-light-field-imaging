

D=50;
z=200:2:2500;
alpha=90/180*pi;
x=z.*cot(alpha);
f1=75;f2=25;
betat=atan(z./(D-x));
betaz=78/180*pi;
beta0=betat-betaz;

% l1=-cos(beta0)*((D-x)^2+z^2)^(1/2);
l1=-z./sin(betat).*cos(beta0);
l1h=1./(1./l1+1/f1);
y1=-l1.*tan(beta0);
beta1=(f1./(l1+f1));
y1h=y1.*beta1;

d=148.25;
l2=l1h-d;

l2h=42.86;
beta=(f1.*f2)./(f1.*l1-(l1+f1).*(d-f2));
y2h=y1.*beta;
beta2=atan((d.*tan(beta0)+y2h)./l2h);


betau=sin(betaz)./(beta);
beta1z=1./beta1;
beta0du=beta0./pi*180;
beta2du=beta2./pi*180;
jieguo=[beta0du,beta2du,y1h,y2h];



figure(1)
plot(z,beta2du)
xlim([min(z),max(z)])
figure(2)
plot(z,y2h)
xlim([min(z),max(z)])
figure(3)
dx=diff(z);
dy=diff(beta2du);
dydx=dy./dx;
yyaxis left
plot(z,beta2du)
yyaxis right
plot(z(2:end),dydx)
xlim([min(z),max(z)])
% 
% 
reso=0.005:0.005:0.05;
ss=size(reso,2);
for tm=1:ss
    figure(4)
jingdu(:,tm)=reso(tm)./dydx;
plot(z(2:end),jingdu(:,tm))
hold on
end



