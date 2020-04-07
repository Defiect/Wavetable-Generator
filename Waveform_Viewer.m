% Function to define waveform
ff = @(x)abs(tanh(x.^acsch(1./(-x+j*tan((1.5*x+5))))));

% Select the starting and stopping values of function input to view
start = 0;
stop = 5;

% Create a plot of the function
figure
fplot(ff, [start stop]);