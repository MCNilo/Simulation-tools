% Calculates Fourier frequencies from spatial mesh, result is in 1/m

function [k,dk] = fftfreq(x)
nx = length(x); dx = abs(x(2)-x(1));

if mod(nx,2)==0
	k = 2*pi*ifftshift(linspace(-nx/2,nx/2-1,nx))*1/(dx*nx); 
else
	k = 2*pi*ifftshift(linspace(-(nx-1)/2,(nx-1)/2,nx))*1/(dx*nx);
end
dk = k(2)-k(1);
end
