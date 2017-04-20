function snr = calssnr(speech,qspeech)
qerr=speech-qspeech;
snr=10*log10(sum(speech.*speech)/sum(qerr.*qerr));