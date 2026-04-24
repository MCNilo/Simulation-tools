function [S1,S2,S3]=stks_norm(El,Er)
%returns the normalized stokes parameters from the Electric field decomposed in circular basis

IR = abs(Er).^2; IL = abs(El).^2;

s0=IR+IL;
s1=2*real(conj(El).*Er);
s2=-2*imag(conj(El).*Er);
s3=IR-IL;

S1=s1./s0; %normalized Stokes parameters
S2=s2./s0;
S3=s3./s0;
S1(isnan(S1))=1;
S2(isnan(S2))=1;
S3(isnan(S3))=1;

end