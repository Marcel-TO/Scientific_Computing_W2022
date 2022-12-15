%%
% Aufgabe 1
% Plotten Audiosignal einer Gitarre
[x Fs] = audioread('Data/Gitarre.wav');
Ts = 1/Fs;
N = length(x);
T = N*Ts;
t = [0:Ts:T-Ts];
plot(t,x);

%%
% Audiosignal einer Gitarre
[x Fs] = audioread('Data/Gitarre.wav');
%soundx(x, Fs);
F = Fs/N;
f = [0:F:Fs/2];
y = fft(x);
y = y(1:N/2+1);
a = abs(y);
bar(f, a); % Es wird ein A gespielt (440 Hz) + Obertöne

%%
% Sunspot

% Häufigkeit von Sonnenflecken
%data = readmatrix('Sunspot.csv');
%Alternativ:
data=readmatrix('Data/Sunspot.csv');
t = data(:,1);
x = data(:,2);
plot(t,x) % Plot im Zeitbereich

Fs = 1;
N = length(x);
F = Fs / N;
f = [0:F:Fs/2];
y=fft(x);
y = y(1:N/2+1);
a=abs(y);
bar(f, a)
% Allgemein:
%plot(f, a);

%%
% Kobe Erdbeben
data = readmatrix('Data/Kobe.csv');
Fs = 1;
Ts = 1/Fs;
N = length(data);
T = N * Ts;
t = [0:Ts:T-Ts];
% plot(t,data);
title("Zeitbereich");

nexttile; % Another Plot in same section
cwt(data, Fs); % ~0.09Days with 14mHz