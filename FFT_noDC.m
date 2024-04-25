function [f,FT] = FFT_noDC(data)
% calculates the Fast Fourier Transform (FFT) of a given signal segment 
%and get rids of the DC component in the transform
% and returns the frequency vector 'f' in (radians per sample) 
% andd the transformed signal FT
N = length(data);
FT = fft(data);
FT(1) = 0; %Remove DC offset 
FT = fftshift(FT);
index = ceil(-N/2):floor(N/2)-1;
f = 2*pi*index/N; %normalised w (radians per sample) 
end

