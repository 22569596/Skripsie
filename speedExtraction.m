%SPEED CALCULATIONS FROM SAMPLED DOPPLER RADAR

%read data in from WAV file
[y,Fs] = audioread('real_sensor1.wav');

% Define parameters
%length of STFT in samples
length=4000;
time_step=length/Fs;
%frames calculation
frames = round(size(y)/length);
frames = frames(1)-1;
%Create empty arrays to store frequency and sample array
speed = zeros(frames,1);
frequency=0;
sample_Array = zeros(length,1);


%STFT calculation
for n=1:1:frames
    max_FFT_index=0;
    max_FFT=0;
    for b = 1:1:length
       sample_Array(b)=y(b+length*(n-1));
    end
    g=abs(fft(sample_Array));
    for x = 1:1:length/2
        if max_FFT<g(x)
           max_FFT=g(x);
           max_FFT_index=x;
        end
    end
frequency = max_FFT_index*Fs/(length);
speed_kmh = frequency/47.98;
speed(n)=speed_kmh;
end

%Shift array to start at 0
c = zeros(frames,1);
for n=1:1:size(speed)
   c(n+1)=speed(n);
end
c(1)=0;

%Draw plot of speed
x_axis = 0:time_step:((1/Fs)*size(y));
plot(x_axis,c);
xlabel("Time(s)");
ylabel("Speed(km/h)");
title("Measured Speed from Doppler sensor");
grid on