function [FT_Filtered,MSEFiltered] = FFTFilter(FT,stepsize,maxThreshold,origSig)
%FFT fitler to remove signlas under certian threshold and convert frequency
%domain signal into time domain 

% Inputs:
%   FT - Fourier Transform data of a signal, expected to be fftshifted.
%   stepsize - Incremental step size for the thresholding process.
%   maxThreshold - Maximum threshold for filtering the frequency components.
%   origSig - Original time-domain signal used for error calculation.
%
% Outputs:
%   FT_Filtered - Cell array of filtered signals in the time domain.
%   MSEFiltered - Cell array of mean squared errors for each filtered signal.

% Reverse the fftshift to align the zero frequency component at the start of the array.
FT_unshifted = ifftshift(FT);
%create cells to store filte and MSE values 
FT_Filtered =[];
MSEFiltered =[];
% Loop through threshold values from 1 to maxThreshold with increments of stepsize.
for i = 10:stepsize:maxThreshold 
    FT_temp = FT_unshifted;
    %get rid of components below threshold 
    FT_temp(abs(FT_temp)<i) =0;
   
    % Compute the inverse FFT of the thresholded data to convert back to the time domain.
    FT_Filtered{end+1} = ifft(FT_temp, 'symmetric');  % Using 'symmetric' to enforce real output

    %Calculate MSE 
    MSEFiltered{end+1} = mean((FT_Filtered{end} - origSig).*(FT_Filtered{end} - origSig));
end




end

