close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

% Informações necessárias

ecg = load('ECG_noise.txt');
fs = 1200; % frequência de amostragem

%{
Questão I.
b) Projete um filtro IIR para remoção do ruído de 60Hz presente no sinal de ECG. 
Testar e comparar os diferentes métodos de design de filtros IIR: 
Butterworth, Chebyshev e Elíptico
%}

wp = 40/(fs/2); % largura de banda de passagem
ws = 72/(fs/2); % largura de banda de rejeicao
rp = 0.1; % ganho de banda de passagem
rs = 40; % atenuacao de rejeicao

% butterworth

[n1, wn1] = buttord(wp, ws, rp, rs);
[num1, den1] = butter(n1, wn1);
filtro_butter = filter(num1, den1, ecg);
figure(1);
plot(filtro_butter);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal filtrado Butterworth');

% chebyshev 1

[n2, wn2] = cheb1ord(wp, ws, rp, rs);
[num2, den2] = cheby1(n2, rs, wn2);
filtro_cheby1 = filter(num2, den2, ecg);
figure(2);
plot(filtro_cheby1);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal filtrado Cheby 1');

% chebyshev 2

[n3, wn3] = cheb2ord(wp, ws, rp, rs);
[num3, den3] = cheby2(n3, rs, wn3);
filtro_cheby2 = filter(num3, den3, ecg);
figure(3);
plot(filtro_cheby2);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal filtrado Cheby 2');

% eliptico

[n4, wn4] = ellipord(wp, ws, rp, rs);
[num4, den4] = ellip(n4, rp, rs, wn4);
filtro_eliptico = filter(num4, den4, ecg);
figure(4);
plot(filtro_eliptico);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal filtrado eliptico');

% espectros de frequência dos sinais

figure(5);
subplot(4,1,1);
my_fft(filtro_butter, fs);
title("Espectro do sinal filtrado por Butterworth");
subplot(4,1,2);
my_fft(filtro_cheby1, fs);
title("Espectro do sinal filtrado por Cheby1");
subplot(4,1,3);
my_fft(filtro_cheby2, fs);
title("Espectro do sinal filtrado por Cheby2");
subplot(4,1,4);
my_fft(filtro_eliptico, fs);
title("Espectro do sinal filtrado por Elíptico");


