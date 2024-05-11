function [FT_filtered, MSE] = MeanFFTFilter(FT,origSig)  
% Reverse the fftshift to align the zero frequency component at the start of the array.
FT_unshifted = ifftshift(FT);
% Calculate magnitude of FFT and mean
    magnitude = abs(FT_unshifted);
    meanMagnitude = mean(magnitude);
    
    % Filter out components where magnitude is below the mean
    FT_filtered = FT; % Initialize FT_filtered with original FFT values
    FT_filtered(magnitude < meanMagnitude) = 0; % Set values below mean to zero
    FT_filtered = ifft(FT_filtered, 'symmetric');

    MSE = mean((FT_filtered - origSig).* (FT_filtered - origSig));
end