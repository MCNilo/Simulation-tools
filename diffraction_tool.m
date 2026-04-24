function out=diffraction_tool(Lambda,pupil,y,N,z)
%Code created by Hai-Jun Wu on Jan-2020
%pupil is input 2d complex amplitude of light field
%Lambda is the wavelength of beam
%y is the Y-axis coordinate of input beam
%N is the pixel number of input and output field (Odd points)
% z is diffraction distance

[f_x,~] = fftfreq(y); %spatial k frequencies
f_x = (1/(2*pi))*fftshift(f_x); %must go from - nquist to + nquist
%f_x = -f_s/2:f_s/(N-1):f_s/2;%spatial frequencies
[X1,Y1]=meshgrid( f_x, f_x);%fourier mesh
r1=sqrt(X1.^2+Y1.^2);%radial coordinate
H=exp(1i*2*pi*sqrt(1/Lambda^2-r1.^2)*z);%transfer function


F=fft2(pupil);          %fourier of input illum
Fs=fftshift(F).*H;      %output fourier field
out=ifft2(ifftshift(Fs));  %inverse fourier transform

end