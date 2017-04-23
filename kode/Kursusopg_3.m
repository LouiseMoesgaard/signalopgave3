%% Opgave 1a:

% Udleveret kode af Kurt (ogs? anvendt i kursusopgave 2): 
recObj = audiorecorder(8000, 16, 2); % Lav et Recorderobject.
get(recObj) 
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);           % Optag stemme i 5 sek.
disp('End of Recording.'); 
play(recObj);                        % Afspil optagelse.
myRecording = getaudiodata(recObj);% Gem data i et "double-precision" array.

y = awgn(myRecording,60); 

figure(1)
subplot(4,1,1)
plot(myRecording);                   % Plot wave-kurven.
title('Tidsdom?ne'), ylabel('x(n)'), xlabel('n');

subplot(4,1,2)
FFTKJER = fft(myRecording,40000);    % Frekvensanalyse med fft().
plot(abs(FFTKJER))
title('Frekvensdom?ne'), ylabel('X(k)'), xlabel('k');

subplot(4,1,3)                       % kurve over spectrogram.
spectrogram(myRecording, kaiser(256,5), 220, 512, 8e3, 'yaxis')
colormap jet
title('Spectrogram');

subplot(4,1,4)
spectrogram(y,kaiser(256,5), 220, 512, 8e3, 'yaxis')
colormap jet
title('Spectrogram med st?j');

%% Opgave 1b:

% Lavpasfilter: 

xnoise = filter(b,1,y);

figure(1)
subplot(3,1,1)
plot(xnoise);                   % Plot wave-kurven.
title('Tidsdom?ne'), ylabel('x(n)'), xlabel('n');

subplot(3,1,2)
FFTKJER = fft(xnoise,40000);    % Frekvensanalyse med fft().
plot(abs(FFTKJER))
title('Frekvensdom?ne'), ylabel('X(k)'), xlabel('k');

subplot(3,1,3)                       % kurve over spectrogram.
spectrogram(xnoise, kaiser(256,5), 220, 512, 8e3, 'yaxis')
colormap jet
title('Spectrogram');


%% Opgave 2:

% Udleveret kode af Kurt (ogs? anvendt i kursusopgave 2): 
recObj = audiorecorder(8000, 16, 2); % Lav et Recorderobject.
get(recObj) 
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);           % Optag stemme i 5 sek.
disp('End of Recording.'); 
play(recObj);                        % Afspil optagelse.
myRecording = getaudiodata(recObj);% Gem data i et "double-precision" array.


figure(1)
subplot(4,1,1)
plot(myRecording);                   % Plot wave-kurven.
title('Tidsdom?ne'), ylabel('x(n)'), xlabel('n');

subplot(4,1,2)
FFTKJER = fft(myRecording,40000);    % Frekvensanalyse med fft().
plot(abs(FFTKJER))
title('Frekvensdom?ne'), ylabel('X(k)'), xlabel('k');

subplot(4,1,3)                       % kurve over spectrogram.
spectrogram(myRecording, kaiser(256,5), 220, 512, 8e3, 'yaxis')
colormap jet
title('Spectrogram');


%% Opgave 2b: 
% kode fra Rabia
recObj = audiorecorder(25000,16,2);
get(recObj)

recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj,4);
disp('End of recording.');

play(recObj);
myRecording3 = getaudiodata(recObj);

figure(1)
subplot(2,1,1),plot(myRecording);

subplot(2,1,2)
FFTKJER = fft(myRecording,25000);
plot(abs(FFTKJER))

fsample = 25000;
N = 101;
fcH = 950;
fcL = 800;
WcH = 2*pi*fcH/fsample;
WcL = 2*pi*fcL/fsample;
Wc = WcH-WcL;

hn(0+(N+1))=Wc/pi;
for index = 1:N;
    hn(index+(N+1)) = sin(WcH*(index))/((index)*pi)-sin(WcL*(index))/((index*pi))
end;
for index = -N:-1;
    hn(index+(N+1)) = sin(WcH*(-index))/((index)*pi)-sin(WcL*(-index))/((-index)*pi);
end;
hn



%% Opgave 3:

figure()
subplot(3,1,1)
plot(Brumsignal);                   %Brumsignal = signal fra Kurt
title('Tidsdom?ne'), ylabel('x(n)'), xlabel('n');

subplot(3,1,2)
FFTKJER = fft(Brumsignal,40000);    % Frekvensanalyse med fft().
plot(abs(FFTKJER))
title('Frekvensdom?ne'), ylabel('X(k)'), xlabel('k');

subplot(3,1,3)                       % kurve over spectrogram.
spectrogram(Brumsignal, kaiser(256,5), 220, 512, 8e3, 'yaxis')
colormap jet
title('Spectrogram');

%% Opgave 4:

%% Opgave 5:
