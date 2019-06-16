%{
Analisador de espectro de frequência
Créditos: Wagner Rambo
Link: https://www.youtube.com/watch?v=0GCFmVm8PWY
%}

function [S,frequencia] = ffft(x,fs)

normal = length(x);
aux = 0:normal-1;
periodo = normal/fs;
frequencia = aux/periodo;
S = fft(x)/normal;
fc = ceil(normal/2);
S = S(1:fc);

plot(frequencia(1:fc),abs(S));
title("Análise de espectro");
xlabel("Frequencia (Hz)");
ylabel("Amplitude");
grid on

end 