function IFT = NiceIFFT(FT)
% This function performs the Inverse Fast Fourier Transform (iFFT) 
% on the FFT data returned by the NiceFFT function to recover the original signal.
%
% Inputs:
%   FT - the Fourier Transform data obtained from NiceFFT function (already fftshifted).
%
% Outputs:
%   data - the reconstructed time-domain signal.

% Reverse the fftshift applied in NiceFFT
FT_unshifted = ifftshift(FT);

% Compute the inverse FFT to get the original signal
IFT = ifft(FT_unshifted, 'symmetric');  % Using 'symmetric' to enforce real output

end