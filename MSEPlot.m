function  MSEPlot(MSETable,N,Title)
% This function plots the Mean Squared Error (MSE) from a table.
% 
% Inputs:
%   MSETable: A MATLAB table containing the MSE data. Each column should
%             represent the MSE for a different lenght of M.
%   N: A vector of values for N. Represents number of passes
%   Title: A string to be used as the title of the plot.
%
% Output:
%   This function does not return any output, but it creates a plot of the
%   MSE data.

% Convert the MSE table to a numerical array for easier processing.
MSEData = table2array(MSETable);
% Create a new figure to display the plot.
figure;
% Loop through each column of the MSE data representing different filter 
% lenghts - M
for i = 1:length(MSEData)
    %Calculate the filter lenght for display 
    x = 2*i-1;
    % Plot the MSE data for the current M value.
    plot(N,MSEData(:,i));
    hold on;
    % Create a legend entry for the current MSE data set.
    Text(i) = sprintf("M = %d",x);

end
% Set the x-axis ticks to the values in the N vector. Ensures we see whole
% values 1,2,3... instead of fractions like 1.5 etc. in the x axis. Avoid
% confusion 
xticks(N);
grid on; grid minor;
%Crreate labels and legend 
xlabel("Number of passes - N");
ylabel("MSE magnitude");
legend(Text);
legend("Position", [0.16742,0.50389,0.15893,0.37738]);
% Create a title for the plot that combines the provided title string
text2 = "MSE for various Ns and Ms - ";
text2 = append(text2,Title);
title(text2);
end

