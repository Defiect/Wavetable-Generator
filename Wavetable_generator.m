% IMPORTANT
Name = 'Buzz'
% IMPORTANT
% !!!!!!!
% Give this Wavetable a name, for each new function you want to use,
% you should give it a unique name - it will create a directory
% each time you run the script

% Creates subdirectory Wavetable in the current Matlab Path,
% likely where the script is executed, then creates a furthe0r subdirectory
% with the same name as provided above

mkdir(fullfile('Wavetables', Name))

% Sampling rate (suggested to keep at 384kHz and downsample later)
Fs = 384000;

% Select the starting and stopping values of function to sample between
start = 0;
stop = 4.8722;


% Select the fundamental frequency that you want the sample to end up with
% For optimal use in Serum, leave this at 187.5 to create clips with 2048
% samples per waveform
F = 187.5; % This is 384000/2048

% Size of Wavetable and number of iterations
n = 10

for j = 1:n

% Function to define waveform
ff = @(x)abs(tanh(x.^acsch(1./(-x+j*tan((1.5*x+5))))));

% Generate array of values of function
y = ff(start:F*(stop - start)/Fs:stop);

% Remove the last element of the array, as Matlab counts the end as a
% sample
y(end) = [];

% Remove any DC offset
y = detrend(y,0);

% Normalize it to between -1 and 1
y = 2*(y - min(y))/(max(y) - min(y)) - 1;



% Code to create repetitions of waveforms, currently unused
% w = repmat(y,1,500);
% size(w);





% Write the waveform to the directory of the wavetable
filename = "Wavetables\" + Name + '\' + "Waveform" + j + ".wav"

audiowrite(filename,y,Fs,'BitsPerSample',32);

end

length(y)