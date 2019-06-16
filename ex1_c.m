close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

% Informações necessárias

ecg = load('ECG_noise.txt');
fs = 1200; % frequência de amostragem
fc = (60/(1200/2)) - 0.05;

%{
Questão I.
c) Projetar um filtro FIR para a remoção do ruído de 60Hz do sinal de ECG.  
Testar e comparar as diferentes janelas: Retangular, Bartlett, Hamming, Hann, Blackman e Kaiser. 
%}

L = 60;

% filtro retangular

janela_retangular = rectwin(L+1);
retangular = fir1(L, fc, 'low', janela_retangular);
filtro_retangular = filter(retangular, 1, ecg);
figure(1);
plot(filtro_retangular);
title("Sinal no domínio do tempo filtrado por Retangular");
xlabel('Tempo (s)');
ylabel('Amplitude');

% filtro bartlett

janela_bartlett = bartlett(L+1);
bartlett = fir1(L, fc, 'low', janela_bartlett);
filtro_bartlett = filter(bartlett, 1, ecg);
figure(2);
plot(filtro_bartlett);
title("Sinal no domínio do tempo filtrado por Bartlett");
xlabel('Tempo (s)');
ylabel('Amplitude');

% filtro hammming 

janela_hamming = hamming(L+1);
hamming = fir1(L, fc, 'low', janela_hamming);
filtro_hamming = filter(hamming, 1, ecg);
figure(3);
plot(filtro_hamming);
title("Sinal no domínio do tempo filtrado por Hamming");
xlabel('Tempo (s)');
ylabel('Amplitude');

% filtro hann

janela_hann = hann(L+1);
hann = fir1(L, fc, 'low', janela_hann);
filtro_hann = filter(hann, 1, ecg);
figure(4);
plot(filtro_hann);
title("Sinal no domínio do tempo filtrado por Hann");
xlabel('Tempo (s)');
ylabel('Amplitude');

% filtro blackman

janela_blackman = blackman(L+1);
blackman = fir1(L, fc, 'low', janela_blackman);
filtro_blackman = filter(blackman, 1, ecg);
figure(5);
plot(filtro_blackman);
title("Sinal no domínio do tempo filtrado por Blackman");
xlabel('Tempo (s)');
ylabel('Amplitude');

% filtro kaiser

janela_kaiser = kaiser(L+1);
kaiser = fir1(L, fc, 'low', janela_kaiser);
filtro_kaiser = filter(kaiser, 1, ecg);
figure(6);
plot(filtro_kaiser);
title("Sinal no domínio do tempo filtrado por Kaiser");
xlabel('Tempo (s)');
ylabel('Amplitude');

% espectro dos sinais filtrados

figure(7);
subplot(6,1,1);
my_fft(filtro_retangular, fs);
title("Espectro do sinal filtrado por Retangular");
subplot(6,1,2);
my_fft(filtro_bartlett, fs);
title("Espectro do sinal filtrado por Bartlett");
subplot(6,1,3);
my_fft(filtro_hamming, fs);
title("Espectro do sinal filtrado por Hamming");
subplot(6,1,4);
my_fft(filtro_hann, fs);
title("Espectro do sinal filtrado por Hann");
subplot(6,1,5);
my_fft(filtro_blackman, fs);
title("Espectro do sinal filtrado por Blackman");
subplot(6,1,6);
my_fft(filtro_kaiser, fs);
title("Espectro do sinal filtrado por Kaiser");