close all % fechar todas figuras
clear all % limpar todas variáveis
clc % limpar janela de comando

ecg = load('ECG_noise.txt');
% ecg = ecg(1:10000); % caso queira alterar a quantidade de amostras
fs = 1200;

% filtro para retirar os 60hz do ecg


[n3, wn3] = cheb2ord(40/(fs/2), 72/(fs/2), 0.1, 40);
[num3, den3] = cheby2(n3, 40, wn3);
filtro_cheby2 = filter(num3, den3, ecg);
fileID = fopen('ecg-filtrado.txt', 'w');
fprintf(fileID, '%f\r\n', filtro_cheby2);
fclose(fileID);

% lê o ecg filtrado novamente

ecg = load('ecg-filtrado.txt');

% declaração variáveis

batidas = 0;

% determinar bpm de um eletrocardiograma
% faz a contagem dos picos dominantes do sinal.
% os picos são definidos como amostras maiores que 1 e maiores que os dois
% picos que estão ao seu lado (esquerda e direita)

for i = 2 : length(ecg)-1 % inicia em 2 pois iremos comparar com valores anteriores (indice 0 matlab)
    if(ecg(i) > ecg(i-1) & ecg(i) > ecg(i+1) & ecg(i) > 2.5)
        batidas = batidas + 1;
    end
end

% divide as batidas encontradas pela duração do sinal em minutos

n = length(ecg);
duracao_segundos = n/fs;
duracao_minutos = duracao_segundos/60;
bpm = batidas/duracao_minutos;

% imprimir batidas e bpm no Command Window

batidas
bpm