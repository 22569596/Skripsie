%STFT plot

%read data in from WAV file
%[y,Fs] = audioread('real_sensor1.wav');
Fs=44100;
%Spectrum plot
hold on
z=zeros(Fs,1);
for l=10:1:10
    for x = 1:1:Fs
        z(x) = c((l-1)*Fs+x); 
    end
    stem(abs(fft(z)));
end
hold off