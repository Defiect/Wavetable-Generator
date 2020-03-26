% Sampling rate
Fs = 384000;


for j = 1:10

% Function to define waveform
ff = @(x)abs(tanh(x.^acsch(1./(-x+j*tan((1.5*x+5))))));

% Generate array of values of function
y = ff(0:300/Fs:4.8722);

% Remove any DC offset
y = detrend(y,0);

% Normalize it to between -1 and 1
y = 2*(y - min(y))/(max(y) - min(y)) - 1

y(1)
y(end)
plot(y)

w = repmat(y,1,500);

size(y);
size(w);
filename = "waveform" + j + ".wav"

audiowrite(filename,y,Fs);

end