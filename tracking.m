%TRACKING OF A SINGLE VEHCILE

%read data in from WAV file
%[y,Fs] = audioread('high.wav');

%DEFINE PARAMETERS
%length of STFT in samples
length=4000;
timeStep=length/Fs;
%frames calculation
frames = round(size(y)/length);
frames = frames(1)-1;
%Create empty arrays to store frequency and sample array
tracked_speed = zeros(frames,1);
speed=0;
speedLimit=0;
frequency=0;
sample_Array = zeros(length,1);
%Create bins
SNR=500;
bins = ((timeStep)^2)*431.01;

%Tracking calculation
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
    if max_FFT>SNR
        if abs(frequency-max_FFT_index)<=round(bins)
            speed=(frequency*Fs/length)/47.89;
            if speed>=speedLimit
                tracked_speed(n)=speed;
            end
        else
            speed=0;
        end
    end
     frequency=max_FFT_index;
end
plot(tracked_speed);
