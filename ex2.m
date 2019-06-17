close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

% ler o áudio

[audio,fs] = audioread('teste.m4a');
periodo = 1/fs;
tempo = periodo * length(audio);
t = linspace(0, tempo, length(audio));

fc = [4000 10000]; % frequencias de corte
wn = fc/(fs/2); % normalizada
n = 1000; % ordem do filtro
den = 1; %  filtro fir então den = 1

janela = fir1(n, wn, 'stop');
filtro_retangular = filter(janela, den, audio);
audiowrite('testekarine.wav', filtro_retangular, fs); % após usar o filtro, é gravado um novo audio

% gráficos subplotados em uma janela

subplot(4,1,1);
plot(t, audio);
title('Sinal do áudio com ruído no domínio do tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4,1,2);
my_fft(audio, fs);
title('Frequência do sinal do áudio original com ruído');

subplot(4,1,3);
plot(t, filtro_retangular);
title('Sinal do áudio filtrado no domínio do tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4,1,4);
my_fft(filtro_retangular, fs);
title('Frequência do sinal filtrado');

% gráficos plotados em janela

figure(2);
plot(t, audio);
title('Sinal do áudio com ruído no domínio do tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');

figure(3);
my_fft(audio, fs);
title('Frequência do sinal do áudio original com ruído');

figure(4);
plot(t, filtro_retangular);
title('Sinal do áudio filtrado no domínio do tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');

figure(5);
my_fft(filtro_retangular, fs);
title('Frequência do sinal filtrado');

