%%
% Spektralanalyse
x = [0 0.07 1 0.07 0 -0.07 -1];

% Sampling Frequenz
Fs = 8;

% Aus der Sampling-Frequenz bekommt man das Sampling-Intervall:
Ts = 1/Fs;

% Länge des Signalvektors:
N = length(x);

% Dauer des Signals:
T = N * Ts;

% Zeit-Vektor:
t = [0:Ts:T-Ts];

% Plotten des diskretisiertem Signal:
plot(t, x);

%%
% Signal-Vektor Beispiel

% Signal-Vektor
x = readmatrix("Data/Signal.csv");

% Sampling Frequenz
Fs = 1000;

% Aus der Sampling-Frequenz bekommt man das Sampling-Intervall:
Ts = 1/Fs;

% Länge des Signalvektors:
N = length(x);

% Dauer des Signals:
T = N * Ts;

% Zeit-Vektor:
t = [0:Ts:T-Ts];

% Plotten des diskretisiertem Signal:
plot(t, x);

%%
% Nicht-stationäre Signale -> Für Elise
[x Fs] = audioread('Data/FurElise.wav');
stft(x, Fs, 'Window', rectwin(128), 'OverlapLength', 0);
stft(x, Fs, 'Window', rectwin(4096), 'OverlapLength', 0);

%%
% Wavelet
[x Fs] = audioread('Data/FurElise.wav');
cwt(x, Fs);