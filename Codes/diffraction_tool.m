function out=diffraction_tool(lambda,input,y,z)
% Performs basic propagation using angular spectrum method
%"input" is input 2d complex amplitude of light field (square matrix)
%"Lambda" is the wavelength of light
%"y" is the Y-axis coordinate of input beam (vector).
%"z" is diffraction distance

[f_x,~] = fftfreq(y); %spatial frequencies
[X1,Y1]=meshgrid( f_x/(2*pi), f_x/(2*pi)); %fourier mesh
r1=sqrt(X1.^2+Y1.^2);%radial coordinate
H=exp(1i*2*pi*sqrt(1/lambda^2-r1.^2)*z);%transfer function
out = ifft2(fft2(input).*H);

end
