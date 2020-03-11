clear all;
close all;

m_phase         = 0;
frequency       = 500;
fs              = 44100

signal          = [];

samples         = 2^8;

initial         = 1;

for k=1:3

  frequency     = k*frequency
  phaseInc      = 2*pi*frequency/fs;  

  if(k == 1)
    initial     = 1;
  else
    initial     = ((k-1)*samples) + 1; 
  endif

  for i=initial:k*samples

     signal(i)  = sin(m_phase); 
     m_phase    = m_phase + phaseInc; 

  end

  m_phase       = mod(m_phase, 2*pi);

endfor

subplot(211);
plot(signal);

N               = 512;

X               = fftshift(fft(signal,N));

df              = fs / N;
sampleIndex     = -N/2:N/2-1;
relative_f      = sampleIndex * df;

subplot(212);
plot(relative_f, abs(X));
axis([min(relative_f) max(relative_f)])
