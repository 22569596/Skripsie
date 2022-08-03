%Read data from Doppler senser

%Design lowpass filter with cut-off at 450 Hz

lpFilt = designfilt('lowpassiir','FilterOrder',2, ...
         'PassbandFrequency',10,'PassbandRipple',1, ...
         'StopbandAttenuation',60,'SampleRate',8000)

sos = lpFilt.Coefficients
%fvtool(lpFilt)
%assign coff to a and b
b = [0.1032 0.2040 0.1032];
a = [1 -0.9865 0.4471];

%zplane(b,a)

%Magnitude response
H = freqz(b,a,'whole');
w = [0:0.01229:2*pi];
plot(w,20*log(abs(H)))

%read data 

%read data in from WAV file
[y,Fs] = audioread('high.wav');

%Spectrum plot
%stem(abs(fft(y)));
z=zeros(Fs,1);
for x = 1:1:Fs
 z(x) = y(160000+x);   
end
stem(20*log(abs(fft(z))));
s = filter(b,a,z);
stem((abs(fft(z))));
frequency = abs(fft(s));

avg = zeros(Fs,1);
average = 0;
for x = 1:1:Fs
 avg(x) = frequency(x);
 average = average + 20*log(avg(x));
end
average = average/Fs;
x=1:1:size(y);
plot(x/Fs,y);


