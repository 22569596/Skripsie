%TRACKING OF A SINGLE VEHCILE
num = 1;
frequencyBin = 10;
BinRange = Length/frequencyBin;
DArray = zeros(BinRange,round(frames/(1-overlap)));
SNR=0.1;
%Tracking calculation
for n=startFrame:1:round(endFrame/(1-overlap))
    sample_Array = [0 0];
    for b = 1:1:Length
       sample_Array(b)=y(b+Length*(n-1)-(overlap*Length)*(n-1));
    end
    g=abs(fft(sample_Array));
    for i=1:1:BinRange
        for x =(1+(i-1)*frequencyBin):1:(i*frequencyBin)
            if SNR<g(x)
               DArray(i,n)=x;
            end
        end
     end
end