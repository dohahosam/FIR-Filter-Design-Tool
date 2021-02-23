rng default
wform = ecg(500);

x = wform' + 0.25*randn(500,1);
d = designfilt('lowpassfir', ...
    'PassbandFrequency',0.15,'StopbandFrequency',0.2, ...
    'PassbandRipple',1,'StopbandAttenuation',60, ...
    'DesignMethod','equiripple');
y = filtfilt(d,x);
y1 = filter(d,x);

subplot(2,1,1)
plot([y y1])
title('Filtered Waveforms')
legend('Zero-phase Filtering','Conventional Filtering')

subplot(2,1,2)
plot(wform)
title('Original Waveform')