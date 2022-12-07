%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Spektralanalyse

x = [0,0.426777,0.25,-0.0732233,0,0.0732233,-0.25,-0.426777]; % SignalVektor
Fs = 8; % Sampling-Frequenz
Ts = 1/Fs; % Sampling-Intervall
N = length(x); % Länge des Signalvektors
T = N*Ts; % Dauer des Signals;
t = [0:Ts:T-Ts]; % Zeit-Vektor
plot(t,x, '-p'); % Plot
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Fourier-Transformation

x = [0,0.426777,0.25,-0.0732233,0,0.0732233,-0.25,-0.426777];
Fs = 8;
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
%plot(f, a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Signal.csv Beispiel
x=readmatrix('Signal.csv');
Fs = 8;
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
%plot(f, a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Zusammenfassung
% Zeit-Bereich
Ts = 1 / Fs; % Sampling-Intervall
N = length(x); % Länge des SignalVektors
T = N * Ts; % Signaldauer
t = [9: Ts:T-Ts]; % Zeit-Vektor
plot(t,x) % Plot im Zeitbereich

% Frequenz-Bereich
F = Fs / N; % Frequenz-Auflösung
f = [0:F:Fs/2]; % Frequenz-Vektor
y=fft(x); % Fourier-Transformierte
y = y(1:N/2+1); 
a=abs(y); % Amplituden-Vektor
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Häufigkeit von Sonnenflecken
%data = readmatrix('Sunspot.csv');
%Alternativ:
data=dlmread('Sunspot.csv'));
t = data(:,1);
x = data(:,2);
plot(t,x) % Plot im Zeitbereich

Fs = 8;
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
% plot(f, a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Audiosignal einer Gitarre
[x Fs] = audioread('Gitarre.wav');
%soundx(x, Fs);
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
%plot(f, a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Inverse Fourier-Transformation
y=fft(y);
y=y(1:N/2+1);
y=[y; flip(conj(y(2:end-1)))]; %(N gerade)
y=[y; flip(conj(y(2:end)))]; %(N ungerade)
x=ifft(y);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Global Tonfolge darstellen
[x Fs] = audioread('W2021\FurElise.wav');
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
%plot(f, a);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Short-Time-Fourier-Transform (STFT)
[x Fs] = audioread('FurElise.wav');
stft(x,Fs, 'Window', rectwin(128), 'OverlapLength', 0);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Wavelets
% cwt -> continous wavelet transformation
[x Fs] = audioread('W2021\FurElise.wav');
cwt(x,Fs);
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
% Kobe Erdbeben begonnen?
%data = readmatrix('Kobe.csv');
%Alternativ:
x=dlmread('Kobe.csv');
Fs = 1;
cwt(x, Fs); % ~0.09Days with 14mHz
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
