Rs=23; % start reading from row Rs
Re=1000002; % Until Re

TJ3=csvread('s-adv.csv',Rs,0,[Rs,0,Re,2]);
time = TJ3(:, 1);
CH1 = TJ3(:, 2);
CH2 = TJ3(:, 3);
figure
plot(time, CH1)
title('S ADV; Fs is 50KHz ')
figure
plot(time, CH2)
title('S ADV; Fs is 50KHz ')
