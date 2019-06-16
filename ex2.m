[y, fs] = audioread('audio.mp3');
x = y + 2 * randn(length(y), 1);
periodo = 1/fs;
tempo = periodo * length(y);
t = linspace(0, tempo, length(y));

subplot(5,1,1);
plot(t, y);
title('Sinal original');

subplot(5,1,2);
tempo2 = periodo * length(x);
t2 = linspace(0, tempo2, length(x));
plot(t2, x);
title('Sinal com ruído');
audiowrite('ruido.wav', x, fs);

subplot(5,1,3);
my_fft(y, fs);
title('Frequência do sinal original');

subplot(5,1,4);