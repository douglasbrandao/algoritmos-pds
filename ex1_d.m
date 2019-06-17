close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

% Informações necessárias

ecg = load('ECG_noise.txt');
fs = 1200; % frequência de amostragem
t = (0:length(ecg)-1)/fs;

d = designfilt('bandstopiir','FilterOrder',2, 'HalfPowerFrequency1',59,'HalfPowerFrequency2',61,'DesignMethod','butter','SampleRate',fs);
fvtool(d,'Fs',fs);
buttLoop = filtfilt(d, ecg);
plot(t, buttLoop);
figure(3);
my_fft(buttLoop, fs);