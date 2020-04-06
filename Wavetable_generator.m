% IMPORTANT
Name = 'Buzz'
% IMPORTANT
% !!!!!!!
% Give this Wavetable a name, for each new function you want to use,
% you should give it a unique name - it will create a directory
% each time you run the script


% Sampling rate
Fs = 384000;

% Size of Wavetable and number of iterations
n = 10

% Creates subdirectory Wavetable in the current Matlab Path,
% likely where the script is executed, then creates a further subdirectory
% with the same name as provided above

mkdir(fullfile('Wavetables', Name))


for j = 1:n

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


% Write the waveform to the directory of the wavetable
filename = "Wavetables\" + Name + '\' + "Waveform" + j + ".wav"

audiowrite(filename,y,Fs);

end