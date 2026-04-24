function outoam=LGB(lambda,w0,x,y,Z,m,p)
[phi,r]=cart2pol(x,y);
k=2*pi/lambda;
zr=0.5*k*w0.^2;%Rayleigh range
uxs=sqrt(2*factorial(p)./(pi*factorial(abs(m)+p)));%normalizing constant
w=w0*sqrt(1 + (Z/zr).^2);%width of the gaussian
La=Laguerre(p,abs(m),2*r.^2./(w.^2));%Laguerre polinomial
% R=Z.*(1 + (zr./Z).^2);%curvature radius
R1 = Z./(Z.^2+zr^2);%inverse of curvature radius
Psi=(abs(m) + 2*p + 1).*atan(Z./zr);%Gouy phase
outoam=uxs*(1./w).*((sqrt(2)*r)./w).^abs(m).*exp(-(r.^2./w.^2)).*...
exp(1i*k*Z).*La.*exp((1i)*k*(r.^2.*R1./2)).*exp(1i*m*phi).*exp(-1i*Psi);

end