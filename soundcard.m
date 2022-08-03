len=8000;
frames = round(1574388/len)-1;
z = zeros(frames,1);
q = zeros(len,1);
for n=1:1:frames
    max_index=0;
    max=0;
    for b = 1:1:len
       q(b)=y(b+len*(n-1));
    end
    g=abs(fft(q));
    for x = 1:1:len/2
        if max<g(x)
           max=g(x);
           max_index=x;
        end
    end
frequency = max_index*44100/(len);
speed_kmh = frequency/47.98;
z(n)=speed_kmh;
end
plot(z);
xlabel("Time(s)");
ylabel("Speed(km/h)");
title("Measured Speed from Doppler sensor");
grid on