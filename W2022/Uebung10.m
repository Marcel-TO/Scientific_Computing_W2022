%%
% Sunspot

% Häufigkeit von Sonnenflecken
%data = readmatrix('Sunspot.csv');
%Alternativ:
data=dlmread('W2021\Sunspot.csv');
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
%plot(f, a);

%%
% Gitarre
% Audiosignal einer Gitarre
[x Fs] = audioread('W2021\Gitarre.wav');
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

%%
% Kobe Erdbeben
data = readmatrix('W2021\Kobe.csv');
Fs = 1;
cwt(x, Fs); % ~0.09Days with 14mHz