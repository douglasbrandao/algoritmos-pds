close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

% Informações necessárias

ecg = load('ECG_noise.txt');
fs = 1200; % frequência de amostragem

%{
Questão I.
a) Plotar o sinal no domínio do tempo e o espectro de frequência do sinal de ECG. 
Considerar neste exercício, a frequência de amostragem (Fs) igual a 1200 Hz.
%}

% Domínio do tempo do ECG
subplot(2,1,1);
plot(ecg);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal no domínio do tempo');

% Domínio da Frequencia do ECG

subplot(2,1,2);
my_fft(ecg, fs);
title('Sinal no domínio da frequência');