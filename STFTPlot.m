%STFT plot

%read data in from WAV file
[y,Fs] = audioread('real_sensor1.wav');

%Spectrum plot
hold on
z=zeros(Fs,1);
for l=1:1:5
    for x = 1:1:Fs
        z(x) = y((l-1)*Fs+x); 
    end
    stem(abs(fft(z)));
end
