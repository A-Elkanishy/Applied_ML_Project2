%% Script to extract the features and generate table
% change:
% File name  -> line 19
% File size  -> line 12
% Threshold  -> line 14   Quantization Threshold
% Mode       -> line 95   Either TxRx or Advertising
% Profile    -> line 96   Either Handsfree, Headset, Or Sensor
% Table Name -> line 102 & 103
%% intialization

Rs=23; % start reading from row Rs
Re=1000002; % Until Re

Threshold = 0.08; % 0.08 in Headset / 0.15 in Sensor
W=32000; % Window size of 640 ms

%% Load The File

TJ3=csvread('s-con2.csv',Rs,0,[Rs,0,Re,1]);
time = TJ3(:, 1);
CH1 = TJ3(:, 2);

% figure
% plot(time, CH1)
% title('Signal Plot')

%% 1-bit Quantization

x=CH1;

for i=1:length(x)
    
    if CH1(i)< Threshold
        x(i)=0;
    else
        x(i)=1;
    end
end

% figure
% plot(time, x)
% title('Connected Modes Quantized ; Fs is 50KHz ')

%% Area under the Quantized signal and the max value of the signal

Area=1:length(x)-W;
Peak = Area;
for i=1:length(Area)
    
    Area(i)= trapz(x(i:W+i));
    
    Peak(i)= max(CH1(i:W+i));
    
end

% figure
% plot(Aera)
% title('Area under the curve')

% figure
% plot(Peak)
% title('Max value')

%% Puls Counting

Inv=1:length(x)-1;

for i=1:length(x)-1
    Inv(i)=0;
    if x(i)<x(i+1)
    Inv(i)=1;
    end
end

Puls=1:length(Inv)-W+1;

for i=1:length(Puls)-1
    
    Puls(i)=sum(Inv(i:W+i));
    
end
 Puls(length(Puls))=Puls(length(Puls)-1);

% figure
% plot(Puls)
% title('Number of Pluses')

%% Mode & Device

Mode = strings(length(Area),1);
Device = Mode;

for i=1:length(Mode)
    
    Mode(i)='TxRx';
    Device(i)='Sensor';
    
end

%% Table Generation

S_TxRx2 = table(transpose(Area),transpose(Puls),transpose(Peak),categorical(Mode),categorical(Device));
S_TxRx2.Properties.VariableNames = {'Area','Puls','Peak','Mode','profile'};
