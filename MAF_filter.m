function [MAFFilteredSignal,MSEFiltered] = MAF_filter(NoisySignal,OriginalSig,Lenghts,Passes)
% This function performs moving average filtering with various filter lengths (M)
% and number of passes (N) on noisy segments. It returns the filtered
% signal
%   MAFFilteredSegments - Cell array containing filtered segments (same size as NoisySignal)
%   MSEFiltered - Matrix containing mean squared errors (size NxM)

%Initialize Filter cell and MSE cell 
MAFFilteredSignal = cell(Passes,Lenghts);
MSEFiltered = cell(Passes,Lenghts);

%get number of elemtns within the signal 
numberofelements = length(NoisySignal);

%loop through filter lenghts M 
for M = 1:Lenghts
    %Loop through number of passes N

    for N = 1:Passes
        %assign the signal to ensure sizes of arrays are always the same in
        %if statement for else condition
        MAFFilteredSignal{N,M} = NoisySignal;
        %Loop through all datapoints to apply MAF of length M and the
        %number of passes N
        %ignore the two points at the boundaries
        for i= 2:(numberofelements-1)
            %first pass use the noisy signal, then each time Filtered
            %signal in the previous pass so N-1 
            if N == 1
                MAFFilteredSignal{N,M}(i) = (NoisySignal(i-1) + NoisySignal(i) + NoisySignal(i+1))/M;
            else

                MAFFilteredSignal{N,M}(i) = (MAFFilteredSignal{N-1,M}(i-1) + MAFFilteredSignal{N-1,M}(i)+ MAFFilteredSignal{N-1,M}(i+1))/M;
            end
        end
        % Calculate mean squared error for the current pass and filter length
        MSEFiltered{N,M} = mean((MAFFilteredSignal{N,M}-OriginalSig).*(MAFFilteredSignal{N,M}-OriginalSig));
    end
end


       
end

