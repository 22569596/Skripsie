%TRACKING OF A SINGLE VEHCILE
num=1;
%Tracking calculation
for n=startFrame:1:endFrame
    max_FFT_index=0;
    max_FFT=0;
    for b = 1:1:length
       sample_Array(b)=y(b+length*(n-1)-(overlap*length)*(n-1));
    end
    g=abs(fft(sample_Array));
    for x =(round(speedLimit*19.49*length/Fs)):1:length/2
        if max_FFT<g(x)
           max_FFT=g(x);
           max_FFT_index=x;
        end
    end
    if max_FFT>SNR
        if abs(frequency-max_FFT_index)<=round(bins)
            speed=(frequency*Fs/length)/19.49;
            if speed>=speedLimit
                tracked_speed1(num)=speed;
                num=num+1;
            end
        else
            
        end
    end
     frequency=max_FFT_index;
end
plot(tracked_speed1);
title('Measured Speed');
xlabel('Samples(n)');
ylabel('Speed(km/h)');
grid on;
%spectrogram(y,kaiser(256,5),220,512,Fs,'yaxis')