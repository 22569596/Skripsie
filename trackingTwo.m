%read data in from WAV file
[y,Fs] = audioread('high.wav');

%DEFINE PARAMETERS
%length of STFT in samples
length=8000;
timeStep=length/Fs;
%frames calculation
frames = round(size(c)/length);
frames = frames(1)-1;
%Create empty arrays to store frequency and sample array
tracked_speed1 = zeros(frames,1);
tracked_speed2 = zeros(frames,1);
speed1=0;
speed2=0;
speedLimit=0;
f1=0;
xp=0;
sample_Array = zeros(length,1);
%Create bins Size and SNR
SNR=650;
%binSize = ((timeStep)^2)*431.01;
binSize=10;

%Tracking calculation
for n=1:1:frames
    max_FFT_index = [0 0];
    max_FFT = [0 0];
    Target = zeros(1,2);
    f1=1;
    obj1=zeros(1,2);
    obj2=zeros(1,2);
    num1=0;
    num2=0;
    average=0;
    avg1=0;
    avg2=0;
    for b = 1:1:length
       sample_Array(b)=c(b+length*(n-1));
    end
    g=abs(fft(sample_Array));
    
    %Check for Signals above SNR
    for x = 1:1:length/2
        if g(x)>SNR
                Target(f1) = x;
                f1=f1+1;
        end  
    end
    
    %Get average of Targets
    for x=1:1:numel(Target)
        average = average + Target(x);
    end
    average = average/numel(Target);
    
    %Split up array obj1
    for x=1:1:numel(Target)
        if Target(x)<average 
            obj1(x)=Target(x);
        end
    end
    
    %Split up array obj2
    for x=1:1:numel(Target)
        if Target(x)>average 
            obj2(x)=Target(x);
        end
    end 
    
    %Get average of new Array
    for x=1:1:numel(obj1)
        avg1 = avg1 + obj1(x);
        if obj1(x)>0
         num1=num1+1;
        end
    end
    avg1 = avg1/num1; 
    
    %Get average of new Array
    for x=1:1:numel(obj2)
        avg2 = avg2 + obj2(x);
        if obj2(x)>0
         num2=num2+1;
        end
    end
    avg2 = avg2/num2;
    
    speed1=(avg1*Fs/length)/47.98;
    if speed1>=speedLimit
       tracked_speed1(n)=speed1;
    end
    speed2=(avg2*Fs/length)/47.89;
    if speed2>=speedLimit
       tracked_speed2(n)=speed2;
    end
    
    Target(1);
    max_FFT_index(1) = Target(1);
    max_FFT_index(2) = Target(2);
end

hold off
plot(tracked_speed1);
hold on
plot(tracked_speed2);
