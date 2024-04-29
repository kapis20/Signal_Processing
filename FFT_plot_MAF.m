function FFT_plot_MAF(Title,FFT, f,line)

plot(f,abs(FFT),line);
xlabel("Normalized w (radians/sample)");
ylabel("Magnitude");
title(Title);

end

