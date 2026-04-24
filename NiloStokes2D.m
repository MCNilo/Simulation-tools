%created by Nilo Mata Cervera on Apr 2024. Plots phase and intensity  
function [im] = NiloStokes2D(x,y,S1,S2,S3,tit,xlab,ylab,interpolation) 

    psi=pi/4+atan2(S2,S1)/2/pi; %wrap the phase to pi and normalize to 1
    psi(isnan(psi))=0; %Remove NAN from data
    H=psi*360; %phasefront determines the hue
    L = 0.5*S3+0.5; %s3 determines the lightness
    % L = (S3-min(min(S3))); L = 2*L/max(max(L))-1; %alternative
    S=1.0+0*L; % keep saturation constant
    [R,G,B] = hsl2rgb(H,S,L); % transfer HSL to RGB
A(:,:,1) = R; A(:,:,2) =  G; A(:,:,3) =  B;

if interpolation == 0
    im = image(x.', y.', A,'CDataMapping','scaled');
else
    im = image(x.', y.', A,'CDataMapping','scaled','Interpolation','bilinear'); 
end
set(gca,'YDir','normal') 
set(0, 'DefaultTextInterpreter', 'latex')
set(0, 'DefaultLegendInterpreter', 'latex')
set(0, 'DefaultAxesTickLabelInterpreter', 'latex')
xlabel(xlab);
ylabel(ylab);
title(tit)
ax = gca; 
ax.FontSize = 16; 
axis equal
axis tight
end