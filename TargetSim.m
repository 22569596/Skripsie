%Simulate Radar Signal
%Vehicle Speed and Distance

s1 = 60;
f1 = 60*47.98;
t = 0.1:1/44100:35.7004;
car = (t/35).*chirp(t,3000,15,3250);
motorbike = (t/35).*chirp(t,2750,15,3000);
c = awgn(car,0.01)+awgn(motorbike,0.01);
c=c';
