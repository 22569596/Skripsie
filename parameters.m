% Parameters File

% Data in from WAV file
[y,Fs] = audioread('acceleration.wav');

% Downsample audio file
downSampleRate = 1;
y = downsample(y,downSampleRate);
Fs = Fs/downSampleRate;
% Length of STFT in samples
length=14000;
timeStep=length/Fs;
overlap=0.1;

% Frames calculation
frames = round(size(y)/length);
frames = frames(1)-1;
startFrame=1;
endFrame=frames;
% Create empty arrays to store frequency and sample array
tracked_speed1 = [0 0];
tracked_speed2 = [0 0];
sample_Array = zeros(length,1);

% Create variables for speed calculation and Speed Limits
frequency=0;
speed=0;
speedLimit=20;

% Create bins
bins = ((timeStep)^2)*431.01;

% Signal to Noise Ratio
SNR=0.1;

% Tracking Flag
tracked=0;

% Maximum measuring distance and distance from road
Rmax=60;
d=7.5;
R=Rmax;

% Cosine Angle Coeff
cosineAngle=0;
