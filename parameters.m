% Parameters File

% Data in from WAV file
[y,Fs] = audioread('real_car_testE.wav');

% Length of STFT in samples
length=4000;
timeStep=length/Fs;

% Frames calculation
frames = round(size(y)/length);
frames = frames(1)-1;

% Create empty arrays to store frequency and sample array
tracked_speed = zeros(frames,1);
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
Rmax=50;
d=4;
R=Rmax;

% Cosine Angle Coeff
cosineAngle=0;
