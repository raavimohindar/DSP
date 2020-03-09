fs  = 25;
t1  = 0:1/fs:1;
x   = t1;

P   = 512;
Q   = 1;

y   = resample(x,P,Q);
t2  = (0:(length(y)-1))*Q/(P*fs);

errorbar(t1, x, 0.05,'o')
hold on;
plot(t2,y,'o');
hold on;

xlabel('Time (s)')
ylabel('Signal')
legend('Original','Resampled', ...
    'Location','NorthWest')